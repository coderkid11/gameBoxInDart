import 'dart:io';
import 'dart:async';
import 'package:gamebox_in_dart/users/login_choice.dart';
import 'package:gamebox_in_dart/users/login.dart';
import 'package:gamebox_in_dart/users/sign_up.dart';

class User {
  late String username;
  late String password;
  late int loginChoice;
  bool errorHappened = false;
  bool loginOptionSuccesful = false;
  bool loginSuccesful = false;
  bool exitApp = false;

  User() {
    List<String> userDetails = initialiseUser();

    username = userDetails[0];
    password = userDetails[1];
  }

  List<String> initialiseUser() {
    List<String> userDetails  = ['','',''];
    LoginChoice loginChoice = LoginChoice();

    switch (loginChoice.loginChoice) {
      case 1:
        userDetails = signUp();
        break;
      case 2:
        userDetails = loginLoop();
        break;
      case 3:
        exitApp = true;
        break;

    }

    return userDetails;
  }

  List<String> loginLoop() {
    List<String> userDetails  = ['',''];

    do {
      userDetails = login();
    } while (userDetails[2] != 'true');

    return userDetails;
  }
}

Future<List<List<String>>> readUserDataFile() async {
    // open file
    File file = File('user_details.csv');

    try {
      // read file
      String contents = await file.readAsString();
      // split file into lines in list/array
      List<String> lines = contents.split('\n');

      // creates 2d list/array
      List<List<String>> userDetails = [];

      // process each line into list/array
      for (String line in lines) {
        // split line into fields using the comma separator
        List<String> fields = line.split(',');

        // add fields to the userDetails list
        userDetails.add(fields);
      }

      return userDetails;
    } catch(e) {
      print('Error reading user details: $e');
      return [];
    }
  }