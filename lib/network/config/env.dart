class Env {
  static const localhost = "http://192.168.1.8:3000";
  static const stagingUrl = "https://dev.nadrus.app";
  static const liveUrl = "https://nadrus.app";

  //todo replace true with kDebugMode
  static const baseUrl = true ? stagingUrl : liveUrl;

  /// pagination
  static const perPage = 15;
}
