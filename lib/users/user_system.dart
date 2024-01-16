import 'dart:io';
import 'dart:async';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/users/login_choice.dart';
import 'package:gamebox_in_dart/globals.dart' as globals;

class UserSystem {
  late List<List<String>> userDetails;
  late String username;
  late String password;
  late String name;

  bool exitApp = false;
  bool errorHappened = false;
  bool loginSuccesful = false;

  Future<void> initialiseUserDetails() async {
    await readUserDetails().then((value) {
      userDetails = value;
    });
  }

  Future<List<List<String>>> readUserDetails() async {
    // open file
    File file = File('lib/users/user_details.csv');

    try {
      // read file
      String contents = await file.readAsString();
      // split file into lines in list/array
      List<String> lines = contents.split('\n');

      // creates 2d list/array
      List<List<String>> userDetails = [];

      // process each line into list/array
      for (int i = 0; i < lines.length; i++) {
        // split line into fields using the comma separator
        List<String> fields = lines[i].split(',');

        // add fields to the userDetails list
        userDetails.add(fields);
      }

      return userDetails;
    } catch (e) {
      print('Error reading user details: $e');
      return [];
    }
  }

  Future<int> findUserRow(String username, String password) async {
    for (int i = 1; i < userDetails.length; i++) {
      if (userDetails[i][1].trim() == username &&
          userDetails[i][2].trim() == password) {
        // Found the user, return 1-based index
        return i;
      }
    }
    return -1;
  }

  Future<void> signUp(userDetails) async {
    do {
      try {
        clearScreen();
        asciiLogo();

        print(
            'Due to a bug in the current version of Dart, everything here must be an odd number.');
        print('The name variables must be one word.');
        stdout.writeln();

        do {
          stdout.write('Name: ');
          name = stdin.readLineSync()!;

          if (name.length % 2 == 0) {
            stdout.writeln();
            print('As stated, names must be of an odd length');
          }
        } while (name.length % 2 == 0);

        do {
          stdout.write('Username: ');
          username = stdin.readLineSync()!;

          if (username.length % 2 == 0) {
            stdout.writeln();
            print('As stated, usernames must be of an odd length');
          }
        } while (username.length % 2 == 0);

        do {
          stdout.write('Password: ');
          password = stdin.readLineSync()!;

          if (password.length % 2 == 0) {
            stdout.writeln();
            print('As stated, passwords must be of an odd length');
          }
        } while (password.length % 2 == 0);

        // Check if the user already exists
        int existingUserRow = await findUserRow(username, password);

        if (existingUserRow != -1) {
          errorHappened = true;
          throw 'User already exists. Choose a different username or password.';
        } else {
          // Add the new user to the CSV file
          File file = File('lib/users/user_details.csv');
          IOSink sink = file.openWrite(mode: FileMode.append);

          sink.writeln();
          // Write user information without an extra newline
          sink.write('$name,$username,$password');

          // Optionally, add a newline if you want to separate user entries
          // sink.writeln();

          await sink.flush();
          await sink.close();

          print('User successfully signed up.');
          awaitContinue();

          await initialiseUserDetails();
          await initialiseLogin();
        }
      } catch (e) {
        print('There was an error: $e');
      }
    } while (errorHappened);
  }

  Future<void> login(userDetails) async {
    do {
      try {
        clearScreen();
        asciiLogo();

        if (Platform.isWindows) {
          print(
              'Due to a Windows bug, please only enter an odd number of characters here.');
          print('If you accidentally enter more then please use ^C to exit.');
        }

        stdout.write('Username: ');
        String username = stdin.readLineSync()!;

        stdout.write('Password: ');
        String password = stdin.readLineSync()!;

        int userRow = await findUserRow(username, password);

        if (userRow > 0) {
          name = userDetails[userRow][0];
          this.username = userDetails[userRow][1];
          this.password = userDetails[userRow][2];

          stdout.writeln();
          print(
              'Login Succesful. Welcome to GameBox, ${userDetails[userRow][0]}.');
          awaitContinue();
          loginSuccesful = true;
        } else {
          errorHappened = true;
          throw 'Username or password was incorrect. Please try again.';
        }
      } catch (e) {
        print('There was an error: $e');
        awaitContinue();
      }
    } while (errorHappened || !loginSuccesful);
  }

  Future<void> initialiseLogin() async {
    LoginChoice loginChoice = LoginChoice();

    switch (loginChoice.loginChoice) {
      case 1:
        await signUp(userDetails); // Add await here
        break;
      case 2:
        await login(userDetails); // Add await here
        break;
      case 3:
      default:
        exitApp = true;
        break;
    }
  }
}
