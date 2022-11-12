class GroupResult {
  String? name;
  int? creatorUserId;
  String? creationTime;
  int? id;

  GroupResult({this.name, this.creatorUserId, this.creationTime, this.id});

  GroupResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    creatorUserId = json['creatorUserId'];
    creationTime = json['creationTime'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['creatorUserId'] = creatorUserId;
    data['creationTime'] = creationTime;
    data['id'] = id;
    return data;
  }
}
