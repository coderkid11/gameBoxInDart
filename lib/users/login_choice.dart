import 'dart:io';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';

class LoginChoice {
  late int loginChoice;
  bool errorHappened = false;
  bool loginOptionSuccesful = false;

  LoginChoice() {
    loginChoice = loginOption();
  }

  int loginOption() {
    do {
      try {
        errorHappened = false;
        clearScreen();
        asciiLogo();
        printLoginMenu();
        int loginChoice = pickOption();
        loginOptionSuccesful = checkOption(loginChoice);
      } catch(e) {
        print("There was an error: $e");
        errorHappened = true;
        awaitContinue();
      }
    } while (loginOptionSuccesful == false || errorHappened);

    return loginChoice;
  }

  void printLoginMenu() {
    for (int i = 0; i <= 15; i++) {
      stdout.write('-');
    } stdout.writeln();

    print('|  Login Menu  |');
    print('|              |');
    print('|  1. Sign Up  |');
    print('|   2. Login   |');
    print('|   3. Leave   |');
    print('|              |');

    for (int i = 0; i <= 15; i++) {
      stdout.write('-');
    } stdout.writeln();
  }

  int pickOption() {
    stdout.write('Choice (1/2/3): ');
    loginChoice = int.parse(stdin.readLineSync()!);
    return loginChoice;
  }

  bool checkOption(int loginChoice) {
    switch (this.loginChoice) {
      case 1:
      case 2:
      case 3:
        return true;
      default:
        throw 'Option $loginChoice doesn\'t exist. Please try again.';
    }
  }
}