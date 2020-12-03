import 'package:flutter/material.dart';
import 'package:hackersnews/nks/news.dart';

class ListPage extends StatelessWidget {

  final List<Comment> comments; 
  final News news; 

  ListPage({this.news,this.comments});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(this.news.title), 
        backgroundColor: Colors.black

      ),
      body: ListView.builder(
        itemCount: this.comments.length,
        itemBuilder: (context,index) {
          return ListTile(
            leading: Container(
              alignment: Alignment.center,
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Text("${1+index}",style: TextStyle(fontSize: 22,color: Colors.white))),
            title: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text(this.comments[index].text,style: TextStyle(fontSize: 18)),
            )
          );
        },
      )
    );
    
  }

}