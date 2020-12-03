import 'dart:convert';
import 'package:hackersnews/nks/news.dart';
import 'package:hackersnews/model/Url.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Web {
  
  Future<Response> _getStory(int storyId) {
    return http.get(Url.urlForStory(storyId));
  }

  Future<List<Response>> getCommentsByStory(News story) async {

    return Future.wait(story.commentIds.map((commentId)  { 
        return http.get(Url.urlForCommentById(commentId));
    }));

  }

  Future<List<Response>> getTopStories() async {
    
    final response = await http.get(Url.urlForTopStories());
    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);
      return Future.wait(storyIds.take(10).map((storyId) {
        return _getStory(storyId);
      }));

    } else {
      throw Exception("Unable to fetch data!");
    }
  }
}