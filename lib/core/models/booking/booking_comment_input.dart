class BookingCommentInput {
  int? activityId;
  String? commentText;

  BookingCommentInput({this.activityId, this.commentText});

  BookingCommentInput.fromJson(Map<String, dynamic> json) {
    activityId = json['activityId'];
    commentText = json['commentText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activityId'] = activityId;
    data['commentText'] = commentText;
    return data;
  }
}
