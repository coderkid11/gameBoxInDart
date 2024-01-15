// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/users/user_system.dart';
import 'package:gamebox_in_dart/globals.dart' as globals;

Future<List<String>> login() async {
  List<String> userDetails = ['', '', ''];
  var userDetailsCSV;
  String username;
  String password = 'hellworld';

  clearScreen();
  asciiLogo();

  userDetailsCSV = await readUserDataFile();

  stdout.write('Username: ');
  username = stdin.readLineSync()!;

  //stdout.write('Password: ');
  //password = stdin.readLineSync()!;
  //stdout.writeln();

  print(globals.debugVariable);
  print(globals.debugFileRead);
  print(globals.lengthOfFile);
  
  print('Before for loop');
  awaitContinue();

  for (int i = 0; i < globals.lengthOfFile; i++) {
    if (userDetailsCSV[i][1] == username && userDetailsCSV[i][2] == password) {
      userDetails[0] = userDetailsCSV[i][1];
      userDetails[1] = userDetailsCSV[i][2];
      userDetails[2] = 'true';
      return userDetails;
    }
  }

  print('After for loop');
  awaitContinue();

  print(userDetails);
  print(userDetails); 
  
  // Login failed, return userDetails indicating failure
  return userDetails;
}
