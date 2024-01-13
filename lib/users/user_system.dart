import 'dart:io';
import 'dart:async';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';

class User {
  late String username;
  late String password;
  late bool errorHappened;

  User() {
    do {
      clearScreen();
      asciiLogo();
      loginMenu();
      loginLogic();
    } while (errorHappened);
  }

  Future<dynamic> loginMenu() async {
    int windowWidth = 15;

    for (var i = 0; i <= windowWidth; i++) {
      stdout.write("-");
    }
    print("");

    print("|  Login Menu  |");
    print("|              |");
    print("|  1. Sign Up  |");
    print("|  2. Login    |");
    print("|  3. Leave    |");
    print("|              |");

    for (var i = 0; i <= windowWidth; i++) {
      stdout.write("-");
    }
    print("");
  }

  Future<dynamic> loginLogic() async {
    stdout.write("Choice (1/2/3): ");
    int choice = int.parse(stdin.readLineSync()!);

    try {
      switch (choice) {
      case 1:
        errorHappened = false;
        signUp();
        break;
      case 2:
        login();
        errorHappened = false;
        break;
      case 3:
        errorHappened = false;
        break;
      default:
        throw Exception("Choice doesn't exist. Please try again.");
        }
      } catch(e) {
        print("There was an error: $e");
        awaitContinue();
        errorHappened = true;
    }
  }

  Future<dynamic> signUp() async {
    null;
  }

  Future<dynamic> login() async {
    null;
  }
}