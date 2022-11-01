class EmployeeResult {
  int? employeeId;
  String? employeeName;
  String? status;
  int? id;

  EmployeeResult({this.employeeId, this.employeeName, this.status, this.id});

  EmployeeResult.fromJson(Map<String, dynamic> json) {
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
