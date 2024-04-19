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

  static Future<bool> otpVerification(
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
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception();
    }
  }

  //signin

  static Future<bool> signIn(
      {required String email, required String password}) async {
    final String url = "${Endpoints.baseUrl}${Endpoints.signIn}";

    final body = {"email": email, "password": password};

    final response = await http.post(Uri.parse(url),
        headers: Endpoints.header, body: jsonEncode(body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  //forgotPassword

  static Future<String> verifyEmail({required String email}) async {
    final String url = "${Endpoints.baseUrl}${Endpoints.forgotPassword}";
    final body = {"email": email};
    final response = await http.post(Uri.parse(url),
        headers: Endpoints.header, body: jsonEncode(body));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final token = jsonBody["after execution"]["token"];
      print(token);
      return token;
    } else {
      throw Exception();
    }
  }

  //reset password
  static Future<bool> resetPassword({
    required String token,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final String url = "${Endpoints.baseUrl}${Endpoints.resetPassword}";
    final body = {
      "otp": otp,
      "password": newPassword,
      "confirmpassword": confirmPassword,
    };
    var headers = {
      "x-api-key": "apikey@ciao",
      "Content-type": "application/json",
      "x-temp-token": token
    };
    final response = await http.patch(Uri.parse(url),
        headers: headers, body: jsonEncode(body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
