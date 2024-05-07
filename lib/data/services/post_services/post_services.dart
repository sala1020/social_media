import 'dart:convert';
import 'dart:developer';

import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/data/secure_storage/secure_storage.dart';
import 'package:social_media/data/services/access_genrator/access_generator.dart';
import 'package:social_media/presentation/utils/endpoints/endpoints.dart';
import 'package:http/http.dart' as http;

class PostService {
  static Future<bool> uploadPost(
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
      return true;
    } catch (e) {
      return false;
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
    log(response.body.isEmpty.toString());
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body)["after execution"];
      if (responseBody != null) {
        final List<PostModel> postDetails = List<PostModel>.from(
            responseBody.map((e) => PostModel.fromJson(e)));
        return postDetails;
      } else {
        return [];
      }
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

  static Future<bool> postDelete({required String postID}) async {
    final url = '${Endpoints.baseUrl}${Endpoints.deletePostUrl}';
    final accessToken = await SecureStorage().readSecureData('AccessToken');
    var body = {'postid': postID};
    var postHeader = {
      "x-api-key": Endpoints.apikey,
      "Content-type": "application/json",
      "x-access-token": accessToken,
    };
    final response = await http.delete(Uri.parse(url),
        headers: postHeader, body: jsonEncode(body));
    if (response.statusCode==200) {
      return true;
    }else{
      return false;
    }
  }

  static Future<bool> likePost({required String postID}) async {
    log(postID);
    final url = '${Endpoints.baseUrl}${Endpoints.likePost}$postID';
    final accessToken = await SecureStorage().readSecureData('AccessToken');
    var postHeader = {
      "x-api-key": Endpoints.apikey,
      "Content-type": "application/json",
      "x-access-token": accessToken,
    };
    try {
      final response = await http.post(Uri.parse(url), headers: postHeader);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
