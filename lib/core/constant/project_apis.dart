class ProjectAPIs {
  static Mock mock = Mock();
  static const String authenticate = "/login";
  static const String profile = "/auth/me";
 
}

class Mock{
  final String kProfile = "assets/mock/users.json";
}