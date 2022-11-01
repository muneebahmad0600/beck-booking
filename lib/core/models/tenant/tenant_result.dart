class TenantResult {
  int? state;
  int? tenantId;

  TenantResult({this.state, this.tenantId});

  TenantResult.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    tenantId = json['tenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['tenantId'] = tenantId;
    return data;
  }
}
