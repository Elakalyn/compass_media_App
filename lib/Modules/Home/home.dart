import 'package:compass_app/Modules/Bookmarks/bookmarks.dart';
import 'package:compass_app/Shared/cubit/app_cubit.dart';
import 'package:compass_app/Shared/cubit/user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import '../../Shared/Components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        cubit.homeLazyLoading();
        return Scaffold(
          appBar: AppBar(
            title: SafeArea(
              child: Image.asset(
                'assets/images/app_Icon.png',
                width: 65,
                height: 65,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.bookmarks),
                  onPressed: () {
                    navigateTo(context, BookmarksScreen());
                  },
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RefreshIndicator(
              onRefresh: () => cubit.refresh(),
              child: SingleChildScrollView(
                controller: cubit.homeScrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.h,
                    const Row(
                      children: [
                        Text(
                          'Your Feed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        profileWidget()
                      ],
                    ),
                    24.h,
                    if (cubit.feedArticles.isNotEmpty)
                      ListView.separated(
                        separatorBuilder: (context, index) => 20.h,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit
                            .loadedHomeArticles, //cubit.feedArticles.length,
                        itemBuilder: (context, index) {
                          var category = cubit.categorizeArticle(
                              cubit.feedArticles[index].title!.toLowerCase());

                          return homeNewsCard(
                              cubit.feedArticles[index], context, category);
                        },
                      ),
                    if (state is LoadingGetArticlesState)
                      const Center(child: CircularProgressIndicator()),
                    if (state is ErrorGetArticlesState)
                      const Text(
                          'Failed to get articles, please check your internet connection.'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
