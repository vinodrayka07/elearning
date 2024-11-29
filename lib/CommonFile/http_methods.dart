import 'dart:io';
import 'package:elearner/CommonFile/CommonWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../app/data/apis/Api_Key_Constants/api_key_constants.dart';

class MyHttp {
  static Future<http.Response?> getMethod(
      {required String url, void Function(int)? checkResponse}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(ApiKeyConstants.token);
    Map<String, String> authorization = {};
    authorization = {
      "Authorization": "Bearer ${token ?? ''}",
      'Accept': 'application/json'
    };
    if (kDebugMode) print("URL:: $url");
    if (kDebugMode) print("TOKEN:: $authorization");
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      try {
        http.Response? response = await http.get(
          Uri.parse(url),
          headers: authorization,
        );
        if (kDebugMode) print("CALLING:: ${response.body}");
        if (await CommonWidget.responseCheckForGetMethod(response: response)) {
          checkResponse?.call(response.statusCode);
          return response;
        } else {
          checkResponse?.call(response.statusCode);
          if (kDebugMode) {
            print(
                "ERROR::statusCode=${response.statusCode}: :response=${response.body}");
          }
          return null;
        }
      } catch (e) {
        if (kDebugMode) print("EXCEPTION:: Server Down $e");
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> getMethodParams(
      {required Map<String, dynamic> queryParameters,
      required String baseUri,
      required String endPointUri,
      void Function(int)? checkResponse}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(ApiKeyConstants.token);
    Map<String, String> authorization = {};
    authorization = {
      "Authorization": "Bearer ${token ?? ''}",
      'Accept': 'application/json'
    };
    if (kDebugMode) print("endPointUri:: $endPointUri");
    if (kDebugMode) print("BASEURL:: $baseUri");
    if (kDebugMode) print("TOKEN:: $authorization");
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      try {
        Uri uri = Uri.http(baseUri, endPointUri, queryParameters);
        if (kDebugMode) print("URI:: $uri");
        http.Response? response = await http.get(uri, headers: authorization);
        if (kDebugMode) print("CALLING:: ${response.body}");
        if (await CommonWidget.responseCheckForGetMethod(
          response: response,
        )) {
          checkResponse?.call(response.statusCode);
          return response;
        } else {
          checkResponse?.call(response.statusCode);
          if (kDebugMode) {
            print(
                "ERROR::statusCode=${response.statusCode}: :response=${response.body}");
          }
          return null;
        }
      } catch (e) {
        if (kDebugMode) print("EXCEPTION:: Server Down");
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> postMethod(
      {required String url,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true,
      void Function(int)? checkResponse}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(ApiKeyConstants.token);
    Map<String, String> authorization = {};
    authorization = {
      "Authorization": "Bearer ${token ?? ''}",
      'Accept': 'application/json'
    };
    if (kDebugMode) print("URL:: $url");
    if (kDebugMode) print("TOKEN:: $authorization");
    if (kDebugMode) print("bodyParams:: ${bodyParams ?? {}}");
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      try {
        http.Response? response = await http.post(
          Uri.parse(url),
          body: bodyParams ?? {},
          headers: authorization,
        );
        if (kDebugMode) print("CALLING:: ${response.statusCode}");
        if (kDebugMode) print("CALLING:: ${response.body}");
        if (await CommonWidget.responseCheckForPostMethod(
          response: response,
        )) {
          checkResponse?.call(response.statusCode);
          return response;
        } else {
          checkResponse?.call(response.statusCode);
          if (kDebugMode) {
            print(
                "ERROR::statusCode=${response.statusCode}: :response=${response.body}");
          }
          return null;
        }
      } catch (e) {
        if (kDebugMode) print("EXCEPTION:: Server Down $e");
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> deleteMethod(
      {required String url,
      required Map<String, dynamic> bodyParams,
      void Function(int)? checkResponse}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(ApiKeyConstants.token);
    Map<String, String> authorization = {};
    authorization = {
      "Authorization": "Bearer ${token ?? ''}",
      'Accept': 'application/json'
    };
    if (kDebugMode) print("URL:: $url");
    if (kDebugMode) print("TOKEN:: $authorization");
    if (kDebugMode) print("bodyParams:: $bodyParams}");
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      try {
        http.Response? response = await http.delete(Uri.parse(url),
            body: bodyParams, headers: authorization);
        if (kDebugMode) print("CALLING:: ${response.body}");
        if (await CommonWidget.responseCheckForPostMethod(response: response)) {
          checkResponse?.call(response.statusCode);
          return response;
        } else {
          checkResponse?.call(response.statusCode);
          if (kDebugMode) {
            print(
                "ERROR::statusCode=${response.statusCode}: :response=${response.body}");
          }
          return null;
        }
      } catch (e) {
        if (kDebugMode) print("EXCEPTION:: Server Down");
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> multipart(
      {String multipartRequestType = 'POST', // POST or GET
      required String url,
      //Single Image Upload
      File? image,
      String? imageKey,
      Map<String, dynamic>? bodyParams,
      //Upload with Multiple key
      Map<String, File>? imageMap,
      //Upload with Single key
      List<File>? images,
      void Function(int)? checkResponse}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(ApiKeyConstants.token);
    if (kDebugMode) print("bodyParams:: ${bodyParams ?? {}}");
    if (kDebugMode) print("URL:: $url");
    if (kDebugMode) print("TOKEN:: $token");
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      try {
        http.Response res;
        var request =
            http.MultipartRequest(multipartRequestType, Uri.parse(url));
        request.headers.addAll({'Content-Type': 'multipart/form-data'});
        request.headers.addAll({'Accept': 'application/json'});
        request.headers['Authorization'] = "Bearer ${token ?? ''}";
        if (kDebugMode) print("CALLING:: $url");
        //Single Image Upload
        if (image != null && imageKey != null) {
          if (kDebugMode) print("imageKey:: $imageKey   image::$image");
          request.files.add(getUserProfileImageFile(
              image: image, userProfileImageKey: imageKey));
        }
        //Upload with Multiple key
        if (imageMap != null) {
          if (kDebugMode) print("imageMap:: $imageMap");
          imageMap.forEach((key, value) {
            request.files.add(getUserProfileImageFile(
                image: value, userProfileImageKey: key));
          });
        }
        //Upload with Single key
        if (images != null && imageKey != null) {
          for (int i = 0; i < images.length; i++) {
            request.files.add(getUserProfileImageFile(
                image: images[i], userProfileImageKey: imageKey));
            /*var stream = http.ByteStream(images[i].openRead());
            var length = await images[i].length();
            var multipartFile = http.MultipartFile(imageKey, stream, length,
                filename: images[i].path);
            request.files.add(multipartFile);*/
          }
        }

        if (bodyParams != null) {
          if (kDebugMode) print("bodyParams:: $bodyParams");
          bodyParams.forEach((key, value) {
            request.fields[key] = value;
          });
        }
        var response = await request.send();
        res = await http.Response.fromStream(response);
        if (kDebugMode) print("CALLING:: ${res.body}");
        if (await CommonWidget.responseCheckForPostMethod(response: res)) {
          checkResponse?.call(response.statusCode);
          return res;
        } else {
          checkResponse?.call(response.statusCode);
          if (kDebugMode) {
            print("ERROR::statusCode=${res.statusCode}: :response=${res.body}");
          }
          return null;
        }
      } catch (e) {
        if (kDebugMode) print("EXCEPTION:: Server Down");
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> myMultipart(
      {String multipartRequestType = 'POST', // POST or GET
      required String url,
      File? image,
      String? imageKey,
      Map<String, dynamic>? bodyParams,
      List<File>? images,
      void Function(int)? checkResponse}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(ApiKeyConstants.token);
    if (kDebugMode) print("bodyParams:: ${bodyParams ?? {}}");
    if (kDebugMode) print("URL:: $url");
    //if (kDebugMode) print("TOKEN:: $token");
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      try {
        http.Response res;
        var request =
            http.MultipartRequest(multipartRequestType, Uri.parse(url));
        request.headers.addAll({'Content-Type': 'multipart/form-data'});
        request.headers.addAll({'Accept': 'application/json'});
        // request.headers['Authorization'] = "Bearer ${token ?? ''}";
        if (kDebugMode) print("CALLING:: $url");
        //Single Image Upload
        if (image != null && imageKey != null) {
          if (kDebugMode) print("imageKey:: $imageKey   image::$image");
          request.files.add(getUserProfileImageFile(
              image: image, userProfileImageKey: imageKey));
        }
        //Upload with Single key
        if (images != null && imageKey != null) {
          for (int i = 0; i < images.length; i++) {
            request.files.add(getUserProfileImageFile(
                image: images[i], userProfileImageKey: imageKey));
          }
        }

        if (bodyParams != null) {
          if (kDebugMode) print("bodyParams:: $bodyParams");
          bodyParams.forEach((key, value) {
            request.fields[key] = value;
          });
        }
        var response = await request.send();
        res = await http.Response.fromStream(response);
        if (kDebugMode) print("CALLING:: ${res.body}");
        if (await CommonWidget.responseCheckForPostMethod(response: res)) {
          checkResponse?.call(response.statusCode);
          return res;
        } else {
          checkResponse?.call(response.statusCode);
          if (kDebugMode) {
            print("ERROR::statusCode=${res.statusCode}: :response=${res.body}");
          }
          return null;
        }
      } catch (e) {
        if (kDebugMode) print("EXCEPTION:: Server Down");
        return null;
      }
    } else {
      return null;
    }
  }

  static http.MultipartFile getUserProfileImageFile(
      {File? image, required String userProfileImageKey}) {
    return http.MultipartFile.fromBytes(
      userProfileImageKey, image!.readAsBytesSync(),
      filename: image.uri.pathSegments.last,
      //  contentType: MediaType('image', 'jpg')
    );
  }
}
