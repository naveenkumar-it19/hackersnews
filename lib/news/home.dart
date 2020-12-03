import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hackersnews/nks/news.dart';
import 'package:hackersnews/web.dart';
import 'package:hackersnews/listpage.dart';

class Home extends StatefulWidget {
  @override 
  HomeState createState() => HomeState(); 
}

class HomeState extends State<Home> {

  List<News> _stories = List<News>(); 

  @override
  void initState() {
    super.initState();
    _populateTopStories(); 
  }

  void _populateTopStories() async {
    
    final responses = await Web().getTopStories();
    final stories = responses.map((response) {
      final json = jsonDecode(response.body);
      return News.fromJSON(json);
    }).toList();

    setState(() {
      _stories = stories; 
    });
  }

  void _navigateToShowCommentsPage(BuildContext context, int index) async {

    final story = this._stories[index]; 
    final responses = await Web().getCommentsByStory(story);
    final comments = responses.map((response) {
      final json = jsonDecode(response.body);
      return Comment.fromJSON(json);
    }).toList();

    debugPrint("$comments");

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ListPage(news: story, comments: comments)
    )); 


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('HACKERS'),
          Text('NEWS', style:TextStyle(color:Colors.blue))],
        ), 
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: _stories.length, 
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {
              _navigateToShowCommentsPage(context, index);
            },
            title: Text(_stories[index].title, style: TextStyle(fontSize: 18)), 
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              alignment: Alignment.center,
              width: 50,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("${_stories[index].commentIds.length}",style: TextStyle(color: Colors.white)),
              )
              ),
          );
        },
      )
    );
    
  }

}