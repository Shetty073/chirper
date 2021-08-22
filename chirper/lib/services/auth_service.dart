import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:chirper/helpers/constants.dart';

class AuthService {
  // register user
  Future register({required Map<String, String> data}) async {
    var response;
    try {
      response = await http.post(
        Uri.parse(Constants.REGISTER_URI),
        body: {
          'name': data['name'],
          'email': data['email'],
          'password': data['password'],
          'dob': data['dob'],
        }
      ).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Request timed out. Server not responding.');
        }
      );
    } on SocketException catch(_) {
      return {
        // Internet is off
        'userId': null,
        'message': 'Internet connection not available. Please check your connection and retry.'
      };
    } on TimeoutException catch(_) {
      return {
        'userId': null,
        'message': 'Error! Request timed out. Server not responding.'
      };
    } on HttpException catch(_) {
      return {
        'userId': null,
        'message': 'Error! Bad Response. Server not responding.'
      };
    }

    final Map responseBody = json.decode(response.body);
    if(response.statusCode == 200) {
      // request was successful
      if(responseBody['success']) {
        Map responseData = {
          'userId': responseBody['user']['_id'],
          'authToken': response.headers['authorization']
        };
        return responseData;

      } else {
        // request failed
        return {
          'userId': null,
          'message': responseBody['message']
        };
      }
    } else {
      // request failed
      return {
        'userId': null,
        'message': responseBody['message'] == null ? 'Server error! Please try again later' : responseBody['message'],
      };
    }
  }

  // login user
  Future login({required Map<String, String> data}) async {
    var response;
    try {
      response = await http.post(
        Uri.parse(Constants.LOGIN_URI),
        body: {
          'email': data['email'],
          'password': data['password'],
        }
      ).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Request timed out. Server not responding.');
        }
      );
    } on SocketException catch(_) {
      return {
        // Internet is off
        'userId': null,
        'message': 'Internet connection not available. Please check your connection and retry.'
      };
    } on TimeoutException catch(_) {
      return {
        'userId': null,
        'message': 'Error! Request timed out. Server not responding.'
      };
    } on HttpException catch(_) {
      return {
        'userId': null,
        'message': 'Error! Bad Response. Server not responding.'
      };
    }

    final Map responseBody = json.decode(response.body);
    if(response.statusCode == 200) {
      // request was successful
      if(responseBody['success']) {
        Map responseData = {
          'userId': responseBody['user']['_id'],
          'authToken': response.headers['authorization']
        };
        return responseData;

      } else {
        // request failed
        return {
          'userId': null,
          'message': responseBody['message']
        };
      }
    } else {
      // request failed
      return {
        'userId': null,
        'message': responseBody['message'] == null ? 'Server error! Please try again later' : responseBody['message'],
      };
    }
  }
}
