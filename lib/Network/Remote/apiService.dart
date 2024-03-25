import 'dart:convert';

import 'package:compass_app/Network/Remote/.endpoints.dart';
import 'package:compass_app/cubit/app_cubit.dart';
import 'package:http/http.dart';

import '../../Shared/Models/ArticleModel/articleModel.dart';
import '../../cubit/user_profile_cubit.dart';

// User Feed API service
class UserFeedAPI {
  Future<List<Articles>> getArticle(context) async {
    final RegionalEndPoint =
        "https://newsapi.org/v2/everything?q=${UserProfileCubit.get(context).country}&apiKey=${apiKey}";

    Response res = await get(Uri.parse(RegionalEndPoint));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Articles> articles =
          body.map((dynamic item) => Articles.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}

UserFeedAPI ufclient = UserFeedAPI();

// Global Carousel API service
class GlobalAPI {
  Future<List<Articles>> getArticle() async {
    Response res = await get(Uri.parse(GlobalEndPoint));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Articles> articles =
          body.map((dynamic item) => Articles.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}

GlobalAPI globalClient = GlobalAPI();

// Breaking Menu API service
class CategoryAPI {
  Future<List<Articles>> getArticle() async {
    Response res = await get(Uri.parse(GlobalEndPoint));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Articles> articles =
          body.map((dynamic item) => Articles.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}

CategoryAPI categoryClient = CategoryAPI();

class PopularSearchesAPI {
  List<String> articleTitles = [];

  var data;
  var articles;

  Future<List<String>> getHeadlines() async {
    Response response = await get(Uri.parse(PopularSearchEndPoint));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      articles = data['articles'];
    }

    // Extract the titles and add them to the articleTitles list
    for (var article in articles) {
      String title = article['title'];
      articleTitles.add(title);
    }

    return articleTitles;
  }

  List<String> trimArticleTitles(List<String> titles) {
    List<String> trimmedTitles = [];

    for (var title in titles) {
      // Split the title into words
      List<String> words = title.split(' ');

      // Check if the title has more than 4 words
      if (words.length > 4) {
        // Take the first 4 words and join them back into a trimmed title
        String trimmedTitle = words.sublist(0, 4).join(' ');
        trimmedTitles.add(trimmedTitle);
      } else {
        // Handle the error case where the title has 4 or fewer words
        trimmedTitles.add(title); // Add the original title without trimming
        print("Error: Title '$title' has 4 or fewer words.");
      }
    }

    return trimmedTitles;
  }
}

PopularSearchesAPI psClient = PopularSearchesAPI();

class SearchAPI {
  Future<List<Articles>> searchForArticles(context) async {
    final SearchEndPoint =
        "https://newsapi.org/v2/everything?q=${AppCubit.get(context).searchQuery}&sortBy=popularity&apiKey=${apiKey}";
    Response res = await get(Uri.parse(SearchEndPoint));
    if (res.statusCode == 200) {
      try {
        Map<String, dynamic> json = jsonDecode(res.body);

        List<dynamic> body = json['articles'];

        List<Articles> articles =
            body.map((dynamic item) => Articles.fromJson(item)).toList();

        return articles;
      } catch (e) {
        print('${e.toString()} ERROR');

        rethrow;
      }
    } else {
      throw ("Can't get the Articles, Status code doesn't equal 200");
    }
  }
}

SearchAPI searchClient = SearchAPI();
