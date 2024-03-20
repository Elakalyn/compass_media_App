import 'package:compass_app/Modules/Global/globalScreen.dart';
import 'package:compass_app/Modules/Home/home.dart';
import 'package:compass_app/Modules/Host/host.dart';
import 'package:compass_app/Network/Remote/apiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Modules/Settings/settings.dart';
import '../Network/Local/cacheHelper.dart';
import '../Shared/Components/components.dart';
import 'package:intl/intl.dart';

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
        });
        await CacheHelper.saveData(key: 'uid', value: value.user?.uid);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Account created successfully!",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
        navigateToAndFinish(context, Host());
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
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content:
              Text("Login Success!", style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
        emit(SuccessLoginState());

        return value;
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      emit(ErrorLoginState());
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content:
              Text("User not found.", style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Wrong password provided for that user.",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
      }
      return null;
    }
  }

  var country = 'United Kingdom';
  List<String> countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Angola',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahrain',
    'Bangladesh',
    'Belarus',
    'Belgium',
    'Benin',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Guatemala',
    'Guinea',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Mali',
    'Malta',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Moldova',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Panama',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Togo',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];
  var dropdownValue = 'United Kingdom';
  void selectCountry(v, context) {
    dropdownValue = v;
    country = dropdownValue;
    ufclient.getArticle(context);
    emit(SetCountryState());
  }

  var headlines;
  Future<void> getPopularSearchHeadlines() async {
    var x = await psClient.getHeadlines();
    headlines = psClient.trimArticleTitles(x);
  }

  String now = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String searchQuery = '';
  List<dynamic> searchResults = [1];
  void search(value, context) {
    if(searchResults.isNotEmpty){
      searchResults.clear();
    }
    emit(LoadingSearchState());

    searchQuery = value;
    searchClient.searchForArticles(context).then((value) {
      emit(SuccessSearchState());
    }).catchError((e) {
      print(e);

      emit(ErrorSearchState());
    });
  }
}
