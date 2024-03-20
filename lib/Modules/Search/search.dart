// ignore_for_file: prefer_const_constructors

import 'package:compass_app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Shared/Components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  cubit.getPopularSearchHeadlines();
                  cubit.searchResults.clear();
                  Navigator.pop(context);
                }),
            iconTheme: IconThemeData(
              color: Colors.white,
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  20.h,
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'A timeline of all modern history',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  20.h,
                  SearchBar(),
                  40.h,
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cubit.searchResults.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return 20.h;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      if (cubit.searchQuery.isEmpty == true) {
                        return suggestedSearchWidget(
                          suggestion: cubit.headlines[index],
                        );
                      } else if (state is LoadingSearchState) {
                        return CircularProgressIndicator();
                      } else if (state is ErrorSearchState) {
                        return Text('Couldn\'t get search results');
                      } else if (state is SuccessSearchState) {
                        return NewsCard(
                          cubit.searchResults[index],
                          context,
                        );
                      }
                      return Text('Couldn\'t get search results');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class suggestedSearchWidget extends StatelessWidget {
  suggestedSearchWidget({
    super.key,
    required this.suggestion,
  });
  final suggestion;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 45.0,
      decoration: BoxDecoration(
        color: HexColor('000F2B'),
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Row(
        children: [
          20.w,
          Icon(Icons.search, color: HexColor('#797979')),
          20.w,
          Expanded(
            child: Text(
              suggestion,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: HexColor('#797979'),
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        color: HexColor('000F2B'),
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: TextField(
        onChanged: (v) => AppCubit.get(context).search(v, context),
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 211, 211, 211),
            fontSize: 16.0,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromARGB(255, 211, 211, 211),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
