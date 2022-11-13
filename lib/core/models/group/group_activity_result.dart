class GroupActivityListResult {
  List<GroupActivityResult>? items;

  GroupActivityListResult({this.items});

  GroupActivityListResult.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <GroupActivityResult>[];
      json['items'].forEach((v) {
        items!.add(GroupActivityResult.fromJson(v));
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

class GroupActivityResult {
  int? groupId;
  String? groupName;
  List<GroupActivityResponseResult>? responses;
  ActivityDetailResult? activity;
  int? activityId;
  int? customerId;
  String? creationTime;
  int? creatorUserId;
  int? id;

  GroupActivityResult(
      {this.groupId,
      this.groupName,
      this.responses,
      this.activity,
      this.activityId,
      this.customerId,
      this.creationTime,
      this.creatorUserId,
      this.id});

  GroupActivityResult.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    groupName = json['groupName'];
    if (json['responses'] != null) {
      responses = <GroupActivityResponseResult>[];
      json['responses'].forEach((v) {
        responses!.add(GroupActivityResponseResult.fromJson(v));
      });
    }
    activity = json['activity'] != null
        ? ActivityDetailResult.fromJson(json['activity'])
        : null;
    activityId = json['activityId'];
    customerId = json['customerId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupId'] = groupId;
    data['groupName'] = groupName;
    if (responses != null) {
      data['responses'] = responses!.map((v) => v.toJson()).toList();
    }
    if (activity != null) {
      data['activity'] = activity!.toJson();
    }
    data['activityId'] = activityId;
    data['customerId'] = customerId;
    data['creationTime'] = creationTime;
    data['creatorUserId'] = creatorUserId;
    data['id'] = id;
    return data;
  }
}

class GroupActivityResponseResult {
  String? name;
  int? response;
  int? id;

  GroupActivityResponseResult({this.name, this.response, this.id});

  GroupActivityResponseResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    response = json['response'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['response'] = response;
    data['id'] = id;
    return data;
  }
}

class ActivityDetailResult {
  int? tenantId;
  String? name;
  String? date;
  String? followUpDate;
  int? followUpTypeId;
  int? activityArtId;
  int? activityTypeId;
  int? employeeId;
  int? customerId;
  dynamic creatorUserId;
  String? creationTime;
  bool? isFollowUp;
  dynamic followUpByEmployeeId;
  dynamic roomId;
  dynamic note;
  int? id;

  ActivityDetailResult(
      {this.tenantId,
      this.name,
      this.date,
      this.followUpDate,
      this.followUpTypeId,
      this.activityArtId,
      this.activityTypeId,
      this.employeeId,
      this.customerId,
      this.creatorUserId,
      this.creationTime,
      this.isFollowUp,
      this.followUpByEmployeeId,
      this.roomId,
      this.note,
      this.id});

  ActivityDetailResult.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'];
    name = json['name'];
    date = json['date'];
    followUpDate = json['followUpDate'];
    followUpTypeId = json['followUpTypeId'];
    activityArtId = json['activityArtId'];
    activityTypeId = json['activityTypeId'];
    employeeId = json['employeeId'];
    customerId = json['customerId'];
    creatorUserId = json['creatorUserId'];
    creationTime = json['creationTime'];
    isFollowUp = json['isFollowUp'];
    followUpByEmployeeId = json['followUpByEmployeeId'];
    roomId = json['roomId'];
    note = json['note'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tenantId'] = tenantId;
    data['name'] = name;
    data['date'] = date;
    data['followUpDate'] = followUpDate;
    data['followUpTypeId'] = followUpTypeId;
    data['activityArtId'] = activityArtId;
    data['activityTypeId'] = activityTypeId;
    data['employeeId'] = employeeId;
    data['customerId'] = customerId;
    data['creatorUserId'] = creatorUserId;
    data['creationTime'] = creationTime;
    data['isFollowUp'] = isFollowUp;
    data['followUpByEmployeeId'] = followUpByEmployeeId;
    data['roomId'] = roomId;
    data['note'] = note;
    data['id'] = id;
    return data;
  }
}
