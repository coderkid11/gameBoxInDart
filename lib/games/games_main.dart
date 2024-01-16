import 'dart:io';
import 'dart:async';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/users/user_system.dart';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/games/game_selection.dart';
import 'package:gamebox_in_dart/globals.dart' as globals;

class GameSelection {
  late int gameChoice;

  void gameSelection(user) {
    gameSelectionMenu(user);

    switch (user.choice) {
      case 1:
        rockPaperScissors(user);
        break;
      default:
        throw 'I don\'t quite know how you managed to do this.';
    }
  }

  void rockPaperScissors(user) {
    clearScreen();
    asciiLogo();

    print('Welcome to Rock Paper Scissors, ${user.name}.');
    awaitContinue();
  }

  void chaseGame() {}
}
