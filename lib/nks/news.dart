class Comment {
  String text = ""; 
  final int commentId;
  News story; 
  Comment({this.commentId,this.text});

  factory Comment.fromJSON(Map<String,dynamic> json) {
    return Comment(
      commentId: json["id"],
      text: json["text"]
    );
  }

}

class News {
  
  final String title; 
  final String url; 
  List<int> commentIds = List<int>(); 

  News({this.title,this.url,this.commentIds});

  factory News.fromJSON(Map<String,dynamic> json) {
    return News(
      title: json["title"], 
      url: json["url"], 
      commentIds: json["kids"] == null ? List<int>() : json["kids"].cast<int>()
    );
  }

}