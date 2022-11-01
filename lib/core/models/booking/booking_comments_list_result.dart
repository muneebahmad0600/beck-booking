class BookingCommentListResult {
  List<CommentResult>? items;

  BookingCommentListResult({this.items});

  BookingCommentListResult.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <CommentResult>[];
      json['items'].forEach((v) {
        items!.add(CommentResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommentResult {
  String? commentText;
  int? userId;
  String? userName;
  int? activityId;
  int? id;

  CommentResult(
      {this.commentText, this.userId, this.userName, this.activityId, this.id});

  CommentResult.fromJson(Map<String, dynamic> json) {
    commentText = json['commentText'];
    userId = json['userId'];
    userName = json['userName'];
    activityId = json['activityId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commentText'] = commentText;
    data['userId'] = userId;
    data['userName'] = userName;
    data['activityId'] = activityId;
    data['id'] = id;
    return data;
  }
}
