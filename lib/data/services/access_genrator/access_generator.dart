import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:social_media/presentation/utils/endpoints/endpoints.dart';

class AccessGenerator {
  static Future<String> accessGenerating(
      {required String accessToken, required String refreshToken}) async {
    final url = '${Endpoints.baseUrl}${Endpoints.genratorUrl}';

    final header = {
      "x-api-key": Endpoints.apikey,
      "Content-type": "application/json",
      "x-access-token": accessToken,
      "x-refresh-token": refreshToken
    };

    final response = await http.get(Uri.parse(url), headers: header);

    log("${response.statusCode}");
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final newAccessToken = responseBody["after execution"];
 
      return newAccessToken;
    }
    throw Exception();
  }
}
