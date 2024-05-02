import 'dart:convert';

import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/data/services/access_genrator/access_generator.dart';
import 'package:social_media/presentation/utils/endpoints/endpoints.dart';
import 'package:http/http.dart' as http;

import '../../secure_storage/secure_storage.dart';

class ProfileService {
  static Future<UserProfile> getUser() async {
    final url = '${Endpoints.baseUrl}${Endpoints.profile}';

    final accessToken = await SecureStorage().readSecureData('AccessToken');
    final refreshToken = await SecureStorage().readSecureData('RefreshToken');

    var profileHeader = {
      "x-api-key": Endpoints.apikey,
      "Content-type": "application/json",
      "x-access-token": accessToken,
    };

    final response = await http.get(Uri.parse(url), headers: profileHeader);
    print(response.body);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body)['after execution'];
      final details = UserProfile.fromJson(responseBody);
      return details;
    }

    if (response.statusCode == 401) {
      final newAccessToken = await AccessGenerator.accessGenerating(
          accessToken: accessToken, refreshToken: refreshToken);
      SecureStorage().writeSecureData('AccessToken', newAccessToken);

      profileHeader["x-access-token"] = newAccessToken;
      return await getUser();
    }

    throw Exception("Unexpected status code: ${response.statusCode}");
  }
}
