class Session {
  Application? application;
  User? user;
  Tenant? tenant;
  Company? company;

  Session({this.application, this.user, this.tenant, this.company});

  Session.fromJson(Map<String, dynamic> json) {
    application = json['application'] != null
        ? Application.fromJson(json['application'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tenant = json['tenant'] != null ? Tenant.fromJson(json['tenant']) : null;
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (application != null) {
      data['application'] = application!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (tenant != null) {
      data['tenant'] = tenant!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}

class Application {
  String? version;
  String? releaseDate;
  dynamic features;

  Application({this.version, this.releaseDate, this.features});

  Application.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    releaseDate = json['releaseDate'];
    features = json['features'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['releaseDate'] = releaseDate;
    data['features'] = features;
    return data;
  }
}

class User {
  String? name;
  String? surname;
  String? userName;
  String? emailAddress;
  int? userTypeId;
  bool? isAdmin;
  int? id;

  User(
      {this.name,
      this.surname,
      this.userName,
      this.emailAddress,
      this.userTypeId,
      this.isAdmin,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    userTypeId = json['userTypeId'];
    isAdmin = json['isAdmin'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['userName'] = userName;
    data['emailAddress'] = emailAddress;
    data['userTypeId'] = userTypeId;
    data['isAdmin'] = isAdmin;
    data['id'] = id;
    return data;
  }
}

class Tenant {
  String? tenancyName;
  String? name;
  int? id;

  Tenant({this.tenancyName, this.name, this.id});

  Tenant.fromJson(Map<String, dynamic> json) {
    tenancyName = json['tenancyName'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tenancyName'] = tenancyName;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Company {
  String? name;
  String? primaryColor;
  String? secondaryColor;
  String? economicAgreementGrantToken;
  String? economicAppSecretToken;
  String? logoUrl;
  int? id;

  Company(
      {this.name,
      this.primaryColor,
      this.secondaryColor,
      this.economicAgreementGrantToken,
      this.economicAppSecretToken,
      this.logoUrl,
      this.id});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    primaryColor = json['primaryColor'];
    secondaryColor = json['secondaryColor'];
    economicAgreementGrantToken = json['economicAgreementGrantToken'];
    economicAppSecretToken = json['economicAppSecretToken'];
    logoUrl = json['logoUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['primaryColor'] = primaryColor;
    data['secondaryColor'] = secondaryColor;
    data['economicAgreementGrantToken'] = economicAgreementGrantToken;
    data['economicAppSecretToken'] = economicAppSecretToken;
    data['logoUrl'] = logoUrl;
    data['id'] = id;
    return data;
  }
}
