import 'dart:developer';

import 'package:video_streaming_ui/network_handler/network_handler.dart';
import 'package:video_streaming_ui/pages/signup-page/model/model.dart';

class SignupRepository {
  Future<UserModel> signup(Map<String, dynamic> variables) async {
    try {
      log('creating user ---> $variables');
      final response = await NetworkHandler.post('users', variables);
      log('create user response ---> $response');
      return UserModel.fromJson(response);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
