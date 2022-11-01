import 'package:beck_booking/core/models/employee/employee.dart';

class BookingResult {
  String? fromDate;
  String? toDate;
  String? bookingStatus;
  int? creatorUserId;
  String? creationTime;
  List<EmployeeResult>? employees;
  int? id;
  int? activityId;

  BookingResult(
      {this.fromDate,
      this.toDate,
      this.bookingStatus,
      this.creatorUserId,
      this.creationTime,
      this.employees,
      this.activityId,
      this.id});

  BookingResult.fromJson(Map<String, dynamic> json) {
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    if (json['employees'] != null) {
      employees = <EmployeeResult>[];
      json['employees'].forEach((v) {
        employees!.add(EmployeeResult.fromJson(v));
      });
    }
    bookingStatus = json['bookingStatus'];
    creatorUserId = json['creatorUserId'];
    creationTime = json['creationTime'];
    id = json['id'];
    activityId = json['activityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fromDate'] = fromDate;
    data['toDate'] = toDate;
    data['bookingStatus'] = bookingStatus;
    data['creatorUserId'] = creatorUserId;
    data['creationTime'] = creationTime;
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['activityId'] = activityId;
    return data;
  }
}
