import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Network/Remote/apiService.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Models/ArticleModel/articleModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              FutureBuilder(
                future: ufclient.getArticle(context),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Articles>> snapshot) {
                  if (snapshot.hasData) {
                    List<Articles> articles = snapshot.data!;

                    return ListView.separated(
                      separatorBuilder: (context, index) => 20.h,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) =>
                          NewsCard(articles[index], context),
                    );
                  }
                  ;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
