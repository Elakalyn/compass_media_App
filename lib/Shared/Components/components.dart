// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'package:compass_app/Shared/cubit/user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Modules/ArticleView/articleView.dart';
import '../../Modules/Profile/profile.dart';
import '../Models/ArticleModel/articleModel.dart';
import '../cubit/app_cubit.dart';

class GlobalCard extends StatelessWidget {
  const GlobalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return GestureDetector(
      onTap: () {
        // navigateTo(context, const ArticleViewScreen());
      },
      child: Container(
        width: 320.0,
        height: 430.0 + 17,
        decoration: BoxDecoration(
          color: HexColor('0F1D37'),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              offset: const Offset(10, 10),
              color: HexColor('06142E'),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 244,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(cubit.globalCard.urlToImage,
                      fit: BoxFit.fill),
                ),
              ),
              12.h,
              Row(
                children: [
                  Container(
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset('assets/sources/BBC.png')),
                            ),
                            8.w,
                            Expanded(
                              child: Center(
                                child: Text(
                                  cubit.globalCard.source.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  8.w,
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                      color: HexColor('0040B8'),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                    'assets/images/politicsIcon.png')),
                          ),
                          8.w,
                          const Text(
                            'POLITICS',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              12.h,
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 89,
                    decoration: BoxDecoration(
                        color: HexColor('5A94FF'),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                  ),
                  8.w,
                  Expanded(
                    child: Column(
                      children: [
                        Text(cubit.globalCard.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                        8.h,
                        Text(cubit.globalCard.content,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 16,
                              color: HexColor('BEBEBE'),
                            )),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget? NewsCard(Articles article, BuildContext context, var category) {
  if (article.urlToImage != null)
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            ArticleViewScreen(
              source: article.source!.name,
              image: article.urlToImage,
              name: article.title,
              content: article.content,
              category: category,
            ));
      },
      child: Container(
        width: 320.0,
        height: 334.0,
        decoration: BoxDecoration(
          color: HexColor('0F1D37'),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              offset: const Offset(10, 10),
              color: HexColor('06142E'),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 171,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(article.urlToImage!, fit: BoxFit.fill),
                ),
              ),
              12.h,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset('assets/sources/BBC.png')),
                            ),
                            8.w,
                            Expanded(
                              child: Center(
                                child: Text(
                                  article.source!.name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            8.w,
                          ],
                        ),
                      ),
                    ),
                  ),
                  8.w,
                  Expanded(
                    child: Container(
                      width: 110,
                      decoration: BoxDecoration(
                        color: HexColor('0040B8'),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                      'assets/images/politicsIcon.png')),
                            ),
                            8.w,
                            Expanded(
                              child: Center(
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  category.toString().toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              8.h,
              Text(
                article.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  if (article.urlToImage == null) return 1.w;
}

Future<void> navigateToAndFinish(context, widget) async =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Future<void> navigateTo(context, widget) async => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

class profileWidget extends StatelessWidget {
  const profileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UserProfileCubit.get(context).getProfile();
        navigateToAndFinish(context, const ProfileScreen());
      },
      child: const CircleAvatar(
        maxRadius: 20,
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.size,
  });
  final size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/app_Icon.png',
      width: size,
      height: size,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class elementCard extends StatelessWidget {
  const elementCard({
    super.key,
    required this.name,
    required this.type,
    required this.edit_mode,
  });
  final String name;
  final String type;
  final bool edit_mode;
  @override
  Widget build(BuildContext context) {
    var cubit = UserProfileCubit.get(context);
    if (type == 'topics') {
      return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (edit_mode) {
                cubit.SelectTopic(name);
              } else {}
            },
            child: Container(
                width: 152.0,
                height: 197.0,
                decoration: BoxDecoration(
                  color: HexColor('132649'),
                  border: cubit.selectedTopics.contains(name)
                      ? Border.all(
                          color: Color.fromARGB(255, 65, 169, 255), width: 1)
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
                      child: cubit.imageBuilder(name),
                    ),
                    const Spacer(),
                    Text(
                      name.capitalize(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                  ],
                )),
          );
        },
      );
    } else {
      return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (edit_mode) {
                cubit.SelectSource(name);
              } else {}
            },
            child: Container(
                width: 152.0,
                height: 197.0,
                decoration: BoxDecoration(
                  color: HexColor('132649'),
                  border: cubit.selectedSources.contains(name)
                      ? Border.all(
                          color: Color.fromARGB(255, 65, 169, 255), width: 1)
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
                      child: cubit.imageBuilder(name),
                    ),
                    const Spacer(),
                    Text(
                      name.capitalize(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                  ],
                )),
          );
        },
      );
    }
  }
}
