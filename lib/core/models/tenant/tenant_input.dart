class TenantInput {
  String? tenancyName;

  TenantInput({this.tenancyName});

  TenantInput.fromJson(Map<String, dynamic> json) {
    tenancyName = json['tenancyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tenancyName'] = tenancyName;
    return data;
  }
}
