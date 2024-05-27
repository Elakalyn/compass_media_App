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
                  navigateToAndFinish(context, Layout());
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
                                Text(interuser?.get('name'),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(interuser?.get('email'),
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
                    if (state is! GetProfileLoadingState)
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.displayTopics
                            ? cubit.selectedTopics.length
                            : cubit.selectedSources.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .7,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              elementCard(
                                edit_mode: false,
                                type: cubit.displayTopics ? 'topics' : 'sources',
                                name: cubit.displayTopics
                                    ? cubit.selectedTopics[index]
                                    : cubit.selectedSources[index],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: CircleAvatar(
                                  maxRadius: 10,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  cubit.removeTopicOrSource(index);
                                },
                              )
                            ],
                          );
                        },
                      ),
                    if (state is GetProfileLoadingState)
                      CircularProgressIndicator(),
                    40.h,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        cubit.displayTopics ? 'Other Topics' : 'Other Sources',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    20.h,
                    if (state is! GetProfileLoadingState)
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.displayTopics
                            ? cubit.unSelectedTopics.length
                            : cubit.unSelectedSources.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .7,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              elementCard(
                                edit_mode: false,
                                type:
                                    cubit.displayTopics ? 'topics' : 'sources',
                                name: cubit.displayTopics
                                    ? cubit.unSelectedTopics[index]
                                    : cubit.unSelectedSources[index],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: CircleAvatar(
                                  maxRadius: 10,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  cubit.addTopicOrSource(index);
                                },
                              )
                            ],
                          );
                        },
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
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Getting profile...'),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class tabBar extends StatelessWidget {
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
