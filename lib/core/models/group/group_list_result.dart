import 'package:beck_booking/core/models/group/group_result.dart';

class GroupListResult {
  int? totalCount;
  List<GroupResult>? items;

  GroupListResult({this.totalCount, this.items});

  GroupListResult.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <GroupResult>[];
      json['items'].forEach((v) {
        items!.add(GroupResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
