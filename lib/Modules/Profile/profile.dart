import 'package:compass_app/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import '../../Shared/Constants/constants.dart';
import '../../Shared/cubit/user_profile_cubit.dart';
import '../Layout/layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = UserProfileCubit.get(context);
    return BlocConsumer<UserProfileCubit, UserProfileCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is! GetProfileLoadingState) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  navigateToAndFinish(context, Host());
                },
              ),
              centerTitle: true,
              title: SafeArea(
                child: Image.asset(
                  'assets/images/app_Icon.png',
                  width: 65,
                  height: 65,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    40.h,
                    Container(
                      width: 323.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: HexColor('0F1D37'),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset('assets/images/profile.png')),
                          20.w,
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              children: [
                                Text(interuser.get('name'),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('Created: 9/10/23',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    40.h,
                    tabBar(),
                    40.h,
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Country',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Spacer(),
                        DropdownButton<String>(
                          value: cubit.dropdownValue,
                          icon: const Icon(Icons.gps_fixed),
                          style: const TextStyle(color: Colors.black),
                          selectedItemBuilder: (_) {
                            return cubit.countries.map<Widget>((String item) {
                              return Center(
                                child: Text(
                                  cubit.country,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList();
                          },
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (value) {
                            cubit.selectCountry(value, context);
                          },
                          items: cubit.countries
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    40.h,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        cubit.displayTopics
                            ? 'Selected Topics'
                            : 'Selected Sources',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    20.h,
                    if (state is! GetProfileLoadingState) Grid(),
                    if (state is GetProfileLoadingState)
                      CircularProgressIndicator(),
                    40.h,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Other Topics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    20.h,
                    if (state is! GetProfileLoadingState)
                      Grid(
                        existing: true,
                      ),
                    if (state is GetProfileLoadingState)
                      CircularProgressIndicator(),
                    40.h,
                    ElevatedButton(
                      onPressed: () {
                        cubit.logout(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class Grid extends StatelessWidget {
  Grid({this.existing});
  final existing;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = UserProfileCubit.get(context);
        List<dynamic> sources = [];
        List<dynamic> topics = [];

        var names;
        if (existing == null) {
          topics = cubit.selectedTopics;
          sources = cubit.selectedSources;
          names = cubit.displayTopics ? topics : sources;
        } else {
          sources = ['bbc-news', 'reuters', 'cnn', 'google-news'];
          sources.removeWhere(
              (element) => cubit.selectedSources.contains(element));
          topics = [
            'Politics',
            'Business',
            'Economy',
            'Space',
            'Technology',
            'Sports'
          ];
          topics
              .removeWhere((element) => cubit.selectedTopics.contains(element));
          names = cubit.displayTopics ? topics : sources;
        }
        return GridView.builder(
          itemCount: names.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 152.0,
              height: 197.0,
              decoration: BoxDecoration(
                color: const Color(0xFF132649),
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 111,
                      child: findAssetImage(
                        name: names[index],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      names[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class findAssetImage extends StatelessWidget {
  findAssetImage({required this.name});
  final name;
  @override
  Widget build(BuildContext context) {
    switch (name) {
      // Topics
      case 'Politics':
        return Image.asset('assets/images/politics.png');
      case 'Sports':
        return Image.asset('assets/images/sports.png');
      case 'Space':
        return Image.asset('assets/images/space.png');
      case 'Technology':
        return Image.asset('assets/images/technology.png');
      case 'Business':
        return Image.asset('assets/images/business.png');
      case 'Economy':
        return Image.asset('assets/images/economy.png');
      // Sources
      case 'bbc':
        return Image.asset('assets/sources/BBC.png');
      case 'cnn':
        return Image.asset('assets/sources/CNN.png');
      case 'foxnews':
        return Image.asset('assets/sources/foxNews.png');
      case 'googlenews':
        return Image.asset('assets/sources/GoogleNews.png');
      case 'nytimes':
        return Image.asset('assets/sources/NYTimes.png');
      case 'reuters':
        return Image.asset('assets/sources/Reuters.png');
    }
    return Text('null');
  }
}

class tabBar extends StatelessWidget {
  tabBar();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  UserProfileCubit.get(context).changeProfileGrid(true);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Topics',
                      style: TextStyle(
                        color: UserProfileCubit.get(context).displayTopics
                            ? Colors.white
                            : HexColor('#898989'),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  UserProfileCubit.get(context).changeProfileGrid(false);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Sources',
                      style: TextStyle(
                        color: UserProfileCubit.get(context).displayTopics
                            ? HexColor('#898989')
                            : Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
