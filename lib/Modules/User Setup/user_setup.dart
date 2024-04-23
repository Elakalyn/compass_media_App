import 'package:compass_app/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import '../../Shared/cubit/user_profile_cubit.dart';

class TopicSelection extends StatelessWidget {
  TopicSelection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = UserProfileCubit.get(context);
    return BlocConsumer<UserProfileCubit, UserProfileCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor('#0F1D37'),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/app_Icon.png',
                          width: 65,
                          height: 65,
                        ),
                        20.h,
                        const Text('Let\'s help you get started',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                        20.h,
                        const Text(
                            'Pick the topics that interest you\nDon\'t worry, you can change them later.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                        40.h,
                        Wrap(
                          spacing: 16,
                          runSpacing: 20,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (cubit.politicsTopic != true) {
                                  cubit.SelectTopic('politics');
                                } else {
                                  cubit.DeselectTopic('politics');
                                }
                              },
                              child: Container(
                                  width: 152.0,
                                  height: 197.0,
                                  decoration: BoxDecoration(
                                    color: HexColor('132649'),
                                    border: cubit.politicsTopic
                                        ? Border.all(
                                            color: Color.fromARGB(
                                                255, 65, 169, 255),
                                            width: 1)
                                        : null,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                            'assets/images/politics.png'),
                                      ),
                                      const Spacer(),
                                      const Text(
                                        'Politics',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (cubit.sportsTopic != true) {
                                  cubit.SelectTopic('sports');
                                } else {
                                  cubit.DeselectTopic('sports');
                                }
                              },
                              child: Container(
                                  width: 152.0,
                                  height: 197.0,
                                  decoration: BoxDecoration(
                                    color: HexColor('132649'),
                                    border: cubit.sportsTopic
                                        ? Border.all(
                                            color: Color.fromARGB(
                                                255, 65, 169, 255),
                                            width: 1)
                                        : null,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                            'assets/images/sports.png'),
                                      ),
                                      const Spacer(),
                                      const Text(
                                        'Sports',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (cubit.spaceTopic != true) {
                                  cubit.SelectTopic('space');
                                } else {
                                  cubit.DeselectTopic('space');
                                }
                              },
                              child: Container(
                                  width: 152.0,
                                  height: 197,
                                  decoration: BoxDecoration(
                                    color: HexColor('132649'),
                                    border: cubit.spaceTopic
                                        ? Border.all(
                                            color: Color.fromARGB(
                                                255, 65, 169, 255),
                                            width: 1)
                                        : null,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                            'assets/images/space.png'),
                                      ),
                                      const Text(
                                        'Space',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (cubit.technologyTopic != true) {
                                  cubit.SelectTopic('technology');
                                } else {
                                  cubit.DeselectTopic('technology');
                                }
                              },
                              child: Container(
                                  width: 152.0,
                                  height: 197.0,
                                  decoration: BoxDecoration(
                                    color: HexColor('132649'),
                                    border: cubit.technologyTopic
                                        ? Border.all(
                                            color: Color.fromARGB(
                                                255, 65, 169, 255),
                                            width: 1)
                                        : null,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                            'assets/images/technology.png'),
                                      ),
                                      const Spacer(),
                                      const Text(
                                        'Technology',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (cubit.economyTopic != true) {
                                  cubit.SelectTopic('economy');
                                } else {
                                  cubit.DeselectTopic('economy');
                                }
                              },
                              child: Container(
                                  width: 152.0,
                                  height: 197.0,
                                  decoration: BoxDecoration(
                                    color: HexColor('132649'),
                                    border: cubit.economyTopic
                                        ? Border.all(
                                            color: Color.fromARGB(
                                                255, 65, 169, 255),
                                            width: 1)
                                        : null,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                            'assets/images/economy.png'),
                                      ),
                                      const Spacer(),
                                      const Text(
                                        'Economy',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (cubit.businessTopic != true) {
                                  cubit.SelectTopic('business');
                                } else {
                                  cubit.DeselectTopic('business');
                                }
                              },
                              child: Container(
                                  width: 152.0,
                                  height: 197.0,
                                  decoration: BoxDecoration(
                                    color: HexColor('132649'),
                                    border: cubit.businessTopic
                                        ? Border.all(
                                            color: Color.fromARGB(
                                                255, 65, 169, 255),
                                            width: 1)
                                        : null,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                            'assets/images/business.png'),
                                      ),
                                      const Text(
                                        'Business',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        140.h,
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cubit.topicsAreSelected()
                        ? navigateTo(context, SourceSelection())
                        : ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                "Please select at least 1 Topic to follow.",
                                style: TextStyle(color: Colors.white)),
                            duration: Duration(seconds: 3),
                          ));
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      Image.asset(
                        'assets/images/CTA_Button.png',
                        color: cubit.topicsAreSelected() ? null : Colors.grey,
                      ),
                      Text(
                        'Select Topics [${cubit.numbersOfTopics}]',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class SourceSelection extends StatelessWidget {
  const SourceSelection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = UserProfileCubit.get(context);
    return BlocConsumer<UserProfileCubit, UserProfileCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          backgroundColor: HexColor('#0F1D37'),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_Icon.png',
                        width: 65,
                        height: 65,
                      ),
                      20.h,
                      const Text('Select news sources.',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                      20.h,
                      const Text('Pick the news sources you trust.',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          )),
                      40.h,
                      Wrap(
                        spacing: 16,
                        runSpacing: 20,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (cubit.bbc != true) {
                                cubit.SelectSource('bbc');
                              } else {
                                cubit.SelectSource('bbc');
                              }
                            },
                            child: Container(
                                width: 152.0,
                                height: 197.0,
                                decoration: BoxDecoration(
                                  color: HexColor('132649'),
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: cubit.bbc
                                      ? Border.all(
                                          color:
                                              Color.fromARGB(255, 65, 169, 255),
                                          width: 1)
                                      : null,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child:
                                          Image.asset('assets/sources/BBC.png'),
                                    ),
                                    const Text(
                                      'BBC',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (cubit.foxnews != true) {
                                cubit.SelectSource('foxnews');
                              } else {
                                cubit.SelectSource('foxnews');
                              }
                            },
                            child: Container(
                                width: 152.0,
                                height: 197.0,
                                decoration: BoxDecoration(
                                  color: HexColor('132649'),
                                  border: cubit.foxnews
                                      ? Border.all(
                                          color:
                                              Color.fromARGB(255, 65, 169, 255),
                                          width: 1)
                                      : null,
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
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                          'assets/sources/foxNews.png'),
                                    ),
                                    const Text(
                                      'Fox News',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (cubit.cnn != true) {
                                cubit.SelectSource('cnn');
                              } else {
                                cubit.SelectSource('cnn');
                              }
                            },
                            child: Container(
                                width: 152.0,
                                height: 197.0,
                                decoration: BoxDecoration(
                                  color: HexColor('132649'),
                                  border: cubit.cnn
                                      ? Border.all(
                                          color:
                                              Color.fromARGB(255, 65, 169, 255),
                                          width: 1)
                                      : null,
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
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child:
                                          Image.asset('assets/sources/CNN.png'),
                                    ),
                                    const Text(
                                      'CNN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (cubit.reuters != true) {
                                cubit.SelectSource('reuters');
                              } else {
                                cubit.SelectSource('reuters');
                              }
                            },
                            child: Container(
                                width: 152.0,
                                height: 197.0,
                                decoration: BoxDecoration(
                                  border: cubit.reuters
                                      ? Border.all(
                                          color:
                                              Color.fromARGB(255, 65, 169, 255),
                                          width: 1)
                                      : null,
                                  color: HexColor('132649'),
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
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                          'assets/sources/Reuters.png'),
                                    ),
                                    const Text(
                                      'Reuters',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (cubit.nytimes != true) {
                                cubit.SelectSource('nytimes');
                              } else {
                                cubit.SelectSource('nytimes');
                              }
                            },
                            child: Container(
                                width: 152.0,
                                height: 197.0,
                                decoration: BoxDecoration(
                                  border: cubit.nytimes
                                      ? Border.all(
                                          color:
                                              Color.fromARGB(255, 65, 169, 255),
                                          width: 1)
                                      : null,
                                  color: HexColor('132649'),
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
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                          'assets/sources/NYTimes.png'),
                                    ),
                                    const Text(
                                      'NY Times',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (cubit.googlenews != true) {
                                cubit.SelectSource('googlenews');
                              } else {
                                cubit.SelectSource('googlenews');
                              }
                            },
                            child: Container(
                                width: 152.0,
                                height: 197.0,
                                decoration: BoxDecoration(
                                  color: HexColor('132649'),
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: cubit.googlenews
                                      ? Border.all(
                                          color:
                                              Color.fromARGB(255, 65, 169, 255),
                                          width: 1)
                                      : null,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                          'assets/sources/GoogleNews.png'),
                                    ),
                                    const Text(
                                      'Google News',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      140.h,
                    ],
                  ),
                ),
              ),
              if (state is! SetProfileLoadingState)
                GestureDetector(
                  onTap: () {
                     cubit.setProfile(context);
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      Image.asset(
                        'assets/images/CTA_Button.png',
                        color: cubit.sourcesAreSelected() ? null : Colors.grey,
                      ),
                      Text(
                        'Select Sources [${cubit.numbersOfSources}]',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
                  ),
                ),
              if (state is SetProfileLoadingState) CircularProgressIndicator()
            ],
          ),
        );
      },
    );
  }
}
