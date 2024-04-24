import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compass_app/Shared/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Models/ArticleModel/articleModel.dart';
import '../../Shared/cubit/app_cubit.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        final CollectionReference collectionRef = FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('bookmarks');
        return Scaffold(
          appBar: AppBar(
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
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.h,
                    const Text(
                      'Bookmarks',
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    40.h,
                    StreamBuilder<QuerySnapshot?>(
                      stream: collectionRef.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        final QuerySnapshot? querySnapshot = snapshot.data;

                        if (querySnapshot == null) {
                          print('DATA DOES NOT EXIST.');
                          return const Text('No data available');
                        }

                        return ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 20,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: querySnapshot.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final DocumentSnapshot<Object?> document =
                                querySnapshot.docs[index];

                            return NewsCard(Articles(
                              title: document['title'],
                              content: document['content'],
                              source: ArticleSource(name: document['source']),
                              urlToImage: document['urlToImage'],
                            ), context);
                          },
                        );
                      },
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
