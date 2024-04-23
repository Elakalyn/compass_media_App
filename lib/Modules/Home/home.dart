import 'package:compass_app/Shared/cubit/app_cubit.dart';
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
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
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
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.h,
                  Row(
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
                  if (state is SuccessGetArticlesState)
                    ListView.separated(
                      separatorBuilder: (context, index) => 20.h,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cubit.feedArticles.length,
                      itemBuilder: (context, index) {
                        return NewsCard(cubit.feedArticles[index], context);
                      },
                    ),
                  if (state is LoadingGetArticlesState)
                  Center(child: CircularProgressIndicator()),
                  if (state is ErrorGetArticlesState)
                  Text('Failed to get articles, please check your internet connection.'),
                    
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
