import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compass_app/Shared/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Modules/Authentication/login.dart';
import '../../Modules/Layout/layout.dart';
import '../../Network/Local/cacheHelper.dart';
import '../../Network/Remote/api_handling.dart';
import '../Components/components.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileCubitState> {
  UserProfileCubit() : super(UserProfileCubitInitial());
  static UserProfileCubit get(context) => BlocProvider.of(context);
  // Add topics/sources from here
  List<String> topics = [
    'politics',
    'sports',
    'space',
    'technology',
    'economy',
    'business',
  ];
  List<String> sources = [
    'BBC',
    'CNN',
    'reuters',
    'google News',
    'fox News',
    'NY Times',
  ];
  Widget imageBuilder(image) {
    switch (image) {
      // Topics
      case 'politics':
        return Image.asset('assets/images/politics.png');
      case 'sports':
        return Image.asset('assets/images/sports.png');
      case 'space':
        return Image.asset('assets/images/space.png');
      case 'technology':
        return Image.asset('assets/images/technology.png');
      case 'business':
        return Image.asset('assets/images/business.png');
      case 'economy':
        return Image.asset('assets/images/economy.png');
      // Sources
      case 'BBC':
        return Image.asset('assets/sources/BBC.png');
      case 'CNN':
        return Image.asset('assets/sources/CNN.png');
      case 'fox News':
        return Image.asset('assets/sources/foxNews.png');
      case 'google News':
        return Image.asset('assets/sources/GoogleNews.png');
      case 'NY Times':
        return Image.asset('assets/sources/NYTimes.png');
      case 'reuters':
        return Image.asset('assets/sources/Reuters.png');
    }
    return Text('null');
  }

  List<dynamic> selectedTopics = [];
  SelectTopic(String topic) {
    if (selectedTopics.contains(topic) == false) {
      selectedTopics.add(topic);
    } else if (selectedTopics.contains(topic)) {
      selectedTopics.remove(topic);
    }
    emit(TopicSelectionState());
  }

  // SOURCES

  List<dynamic> selectedSources = [];
  SelectSource(String source) {
    if (selectedSources.contains(source) == false) {
      selectedSources.add(source);
    } else if (selectedSources.contains(source)) {
      selectedSources.remove(source);
    }
    emit(SourceSelectionState());
  }

  Future<void> getProfile() async {
    print('GETTING PROFILE');
    emit(GetProfileLoadingState());
    // Access the specific document in the "users" collection
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    // Check if the document exists
    if (snapshot.exists) {
      selectedSources = snapshot.get('sources');
      selectedTopics = snapshot.get('topics');
      interuser = snapshot;

      emit(GetProfileSuccessState());
    } else {
      print('Document with UID $uid does not exist.');
      emit(GetProfileErrorState());
    }
  }

  setProfile(context) async {
    emit(SetProfileLoadingState());
    try {
      FirebaseFirestore.instance.collection('users').doc(uid).update({
        'topics': selectedTopics,
        'sources': selectedSources,
      });
      await UserProfileCubit.get(context).getProfile();
      navigateToAndFinish(context, Host());
      emit(SetProfileSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(SetProfileErrorState());
    }
  }

  var displayTopics = true;
  // COUNTRY SELECTION

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

    emit(SetCountryState());
  }

  Future<void> logout(context) async {
    await CacheHelper.removeData(
      key: 'uid',
    ).whenComplete(() {
      uid = null;
      selectedTopics.clear();
      selectedSources.clear();
      interuser = null;

      navigateToAndFinish(context, LoginScreen());
    });
  }

  void changeProfileGrid(v) {
    displayTopics = v;

    emit(ChangeProfileGridState());
  }
}
