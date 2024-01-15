import 'dart:io';
import 'dart:async';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/users/login_choice.dart';
import 'package:gamebox_in_dart/users/login.dart';
import 'package:gamebox_in_dart/users/sign_up.dart';
import 'package:gamebox_in_dart/globals.dart' as globals;

class User {
  late String username;
  late String password;
  late int loginChoice;
  bool errorHappened = false;
  bool loginOptionSuccesful = false;
  bool loginSuccesful = false;
  bool exitApp = false;

  Future<List<String>> initialiseUser() async {
    List<String> userDetails  = ['','',''];
    LoginChoice loginChoice = LoginChoice();

    switch (loginChoice.loginChoice) {
      case 1:
        userDetails = signUp();
        break;
      case 2:
        userDetails = await loginLoop();
        break;
      case 3:
        exitApp = true;
        break;

    }

    return userDetails;
  }

  Future<List<String>> loginLoop() async {
    List<String> userDetails  = ['',''];

    do {
      userDetails = await login();

      if (userDetails[2] != 'true') {
        print('Login Unsuccesful');
        awaitContinue();
      }
    } while (userDetails[2] != 'true');

    print('Login Succesful');
    awaitContinue();

    return userDetails;
  }
}

Future<List<List<String>>> readUserDataFile() async {
    // open file
    File file = File('lib/users/user_details.csv');

    try {
      // read file
      String contents = await file.readAsString();
      // split file into lines in list/array
      List<String> lines = contents.split('\n');

      globals.debugVariable = 'debug';
      globals.debugFileRead = contents;
      globals.lengthOfFile = lines.length;

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
