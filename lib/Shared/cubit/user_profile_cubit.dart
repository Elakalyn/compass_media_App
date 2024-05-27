import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compass_app/Shared/Constants/constants.dart';
import 'package:compass_app/main.dart';
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
    'business',
    'health',
    'entertainment',
  ];
  List<String> sources = [
    'BBC News',
    'CNN',
    'Fox News',
    'NY Times',
    'NBC News',
    'ABC News',
    'TechRadar',
    'CBS News',
    'CNBC',
    'Vox News',
    'NPR',
    'Business Insider',
  ];
  Widget topicImageBuilder(image) {
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
      case 'entertainment':
        return Image.asset('assets/images/entertainment.png');
      case 'health':
        return Image.asset('assets/images/health.png');
    }
    return Text('null');
  }

  Widget sourceImageBuilder(image) {
    switch (image) {
      // Topics
      case 'BBC News':
        return Image.network(
            'https://yt3.googleusercontent.com/y_esGAQOhX4rTpWvrALErAJlFbm_2TIVrvcVfcZny7TuA8dJZgOQcC6KRfd_J5hljFe-foYXj9U=s900-c-k-c0x00ffffff-no-rj');
      case 'CNN':
        return Image.network(
            'https://www.logodesignlove.com/wp-content/uploads/2010/06/cnn-logo-white-on-red.jpg');
      case 'Fox News':
        return Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Fox_News_Channel_logo.svg/2048px-Fox_News_Channel_logo.svg.png');
      case 'NY Times':
        return Image.network(
            'https://theme.zdassets.com/theme_assets/968999/d8a347b41db1ddee634e2d67d08798c102ef09ac.jpg');
      case 'NBC News':
        return Image.network(
            'https://cdn.worldvectorlogo.com/logos/nbc-news.svg');
      case 'ABC News':
        return Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt_od8l0f6wTD7ThKgYlgS66-NH7pPQzUs18Zhgnp_WQ&s');
      case 'TechRadar':
        return Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO5Y8GrDmw_2SM434Qey69vUw1geaX2yMEs4OK-yumaQ&s');
      case 'CBS News':
        return Image.network(
            'https://logowik.com/content/uploads/images/cbs-news8651.jpg');
      case 'CNBC':
        return Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYwhCW1KV7sgBJXknOAPqzjNUwEa7ckFRLtkOLyuQgiA&s');
      case 'Vox News':
        return Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8DAGTMXfDDrNky3lepZ-nlwHN7FBsqYvpglXabRxU8w&s');
      case 'NPR':
        return Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMc7QNAyWivawD-7g3-Eq5Gh1saOrquGO-xPEXKwmOcg&s');
      case 'Business Insider':
        return Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVDJgcSuaPwQXIMwH7utTE7zf4EVKjMoEQ6DXAF62tFg&s');
    }
    return Text('null');
  }

  List<dynamic> selectedTopics = [];
  List<dynamic> unSelectedTopics = [];
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
  List<dynamic> unSelectedSources = [];
  SelectSource(String source) {
    if (selectedSources.contains(source) == false) {
      selectedSources.add(source);
    } else if (selectedSources.contains(source)) {
      selectedSources.remove(source);
    }
    emit(SourceSelectionState());
  }

  Future<void> getProfile() async {
    if (uid != null) {
      print('GETTING PROFILE');
      emit(GetProfileLoadingState());

      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (snapshot.exists) {
        selectedSources = snapshot.get('sources');
        selectedTopics = snapshot.get('topics');
        unSelectedSources = sources;
        unSelectedTopics = topics;
        unSelectedSources
            .removeWhere((element) => selectedSources.contains(element));
        unSelectedTopics
            .removeWhere((element) => selectedTopics.contains(element));
        topics = [
          'politics',
          'sports',
          'space',
          'technology',
          'business',
          'health',
          'entertainment',
        ];
        sources = [
          'BBC News',
          'CNN',
          'Fox News',
          'NY Times',
          'NBC News',
          'ABC News',
          'TechRadar',
          'CBS News',
          'CNBC',
          'Vox News',
          'NPR',
          'Business Insider',
        ];
        interuser = snapshot;

        emit(GetProfileSuccessState());
      } else {
        print('Document with UID $uid does not exist.');
        emit(GetProfileErrorState());
      }
    } else {
      await Future.delayed(Duration(milliseconds: 1300)).then((value) {
        emit(GetProfileErrorState());
      });
    }
  }

  setProfile(context) async {
    emit(SetProfileLoadingState());
    try {
      FirebaseFirestore.instance.collection('users').doc(uid).update({
        'topics': selectedTopics,
        'sources': selectedSources,
      });
      await getProfile();
      navigateToAndFinish(context, Layout());
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

  Future<void> addTopicOrSource(index) async {
    switch (displayTopics) {
      case true:
        selectedTopics.add(unSelectedTopics[index]);
        break;
      case false:
        selectedSources.add(unSelectedSources[index]);
        break;
    }
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'topics': selectedTopics,
      'sources': selectedSources,
    });
    await getProfile();
  }
  Future<void> removeTopicOrSource(index) async {
    switch (displayTopics) {
      case true:
        selectedTopics.remove(selectedTopics[index]);
        break;
      case false:
        selectedSources.remove(selectedSources[index]);
        break;
    }
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'topics': selectedTopics,
      'sources': selectedSources,
    });
    await getProfile();
  }
}
