import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/games/game_selection.dart';

class GameSelection {
  void gameSelection(user) {
    // Function to call in main.dart
    gameSelectionMenu(user); // Game Selection

    switch (user.choice) {
      // Logic for game selections
      case 1:
        rockPaperScissors(user);
        break;
      default:
        throw 'I don\'t quite know how you managed to do this.';
    }
  }

  void rockPaperScissors(user) {
    print('Called rockPaperScissors(), error must be inside function.');
    awaitContinue();

    // calls function in abvious way - error handling done here
    String programLoop;

    do {
      try {
        rockPaperScissors(user);
        programLoop = continueAppLoop();
      } catch (e) {
        print('There was an error: $e');
        programLoop = continueAppLoop();
      }
    } while (programLoop == 'y');
  }

  void chaseGame(
      user) {} // calls function in obvious way - error handling done here
}
