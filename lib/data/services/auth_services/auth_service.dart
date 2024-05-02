// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:social_media/data/model/auth_model/signup_user_model.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/data/secure_storage/secure_storage.dart';
import 'package:social_media/data/shared_preference/shared_preference.dart';
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
          headers: Endpoints.baseHeader, body: jsonEncode(body));
      if (respose.statusCode == 200) {
        final responseBody = jsonDecode(respose.body);
        final token = responseBody['after execution']['token'];
        return token;
      } else {
        throw Error();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //signup otp verification

  static Future<bool> otpVerification(
      {required String token,
      required String otp,
      required BuildContext context}) async {
    final String url = "${Endpoints.baseUrl}${Endpoints.varifyOtp}";
    var headers = {
      "x-api-key": Endpoints.apikey,
      "Content-type": "application/json",
      "x-temp-token": token
    };
    final body = {
      "otp": otp,
    };
    try {
      final respose = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      if (respose.statusCode == 200) {
        final resposeBody = jsonDecode(respose.body);
        final accessToken = resposeBody["after execution"]["accesstoken"];
        final refreshToken = resposeBody["after execution"]["refreshtoken"];

        SecureStorage().writeSecureData("AccessToken", accessToken);
        SecureStorage().writeSecureData("RefreshToken", refreshToken);
        return true;
      } else if (respose.statusCode == 400) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid otp")));
        return false;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception();
    }
  }

  //signin

  static Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    final String url = "${Endpoints.baseUrl}${Endpoints.signIn}";

    final body = {"email": email, "password": password};

    final response = await http.post(Uri.parse(url),
        headers: Endpoints.baseHeader, body: jsonEncode(body));
    if (response.statusCode == 200) {
      final resposeBody = jsonDecode(response.body);

      final accessToken = resposeBody["after execution"]["accesstoken"];
      final refreshToken = resposeBody["after execution"]["refreshtoken"];
      SharedPreferencesHelper.setLoggedIn(true);
      SecureStorage().writeSecureData("AccessToken", accessToken);
      SecureStorage().writeSecureData("RefreshToken", refreshToken);
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
        headers: Endpoints.baseHeader, body: jsonEncode(body));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final token = jsonBody["after execution"]["token"];
      return token;
    } else {
      throw Exception();
    }
  }

  //reset password
  static Future<bool> resetPassword(
      {required String token,
      required String otp,
      required String newPassword,
      required String confirmPassword,
      required BuildContext context}) async {
    final String url = "${Endpoints.baseUrl}${Endpoints.resetPassword}";
    final body = {
      "otp": otp,
      "password": newPassword,
      "confirmpassword": confirmPassword,
    };
    var headers = {
      "x-api-key": Endpoints.apikey,
      "Content-type": "application/json",
      "x-temp-token": token
    };
    final response = await http.patch(Uri.parse(url),
        headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          shape: Border(left: BorderSide()),
          backgroundColor: Colors.black,
          duration: Duration(milliseconds: 700),
          content: Text("Invalid otp")));
      return false;
    } else {
      return false;
    }
  }
}
