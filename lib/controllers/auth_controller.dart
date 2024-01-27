import 'dart:convert';
import 'dart:developer';

import '../extensions/live_data_extension.dart';
import '../models/data_models.dart';
import '../storage/secure_storage.dart';

late LoginResponse user;

final userLiveData = const LoginResponse().liveData;

class AuthenticationController {
  /// save user object in localStorage
  static login(LoginResponse object) async {
    await saveUser(object);
    if (user.accessToken != null) {
      await SecureStorage.write(key: 'token', value: user.accessToken!);
    }
  }

  static Future<void> saveUser(LoginResponse object) async {
    user = object;
    log(user.toJson().toString(), name: "saveUser");
    userLiveData.postValue(object);
    await SecureStorage.write(key: 'user', value: json.encode(user.toJson()));
  }

  /// get User which saved in localStorage.
  ///
  /// and save it in global variable, no need to use async/await when you need to localUser.
  static Future<LoginResponse> getUser() async {
    var userObject = await SecureStorage.read(key: 'user');
    user = LoginResponse.fromJson(json.decode(userObject ?? '{}'));
    userLiveData.postValue(user);
    return user;
  }

  /// get jwt token from localStorage
  static Future<String> token() async {
    return await SecureStorage.read(key: 'token') ?? '';
  }

  /// return `true` if User object exists in localStorage
  static Future<bool> loggedIn() async {
    final object = await getUser();
    return object.user?.id != null;
  }

  /// Clear localStorage and local-Database
  static logOut() async {
    await SecureStorage.deleteAll();
  }
}
