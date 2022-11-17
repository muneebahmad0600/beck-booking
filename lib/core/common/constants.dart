// ignore_for_file: constant_identifier_names

class Constant {
  static const USER_ID_KEY = 'userId';
  static const USER_EMAIL_KEY = 'email';
  static const PERSON_ID_KEY = 'personId';
  static const AUTH_TOKEN_KEY = 'authToken';
  static const TENANT_COOKIE_KEY = 'Abp.TenantId';
  static const USER_ID_TOKEN_KEY =
      'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier';
}

class ActivityStatuses {
  static const NotYetAnswered = 0;
  static const Comming = 1;
  static const NotComming = 2;
}
