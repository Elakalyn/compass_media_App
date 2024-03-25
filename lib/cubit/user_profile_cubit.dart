import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compass_app/Shared/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Modules/Authentication/login.dart';
import '../Modules/Host/host.dart';
import '../Network/Local/cacheHelper.dart';
import '../Network/Remote/apiService.dart';
import '../Shared/Components/components.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileCubitState> {
  UserProfileCubit() : super(UserProfileCubitInitial());
  static UserProfileCubit get(context) => BlocProvider.of(context);

  bool politicsTopic = false;
  bool sportsTopic = false;
  bool spaceTopic = false;
  bool technologyTopic = false;
  bool economyTopic = false;
  bool businessTopic = false;

  List<dynamic> selectedTopics = [];
  SelectTopic(String topic) {
    switch (topic) {
      case 'politics':
        politicsTopic = true;
        selectedTopics.add('politics');
        break;
      case 'sports':
        sportsTopic = true;
        selectedTopics.add('sports');

        break;
      case 'space':
        spaceTopic = true;
        selectedTopics.add('space');

        break;
      case 'technology':
        technologyTopic = true;
        selectedTopics.add('technology');

        break;
      case 'economy':
        economyTopic = true;
        selectedTopics.add('economy');

        break;
      case 'business':
        businessTopic = true;
        selectedTopics.add('business');

        break;
    }
    List<bool> topics = [
      politicsTopic,
      sportsTopic,
      spaceTopic,
      technologyTopic,
      economyTopic,
      businessTopic,
    ];
    countTopics(topics);
    emit(TopicSelectionState());
  }

  DeselectTopic(String topic) {
    switch (topic) {
      case 'politics':
        politicsTopic = false;
        selectedTopics.remove('politics');

        break;
      case 'sports':
        sportsTopic = false;
        selectedTopics.remove('sports');

        break;
      case 'space':
        spaceTopic = false;
        selectedTopics.remove('space');

        break;
      case 'technology':
        technologyTopic = false;
        selectedTopics.remove('technology');

        break;
      case 'economy':
        economyTopic = false;
        selectedTopics.remove('economy');

        break;
      case 'business':
        businessTopic = false;
        selectedTopics.remove('business');

        break;
    }
    List<bool> topics = [
      politicsTopic,
      sportsTopic,
      spaceTopic,
      technologyTopic,
      economyTopic,
      businessTopic,
    ];
    countTopics(topics);
    emit(TopicSelectionState());
  }

  int numbersOfTopics = 0;

  void countTopics(List<bool> boolList) {
    int topics = 0;
    for (bool value in boolList) {
      if (value == true) {
        topics++;
      }
    }
    numbersOfTopics = topics;
  }

  bool topicsAreSelected() {
    if (numbersOfTopics > 0) {
      return true;
    } else {
      return false;
    }
  }

  // SOURCES

  bool bbc = false;
  bool foxnews = false;
  bool cnn = false;
  bool reuters = false;
  bool nytimes = false;
  bool googlenews = false;
  List<dynamic> selectedSources = [];
  SelectSource(String source) {
    switch (source) {
      case 'bbc':
        bbc = true;
        selectedSources.add('bbc');

        break;
      case 'foxnews':
        foxnews = true;
        selectedSources.add('foxnews');

        break;
      case 'cnn':
        cnn = true;
        selectedSources.add('cnn');

        break;
      case 'reuters':
        reuters = true;
        selectedSources.add('reuters');

        break;
      case 'nytimes':
        nytimes = true;
        selectedSources.add('nytimes');

        break;
      case 'googlenews':
        googlenews = true;
        selectedSources.add('googlenews');

        break;
    }
    List<bool> sources = [
      bbc,
      foxnews,
      cnn,
      reuters,
      nytimes,
      googlenews,
    ];
    countSources(sources);
    emit(SourceSelectionState());
  }

  DeselectSource(String source) {
    switch (source) {
      case 'bbc':
        bbc = false;
        selectedSources.remove('bbc');

        break;
      case 'foxnews':
        foxnews = false;
        selectedSources.remove('foxnews');

        break;
      case 'cnn':
        cnn = false;
        selectedSources.remove('cnn');

        break;
      case 'reuters':
        reuters = false;
        selectedSources.remove('reuters');

        break;
      case 'nytimes':
        nytimes = false;
        selectedSources.remove('nytimes');

        break;
      case 'googlenews':
        googlenews = false;
        selectedSources.remove('googlenews');

        break;
    }
    List<bool> sources = [
      bbc,
      foxnews,
      cnn,
      reuters,
      nytimes,
      googlenews,
    ];
    countSources(sources);
    emit(SourceSelectionState());
  }

  int numbersOfSources = 0;

  void countSources(List<bool> boolList) {
    int sources = 0;
    for (bool value in boolList) {
      if (value == true) {
        sources++;
      }
    }
    numbersOfSources = sources;
  }

  bool sourcesAreSelected() {
    if (numbersOfSources > 0) {
      return true;
    } else {
      return false;
    }
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
    ufclient.getArticle(context);
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
