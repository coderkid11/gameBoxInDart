import 'dart:io';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/main.dart';

void gameSelectionMenu(user) {
  bool errorHappened = false;
  int tempUserChoice = 0;

  clearScreen();
  asciiLogo();

  do {
    try {
      printGameMenu();

      tempUserChoice = userGameMenuChoice();

      if (tempUserChoice >= 0 || tempUserChoice <= 2) {
        user.choice = tempUserChoice;
      } else {
        if (tempUserChoice != -1) {
          throw 'That game is not released yet...';
        } else {
          throw 'Choice $tempUserChoice is not a valid choice.';
        }
      }
    } catch (e) {
      print('There was an error: $e');
      awaitContinue();
      errorHappened = true;
    }
  } while (errorHappened);
}

void printGameMenu() {
  for (int i = 0; i <= 25; i++) {
    stdout.write('-');
  }
  stdout.writeln();

  print('|     Game Selection     |');
  print('|                        |');
  print('| 1. Rock Paper Scissors |');
  print('|     2. Chase Game      |');
  print('|   3. Coming Soon...    |');
  print('|   4. Coming Soon...    |');
  print('|                        |');

  for (int i = 0; i <= 25; i++) {
    stdout.write('-');
  }
  stdout.writeln();
}

int userGameMenuChoice() {
  int userChoice = -1;

  stdout.writeln();

  stdout.write('Choice (1/2/3/4): ');
  userChoice = int.parse(stdin.readLineSync()!);

  return userChoice;
}
