import 'dart:convert';
import 'dart:developer';

import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/data/secure_storage/secure_storage.dart';
import 'package:social_media/data/services/access_genrator/access_generator.dart';
import 'package:social_media/presentation/utils/endpoints/endpoints.dart';
import 'package:http/http.dart' as http;

class PostService {
  static Future<void> uploadPost(
      {required String media, required String caption}) async {
    final url = "${Endpoints.baseUrl}${Endpoints.postUrl}";
    final accessToken = await SecureStorage().readSecureData('AccessToken');
    var posteHeader = {
      "x-api-key": Endpoints.apikey,
      "Content-type": "application/json",
      "x-access-token": accessToken,
    };
    final request = http.MultipartRequest('POST', Uri.parse(url));
    
    try {
      request.headers.addAll(posteHeader);
      request.fields['caption'] = caption;
      if (media.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'media',
            media,
          ),
        );
      }
      await request.send();
    } catch (e) {
      throw Exception('');
    }
  }

  //fetch
  static Future<List<PostModel>> getpost() async {
    final url = "${Endpoints.baseUrl}${Endpoints.postUrl}";
    final accessToken = await SecureStorage().readSecureData('AccessToken');
    final refreshToken = await SecureStorage().readSecureData('RefreshToken');

    var postHeader = {
      "x-api-key": Endpoints.apikey,
      "Content-type": "application/json",
      "x-access-token": accessToken,
    };
    final response = await http.get(Uri.parse(url), headers: postHeader);
    log(response.body);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body)["after execution"];
      final List<PostModel> postDetails =
          List<PostModel>.from(responseBody.map((e) => PostModel.fromJson(e)));
      return postDetails;
    }
    if (response.statusCode == 401) {
      final newAccessToken = await AccessGenerator.accessGenerating(
          accessToken: accessToken, refreshToken: refreshToken);
      SecureStorage().writeSecureData('AccessToken', newAccessToken);

      postHeader["x-access-token"] = newAccessToken;
      return await getpost();
    }
    throw Exception();
  }
}
