import 'package:compass_app/Modules/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Network/Remote/apiService.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Models/ArticleModel/articleModel.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Spacer(),
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
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            20.h,
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
                const GlobalCard(),
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
            FutureBuilder(
              future: categoryClient.getArticle(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Articles>> snapshot) {
                //let's check if we got a response or not
                if (snapshot.hasData) {
                  //Now let's make a list of articles
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
          ]),
        ),
      ),
    );
  }
}
