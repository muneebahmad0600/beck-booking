class BookingDetailResult {
  String? fromDate;
  String? toDate;
  String? bookingStatus;
  int? activityId;
  List<Employees>? employees;
  int? id;

  BookingDetailResult(
      {this.fromDate,
      this.toDate,
      this.bookingStatus,
      this.activityId,
      this.employees,
      this.id});

  BookingDetailResult.fromJson(Map<String, dynamic> json) {
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    bookingStatus = json['bookingStatus'];
    activityId = json['activityId'];
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(Employees.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fromDate'] = fromDate;
    data['toDate'] = toDate;
    data['bookingStatus'] = bookingStatus;
    data['activityId'] = activityId;
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }
}

class Employees {
  int? employeeId;
  String? employeeName;
  String? status;
  int? id;

  Employees({this.employeeId, this.employeeName, this.status, this.id});

  Employees.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    employeeName = json['employeeName'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employeeId'] = employeeId;
    data['employeeName'] = employeeName;
    data['status'] = status;
    data['id'] = id;
    return data;
  }
}
