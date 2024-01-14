// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/users/user_system.dart';

List<String> login() {
  List<String> userDetails = ['', '', ''];
  var userDetailsCSV;
  String username;
  String password = 'hellworld';

  userDetailsCSV = readUserDataFile();

  clearScreen();
  asciiLogo();

  stdout.write('Username: ');
  username = stdin.readLineSync()!;

  print('In Between');

  //stdout.write('Password: ');
  //password = stdin.readLineSync()!;
  //stdout.writeln();

  print('Before for loop');

  for (int i = 0; i < getColumnLength(userDetailsCSV, 0); i++) {
    if (userDetailsCSV[i][1] == username && userDetailsCSV[i][2] == password) {
      userDetails[0] = userDetailsCSV[i][1];
      userDetails[1] = userDetailsCSV[i][2];
      userDetails[2] = 'true';
      return userDetails;
    }
  }

  print('After for loop');

  // Login failed, return userDetails indicating failure
  return userDetails;
}