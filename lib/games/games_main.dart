import 'dart:io';
import 'package:gamebox_in_dart/games/game_selection.dart';
import 'package:gamebox_in_dart/games/rock_paper_scissors.dart';
import 'package:gamebox_in_dart/main.dart';

class GameSelection {
  Future<void> gameSelection(user) async {
    // Function to call in main.dart
    gameSelectionMenu(user); // Game Selection

    switch (user.choice) {
      // Logic for game selections
      case 1:
        await rockPaperScissors(user);
        break;
      default:
        throw 'I don\'t quite know how you managed to do this.';
    }
  }

  Future<void> rockPaperScissors(user) async {
    // calls function in abvious way - error handling done here
    bool errorHappened = false;

    do {
      try {
        RockPaperScissors rockPaperScissorsClass = RockPaperScissors();
        await rockPaperScissorsClass.rockPaperScissorsGame(user);
        await rockPaperScissorsClass.finalHighScore(user);
      } catch (e) {
        print('There was an error: $e');
        errorHappened = true;
        awaitContinue();
      }
    } while (errorHappened);
  }

  void chaseGame(
      user) {} // calls function in obvious way - error handling done here

  bool continueGameLoop() {
    String programLoop;
    stdout.writeln();
    stdout.write("Restart game (y/n): ");
    programLoop = stdin.readLineSync()!;

    if (programLoop == 'y') {
      return true;
    } else {
      return false;
    }
  }
}
