import 'dart:async';

import 'package:compass_app/Modules/Global/globalScreen.dart';
import 'package:compass_app/Modules/Home/home.dart';
import 'package:compass_app/Network/Remote/api_handling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Modules/Authentication/login.dart';
import '../../Modules/Layout/layout.dart';
import '../../Modules/Settings/settings.dart';
import '../../Modules/User Setup/user_setup.dart';
import '../../Network/Local/cacheHelper.dart';
import '../../Network/Remote/.apiKey.dart';
import '../Components/components.dart';
import 'package:intl/intl.dart';

import '../Constants/constants.dart';
import '../Models/ArticleModel/articleModel.dart';
import 'user_profile_cubit.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isViewable = true;
  void changeViewable() {
    if (isViewable == true) {
      isViewable = false;
    } else if (isViewable == false) {
      isViewable = true;
    }
    print(isViewable);

    emit(SuffixChangeState());
  }

  List<Widget> screens = [
    HomeScreen(),
    GlobalScreen(),
    SettingsScreen(),
  ];
  int indexs = 0;

  void changeIndex(index, context) {
    indexs = index;
    emit(BNBChangeState());
  }

  var selectedCategory = 'Politics';
  Future<void> selectCategory(category) async {
    if (category != selectedCategory) {
      selectedCategory = category;
      globalArticles.clear();
      await getGlobalArticles();
      emit(CategorySelectionState());
    } else {
      selectedCategory = 's';
      globalArticles.clear();
      await getGlobalArticles();
      emit(CategorySelectionState());
    }
  }

  Future<Object?> register(
      {required String email,
      required String password,
      required context,
      required String name}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      emit(LoadingRegisterState());
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        print(value.user?.uid);
        // CREATION OF USER-------------

        FirebaseFirestore.instance
            .collection('users')
            .doc(value.user?.uid)
            .set({
          'name': name,
          'email': email,
          'profile_image':
              'https://firebasestorage.googleapis.com/v0/b/car-app-410f4.appspot.com/o/vehicles_Icon.png?alt=media&token=0994d376-c08d-477d-aa48-f3290b0dc85d',
          'uid': value.user?.uid,
          'topics': null,
          'sources': null,
        });
        await CacheHelper.saveData(key: 'uid', value: value.user?.uid);
        uid = await CacheHelper.getData(key: 'uid');

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Account created successfully!",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
        navigateToAndFinish(context, TopicSelection());
        emit(SuccessRegisterState());
        return value;
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      emit(ErrorRegisterState());
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("The password provided is too weak.",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("The account already exists for that email.",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
              "Account creation failed. Please check your internet connection.",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<UserCredential?> loginUser(
    String email,
    String password,
    context,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      emit(LoadingLoginState());

      UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        print(value.user?.uid);
        await CacheHelper.saveData(key: 'uid', value: value.user?.uid);
        uid = CacheHelper.getData(key: 'uid');
        DocumentSnapshot snapshot =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        interuser = snapshot;
        await UserProfileCubit.get(context).getProfile();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 175, 247, 177),
          content:
              Text("Login Success!", style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));

        navigateToAndFinish(context, Layout());
        emit(SuccessLoginState());

        return value;
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      emit(ErrorLoginState());
      if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Invalid Credentials.",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
      }
      return null;
    }
  }

  void bookmark({
    required var title,
    required var urlToImage,
    required var source,
    required var content,
    required var category,
  }) {
    Map<String, dynamic> articleData = {
      'title': title,
      'urlToImage': urlToImage,
      'source': source,
      'content': content,
      'category': category,
    };
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('bookmarks')
        .add(articleData)
        .then((value) {
      emit(AddBookmarkState());
    });
  }

  Future<bool> checkBookmarkStatus(String title) async {
    final bookmarksCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('bookmarks'); // Specify the subcollection if applicable

    final snapshot =
        await bookmarksCollection.where('title', isEqualTo: title).get();

    if (snapshot.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> removeBookmark({required var title}) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('bookmarks')
        .where('title', isEqualTo: title)
        .get();

    final documents = querySnapshot.docs;

    if (documents.isNotEmpty) {
      final document = documents[0];
      final docRef = document.reference;

      docRef.delete().then((_) {
        emit(RemoveBookmarkState());
      }).catchError((error) {
        print("Error deleting document: $error");
        emit(ErrorBookmarkState());
      });
    } else {
      print("Document not found");
    }
  }

  // News Getters
  List<Articles> globalArticles = [];
  Future<void> getGlobalArticles() async {
    emit(LoadingGetArticlesState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'language': 'en',
        'apiKey': apiKey,
      },
    ).then((value) {
      var responseData = value.data as Map<String, dynamic>;
      ArticleModel articleModel = ArticleModel.fromJson(responseData);
      globalArticles = articleModel.articles!;
      emit(SuccessGetArticlesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetArticlesState());
    });
  }

  List<Articles> feedArticles = [];
  Future<void> getFeedArticles() async {
    emit(LoadingGetArticlesState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'language': 'en',
        'apiKey': apiKey,
      },
    ).then((value) {
      var responseData = value.data as Map<String, dynamic>;
      ArticleModel articleModel = ArticleModel.fromJson(responseData);
      feedArticles = articleModel.articles!;

      emit(SuccessGetArticlesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetArticlesState());
    });
  }

  Articles? globalCard;
  var worldFocus = 'Israel';
  Future<void> getGlobalCardArticle() async {
    emit(LoadingGetArticlesState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': worldFocus,
        'language': 'en',
        'apiKey': apiKey,
      },
    ).then((value) {
      var responseData = value.data as Map<String, dynamic>;
      ArticleModel articleModel = ArticleModel.fromJson(responseData);
      globalCard = articleModel.articles![0];
      emit(SuccessGetArticlesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetArticlesState());
    });
  }

  String categorizeArticle(title) {
    for (String keyword in politicalKeywords) {
      if (title.contains(keyword.toLowerCase())) {
        return 'politics'.toUpperCase();
      }
    }
    for (String keyword in businessKeywords) {
      if (title.contains(keyword.toLowerCase())) {
        return 'business'.toUpperCase();
      }
    }
    for (String keyword in entertainmentKeywords) {
      if (title.contains(keyword.toLowerCase())) {
        return 'entertainment'.toUpperCase();
      }
    }
    for (String keyword in sportsKeywords) {
      if (title.contains(keyword.toLowerCase())) {
        return 'sports'.toUpperCase();
      }
    }
    for (String keyword in spaceKeywords) {
      if (title.contains(keyword.toLowerCase())) {
        return 'space'.toUpperCase();
      }
    }
    for (String keyword in healthKeywords) {
      if (title.contains(keyword.toLowerCase())) {
        return 'health'.toUpperCase();
      }
    }
    for (String keyword in technologyKeywords) {
      if (title.contains(keyword.toLowerCase())) {
        return 'technology'.toUpperCase();
      }
    }
    return 'uncategorized'.toUpperCase();
  }

  Future<void> refresh() async {
    globalArticles.clear();
    feedArticles.clear();

    getFeedArticles();
    getGlobalArticles();
    getGlobalCardArticle();
  }

  var loadedHomeArticles = 15;
  bool homeDebounce = false;
  var homeScrollController = ScrollController();
  void homeLazyLoading() {
    if (homeDebounce) {
      return;
    }
    homeDebounce = true;

    homeScrollController.addListener(() async {
      var maxScroll = homeScrollController.position.maxScrollExtent;
      if (homeScrollController.offset == maxScroll) {
        print('loading more articles.');
        loadedHomeArticles = loadedHomeArticles + 15;
        if (loadedHomeArticles > feedArticles.length) {
          loadedHomeArticles = feedArticles.length;
        }
        emit(LoadingGetArticlesState());
        await Future.delayed(Duration(seconds: 1));
        emit(LoadMoreArticlesState());
      }
    });
  }

  var loadedGlobalArticles = 15;
  bool globalDebounce = false;
  var globalScrollController = ScrollController();
  void globalLazyLoading() {
    if (globalDebounce) {
      return;
    }
    globalDebounce = true;

    globalScrollController.addListener(() async {
      var maxScroll = globalScrollController.position.maxScrollExtent;
      if (globalScrollController.offset == maxScroll) {
        print('loading more articles.');
        loadedGlobalArticles = loadedGlobalArticles + 15;
        if (loadedGlobalArticles > globalArticles.length) {
          loadedGlobalArticles = globalArticles.length;
        }
        emit(LoadingGetArticlesState());
        await Future.delayed(Duration(seconds: 1));
        emit(LoadMoreArticlesState());
      }
    });
  }

  var loadedSearchArticles = 15;
  bool searchDebounce = false;
  var searchScrollController = ScrollController();
  void searchLazyLoading() {
    if (searchDebounce) {
      return;
    }
    searchDebounce = true;

    searchScrollController.addListener(() async {
      var maxScroll = searchScrollController.position.maxScrollExtent;
      if (searchScrollController.offset == maxScroll) {
        print('loading more articles.');
        loadedSearchArticles = loadedSearchArticles + 15;
        if (loadedSearchArticles > searchResults.length) {
          loadedSearchArticles = searchResults.length;
        }
        emit(LoadingGetArticlesState());
        await Future.delayed(Duration(seconds: 1));
        emit(LoadMoreArticlesState());
      }
    });
  }

  List<Articles> searchResults = [];
  void search(query) {
    if (query.toString().isNotEmpty) {
      searchResults.clear();
      emit(LoadingSearchState());
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': query,
          'language': 'en',
          'apiKey': apiKey,
        },
      ).then((value) {
        var responseData = value.data as Map<String, dynamic>;
        ArticleModel articleModel = ArticleModel.fromJson(responseData);
        searchResults = articleModel.articles!;
        emit(SuccessSearchState());
      }).catchError((error) {
        print(error.toString());
        emit(ErrorSearchState());
      });
    } else {
      searchResults.clear();
      emit(SuccessSearchState());
    }
  }
}
