import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chirper/helpers/constants.dart';
import 'package:chirper/helpers/secure_storage_helper.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ChirpService {
  final secureStorageHelper = SecureStorageHelper();

  Future sendChirp({required String chirp, MultipartFile? photo}) async {
    String token = await secureStorageHelper.readVal(key: 'authToken');

    var request =
        http.MultipartRequest('POST', Uri.parse(Constants.CREATE_CHIRP_URI));
    request.fields.addAll({'chirp': chirp});
    if (photo != null) {
      request.files.add(photo);
    }

    request.headers.addAll({
      HttpHeaders.authorizationHeader: token,
    });

    var streamedResponse;
    try {
      streamedResponse =
          await request.send().timeout(Duration(seconds: 120), onTimeout: () {
        throw TimeoutException('Request timed out. Server not responding.');
      });
    } on SocketException catch (_) {
      return {
        // Internet is off
        'nModified': null,
        'message':
            'Internet connection not available. Please check your connection and retry.'
      };
    } on TimeoutException catch (_) {
      return {
        'nModified': null,
        'message': 'Error! Request timed out. Server not responding.'
      };
    } on HttpException catch (_) {
      return {
        'nModified': null,
        'message': 'Error! Bad Response. Server not responding.'
      };
    }

    var response = await Response.fromStream(streamedResponse);
    final Map responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      // request was successful
      if (responseBody['success']) {
        Map responseData = {
          'nModified': responseBody['nModified'],
          'chirp': responseBody['chirp'],
          'authToken': response.headers['authorization']
        };
        return responseData;
      } else {
        // request failed
        return {'nModified': null, 'message': responseBody['message']};
      }
    } else {
      // request failed
      return {
        'nModified': null,
        'message':
            responseBody['message'] ?? 'Server error! Please try again later',
      };
    }
  }

  Future getHomeFeed() async {
    String token = await secureStorageHelper.readVal(key: 'authToken');

    var response;
    try {
      response = await http.get(
        Uri.parse(Constants.FEED_URI),
        headers: {HttpHeaders.authorizationHeader: token},
      ).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('Request timed out. Server not responding.');
      });
    } on SocketException catch (_) {
      return {
        // Internet is off
        'userId': null,
        'message':
            'Internet connection not available. Please check your connection and retry.'
      };
    } on TimeoutException catch (_) {
      return {
        'userId': null,
        'message': 'Error! Request timed out. Server not responding.'
      };
    } on HttpException catch (_) {
      return {
        'userId': null,
        'message': 'Error! Bad Response. Server not responding.'
      };
    }

    final Map responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      // request was successful
      if (responseBody['success']) {
        Map responseData = {
          'chirps': responseBody['chirps'],
          'authToken': response.headers['authorization'],
        };
        return responseData;
      } else {
        // request failed
        return {'chirps': null, 'message': responseBody['message']};
      }
    } else {
      // request failed
      return {
        'chirps': null,
        'message':
            responseBody['message'] ?? 'Server error! Please try again later',
      };
    }
  }
}
