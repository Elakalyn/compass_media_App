import 'package:compass_app/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import '../../Shared/cubit/app_cubit.dart';
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
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.topics.length,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .7,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return elementCard(
                              edit_mode: true,
                              type: 'topics',
                              name: cubit.topics[index],
                            );
                          },
                        ),
                        140.h,
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cubit.selectedTopics.isNotEmpty
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
                        color: cubit.selectedTopics.isNotEmpty
                            ? null
                            : Colors.grey,
                      ),
                      Text(
                        'Select Topics [${cubit.selectedTopics.length}]',
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
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.sources.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .7,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return elementCard(
                            edit_mode: true,
                            type: 'sources',
                            name: cubit.sources[index],
                          );
                        },
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
                        color: cubit.selectedSources.isNotEmpty
                            ? null
                            : Colors.grey,
                      ),
                      Text(
                        'Select Sources [${cubit.selectedSources.length}]',
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
