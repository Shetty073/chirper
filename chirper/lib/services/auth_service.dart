import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chirper/data/models/user.dart';
import 'package:chirper/helpers/constants.dart';
import 'package:chirper/services/boxes.dart';
import 'package:chirper/services/socket_io_service.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // register user
  Future register({required Map<String, String> data}) async {
    var response;
    try {
      response = await http.post(Uri.parse(Constants.REGISTER_URI), body: {
        'name': data['name'],
        'email': data['email'],
        'password': data['password'],
        'dob': data['dob'],
      }).timeout(Duration(seconds: 10), onTimeout: () {
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
          'userId': responseBody['user']['_id'],
          'authToken': response.headers['authorization']
        };

        // save user's data
        User user = User()
          ..userId = responseBody['user']['_id']
          ..name = responseBody['user']['name']
          ..username = responseBody['user']['username']
          ..followers = responseBody['user']['followers'].length
          ..following = responseBody['user']['following'].length;

        final box = Boxes.getUsers();
        box.put('user', user);
        SocketIoService.listen();

        // return the response data
        return responseData;
      } else {
        // request failed
        return {'userId': null, 'message': responseBody['message']};
      }
    } else {
      // request failed
      return {
        'userId': null,
        'message':
            responseBody['message'] ?? 'Server error! Please try again later',
      };
    }
  }

  // login user
  Future login({required Map<String, String> data}) async {
    var response;
    try {
      response = await http.post(Uri.parse(Constants.LOGIN_URI), body: {
        'email': data['email'],
        'password': data['password'],
      }).timeout(Duration(seconds: 10), onTimeout: () {
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
          'userId': responseBody['user']['_id'],
          'authToken': response.headers['authorization']
        };

        // save user's data
        User user = User()
          ..userId = responseBody['user']['_id']
          ..name = responseBody['user']['name']
          ..username = responseBody['user']['username']
          ..photo = responseBody['user']['photo']
          ..followers = responseBody['user']['followers'].length
          ..following = responseBody['user']['following'].length;

        final box = Boxes.getUsers();
        box.put('user', user);
        SocketIoService.listen();

        return responseData;
      } else {
        // request failed
        return {'userId': null, 'message': responseBody['message']};
      }
    } else {
      // request failed
      return {
        'userId': null,
        'message':
            responseBody['message'] ?? 'Server error! Please try again later',
      };
    }
  }
}
