import 'package:compass_app/Modules/Search/search.dart';
import 'package:compass_app/Shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import '../../Shared/Components/components.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        cubit.globalLazyLoading();
        return Scaffold(
          appBar: AppBar(
            title: SafeArea(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/app_Icon.png',
                    width: 65,
                    height: 65,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      navigateTo(context, SearchScreen());
                    },
                    child: Container(
                      width: 235,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: HexColor('000F2B'),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 23,
                            color: HexColor('#797979'),
                          ),
                          20.w,
                          Text('Israeli-Palestinian conflict',
                              style: TextStyle(
                                color: HexColor('#797979'),
                                fontSize: 13,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              controller: cubit.globalScrollController,

              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                10.h,
                const Row(
                  children: [
                    Text(
                      'Global',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    profileWidget(),
                  ],
                ),
                20.h,
                Row(
                  children: [
                    if (cubit.globalCard != null) const GlobalCard(),
                    if (cubit.globalCard == null)
                      const CircularProgressIndicator()
                  ],
                ),
                40.h,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Breaking',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                40.h,
                if (cubit.globalArticles.isNotEmpty)
                  ListView.separated(
                    separatorBuilder: (context, index) => 20.h,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.globalArticles.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                          cubit.globalArticles[index],
                          context,
                          cubit.categorizeArticle(
                              cubit.feedArticles[index].title!.toLowerCase()));
                    },
                  ),
                if (state is LoadingGetArticlesState)
                  const Center(child: CircularProgressIndicator()),
                if (state is ErrorGetArticlesState)
                  const Text(
                      'Failed to get articles, please check your internet connection.'),
              ]),
            ),
          ),
        );
      },
    );
  }
}
