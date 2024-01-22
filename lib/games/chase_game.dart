import 'dart:io';
import 'package:gamebox_in_dart/users/user_system.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/main.dart';

class ChaseGame {
  dynamic score = '0';
  late int highScore;
  late List<dynamic> scoreList;
  late List<dynamic> logicList;
  late int difficulty;
  late String userCharachter;
  late int gameBoardWidth;
  late int gameBoardHeight;
  late List<List<dynamic>> gameBoard;
  bool gameContinue = false;

  Future<void> chaseGame(user) async {
    highScore = user.chaseGameHighScore;

    await chaseGameWelcomeScreen(user);

    do {
      try {
        await chaseGameChoiceScreen(user);

        await chaseGameCreateGameBoard(user);

        await chaseGamePrintGameBoard(user);

        gameContinue = continueGameLoop();
      } catch (e) {
        print('There was an errror: $e');
      }
    } while (gameContinue);
  }

  Future<void> chaseGameWelcomeScreen(user) async {
    clearScreen();
    asciiLogo();

    await typeWriterEffect('Welcome to Chase Game, ${user.name}.');
    stdout.writeln();

    await typeWriterEffect(
        'You need to run away get to the other side before the police catch you...');
    await typeWriterEffect('Get the power ups (!) to help you escape.');
    stdout.writeln();

    await typeWriterEffect(
        'Use your arrow keys to move when you get to the next screen.');
    stdout.writeln();

    await typeWriterEffect('Your fastest escape was in $highScore moves.');
    stdout.writeln();

    await typeWriterEffect('Good luck!');
    stdout.writeln();

    awaitContinue();
  }

  Future<void> chaseGameChoiceScreen(user) async {
    clearScreen();
    asciiLogo();

    await typeWriterEffect('There are four difficulties:');
    stdout.writeln();
    await typeWriterEffect('1. Easy');
    await typeWriterEffect('2. Medium');
    await typeWriterEffect('3. Hard');
    await typeWriterEffect('4. Impossible');

    stdout.writeln();
    stdout.write('Difficulty (1/2/3/4): ');
    difficulty = int.parse(stdin.readLineSync()!);
  }

  Future<void> chaseGameCreateGameBoard(user) async {
    gameBoard = [];

    switch (difficulty) {
      case 1:
        // create easy gameBoard
        gameBoardHeight = 10;
        gameBoardWidth = gameBoardHeight * 2;
        

        for (int i = 0; i < gameBoardHeight; i++) {
          gameBoard.add([]);
          for (int j = 0; j < gameBoardWidth; j++) {
            gameBoard[i].add(' ');
          }
        }

        break;
      case 2:
        // create medium gameBoard
        gameBoardHeight = 20;
        gameBoardWidth = gameBoardHeight * 2;

        for (int i = 0; i < gameBoardHeight; i++) {
          gameBoard.add([]);
          for (int j = 0; j < gameBoardWidth; j++) {
            gameBoard[i].add(' ');
          }
        }

        break;
      case 3:
        // create hard gameBoard
        gameBoardHeight = 30;
        gameBoardWidth = gameBoardHeight * 2;

        for (int i = 0; i < gameBoardHeight; i++) {
          gameBoard.add([]);
          for (int j = 0; j < gameBoardWidth; j++) {
            gameBoard[i].add(' ');
          }
        }

        break;
      case 4:
        // create impossible gameBoard
        gameBoardHeight = 40;
        gameBoardWidth = gameBoardHeight * 2;

        for (int i = 0; i < gameBoardHeight; i++) {
          gameBoard.add([]);
          for (int j = 0; j < gameBoardWidth; j++) {
            gameBoard[i].add(' ');
          }
        }

        break;
      default:
        throw 'Choice $difficulty is not a valid choice.';
    }
  }

  Future<void> chaseGamePrintGameBoard(user) async {
    clearScreen();
    asciiLogo();

    for (int i = 0; i < gameBoardWidth + 2; i++) {
      // Top line
      stdout.write('-');
    }
    stdout.writeln();

    for (int i = 0; i < gameBoardHeight; i++) {
      // Game board
      stdout.write('|');

      for (int j = 0; j < gameBoardWidth; j++) {
        stdout.write(gameBoard[i][j]);
      }

      stdout.write('|');
      stdout.writeln();
    }

    for (int i = 0; i < gameBoardWidth + 2; i++) {
      // Bottom line
      stdout.write('-');
    }
    stdout.writeln();

    awaitContinue();
  }

  Future<void> finalHighScore(user) async {
    int userScore = 0; // int.parse(scoreList[0]);

    if (userScore < highScore) {
      String highScore = '$userScore';
      await user.updateLastOption(highScore);
    }
  }

  bool continueGameLoop() {
    String programLoop;
    stdout.writeln();
    stdout.write("Do you want to play again? (y/n): ");
    programLoop = stdin.readLineSync()!;

    if (programLoop == 'y') {
      return true;
    } else {
      return false;
    }
  }
}
