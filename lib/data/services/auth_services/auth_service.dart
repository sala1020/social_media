import 'dart:convert';
import 'package:social_media/data/model/signup_user_model.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/presentation/utils/endpoints/endpoints.dart';

class AuthService {
  //signup

  static Future<String> createUser({required UserModel userData}) async {
    final String url = "${Endpoints.baseUrl}${Endpoints.signUp}";
    final body = {
      "name": userData.name,
      "username": userData.username,
      "email": userData.email,
      "password": userData.password,
      "confirmpassword": userData.confirmPassword
    };

    try {
      var respose = await http.post(Uri.parse(url),
          headers: Endpoints.header, body: jsonEncode(body));
      print(respose.statusCode);
      if (respose.statusCode == 200) {
        final responseBody = jsonDecode(respose.body);
        final token = responseBody['after execution']['token'];
        print('suxxess');
        return token;
      } else {
        throw Error();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  //signup otp verification

  static Future<void> otpVerification(
      {required String token, required String otp}) async {
    final String url = "${Endpoints.baseUrl}${Endpoints.varifyOtp}";
    print(token);
    var headers = {
      "x-api-key": "apikey@ciao",
      "Content-type": "application/json",
      "x-temp-token": token
    };
    final body = {
      "otp": otp,
    };
    try {
      final respose = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      print(respose.statusCode);
      if (respose.statusCode == 200) {
        print('successfully verifies');
      } else {
        print('error occured');
      }
    } catch (e) {
      print(e);
    }
  }
}
