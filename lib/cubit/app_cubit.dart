import 'package:compass_app/Modules/Global/globalScreen.dart';
import 'package:compass_app/Modules/Home/home.dart';
import 'package:compass_app/Network/Remote/apiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Modules/Authentication/login.dart';
import '../Modules/Host/host.dart';
import '../Modules/Settings/settings.dart';
import '../Modules/User Setup/user_setup.dart';
import '../Network/Local/cacheHelper.dart';
import '../Shared/Components/components.dart';
import 'package:intl/intl.dart';

import '../Shared/Constants/constants.dart';
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

  void changeIndex(index) {
    indexs = index;
    emit(BNBChangeState());
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

        navigateToAndFinish(context, Host());
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

  List<String>? headlines = [];
  Future<void> getPopularSearchHeadlines() async {
    var x = await psClient.getHeadlines();
    headlines = psClient.trimArticleTitles(x);
  }

  String now = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String searchQuery = '';
  List<dynamic> searchResults = [1];
  void search(value, context) {
    emit(LoadingSearchState());

    searchQuery = value;
    searchClient.searchForArticles(context).then((value) {
      searchResults = [];
      searchResults = value;
      emit(SuccessSearchState());
    }).catchError((e) {
      print(e);

      emit(ErrorSearchState());
    });
  }
}
