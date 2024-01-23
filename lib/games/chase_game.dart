import 'dart:io';
import 'dart:math';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/main.dart';
import 'package:dart_console/dart_console.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_chase_game.dart';
import 'package:ffi/ffi.dart';

// IMPORTANT: ALL COORDINATES ARE IN YX FORMAT BECUAUSE THAT IS HOW THE GAME BOARD IS SET UP

class ChaseGame {
  dynamic score = '0';
  late int highScore;
  late List<dynamic> scoreList;
  late List<dynamic> logicList;
  late int difficulty;
  late String userCharachter;
  late String computerCharacter;
  late List<int> userCoordinates;
  late List<int> computerCoordinates;
  late int gameBoardWidth;
  late int gameBoardHeight;
  late List<List<dynamic>> gameBoard;
  late int moves;
  bool gameContinue = false;
  bool gameFinished = false;
  late String keyPressed;

  Future<void> chaseGame(user) async {
    highScore = user.chaseGameHighScore;

    await welcomeScreen(user);

    do {
      try {
        gameFinished = false;
        moves = 0;

        await choiceScreen(user);

        await reset(user);

        do {
          await printGameBoard(user);
          await userInput(user);

          await gameLogic(user);
        } while (!gameFinished);

        await gameWin(user);

        gameContinue = continueGameLoop();
      } catch (e) {
        print('There was an errror: $e');
      }
    } while (gameContinue);
  }

  Future<void> reset(user) async {
    await createGameBoard(user);
    await characterReset(user);
  }

  Future<void> welcomeScreen(user) async {
    clearScreen();
    asciiLogo();

    await typeWriterEffect('Welcome to Chase Game, ${user.name}.');
    stdout.writeln();

    await typeWriterEffect(
        'You need to run away get to the other side before the police catch you...');
    await typeWriterEffect('Get the power ups (!) to help you escape.');
    stdout.writeln();

    await typeWriterEffect('Use your arrow keys to move.');
    stdout.writeln();

    await typeWriterEffect('Your fastest escape was in $highScore moves.');
    stdout.writeln();

    await typeWriterEffect('Good luck!');
    stdout.writeln();

    awaitContinue();
  }

  Future<void> choiceScreen(user) async {
    clearScreen();
    asciiLogo();

    await typeWriterEffect('There are four difficulties:');
    stdout.writeln();
    await typeWriterEffect('1. Easy');
    await typeWriterEffect('2. Medium');
    await typeWriterEffect('3. Hard');

    stdout.writeln();
    stdout.write('Difficulty (1/2/3): ');
    difficulty = int.parse(stdin.readLineSync()!);
  }

  Future<void> createGameBoard(user) async {
    gameBoard = [];

    switch (difficulty) {
      case 1:
        // create easy gameBoard
        gameBoardHeight = 20;
        gameBoardWidth = gameBoardHeight * 3;

        for (int i = 0; i < gameBoardHeight; i++) {
          gameBoard.add([]);
          for (int j = 0; j < gameBoardWidth; j++) {
            gameBoard[i].add(' ');
          }
        }

        break;
      case 2:
        // create medium gameBoard
        gameBoardHeight = 30;
        gameBoardWidth = gameBoardHeight * 3;

        for (int i = 0; i < gameBoardHeight; i++) {
          gameBoard.add([]);
          for (int j = 0; j < gameBoardWidth; j++) {
            gameBoard[i].add(' ');
          }
        }

        break;
      case 3:
        // create hard gameBoard
        gameBoardHeight = 50;
        gameBoardWidth = gameBoardHeight * 3;

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

    for (int i = 0; i < gameBoardHeight; i++) {
      gameBoard[i][gameBoardWidth - 1] = 'G';
    }
  }

  Future<void> characterReset(user) async {
    userCharachter = '@';
    userCoordinates = [generateRandomNumber(0, gameBoardHeight - 1), 0];
    gameBoard[userCoordinates[0].toInt()][userCoordinates[1].toInt()] =
        userCharachter;

    computerCharacter = 'P';
    computerCoordinates = [
      generateRandomNumber(0, gameBoardHeight - 1),
      generateRandomNumber(gameBoardWidth ~/ 2, gameBoardWidth - 1)
    ];
    gameBoard[computerCoordinates[0].toInt()][computerCoordinates[1].toInt()] =
        computerCharacter;
  }

  Future<void> printGameBoard(user) async {
    console.hideCursor();

    var buffer = StringBuffer();

    for (int i = 0; i < gameBoardWidth + 2; i++) {
      // Top line
      buffer.write('-');
    }
    buffer.writeln();

    for (int i = 0; i < gameBoardHeight; i++) {
      // Game board
      buffer.write('|');

      for (int j = 0; j < gameBoardWidth; j++) {
        buffer.write(gameBoard[i][j]);
      }

      buffer.write('|');
      buffer.writeln();
    }

    for (int i = 0; i < gameBoardWidth + 2; i++) {
      // Bottom line
      buffer.write('-');
    }
    buffer.writeln();

    clearScreen();
    asciiLogo();
    print(buffer.toString());

    console.showCursor();
  }

  Future<void> userInput(user) async {
    moves += 1;

    stdout.writeln();

    stdout.write('Move (up/down/left/right): ');
    Key key;
    do {
      key = console.readKey();
    } while (key.controlChar == ControlCharacter.none);

    if (key.controlChar == ControlCharacter.arrowUp) {
      keyPressed = 'up';
    } else if (key.controlChar == ControlCharacter.arrowDown) {
      keyPressed = 'down';
    } else if (key.controlChar == ControlCharacter.arrowLeft) {
      keyPressed = 'left';
    } else if (key.controlChar == ControlCharacter.arrowRight) {
      keyPressed = 'right';
    }
  }

  Future<void> gameLogic(user) async {
    switch (keyPressed) {
      case 'up':
        if (userCoordinates[0] > 0) {
          gameBoard[userCoordinates[0]][userCoordinates[1]] = ' ';
          userCoordinates[0]--;
          gameBoard[userCoordinates[0]][userCoordinates[1]] = userCharachter;
        }
        break;
      case 'down':
        if (userCoordinates[0] < gameBoardHeight - 1) {
          gameBoard[userCoordinates[0]][userCoordinates[1]] = ' ';
          userCoordinates[0]++;
          gameBoard[userCoordinates[0]][userCoordinates[1]] = userCharachter;
        }
        break;
      case 'left':
        if (userCoordinates[1] > 0) {
          gameBoard[userCoordinates[0]][userCoordinates[1]] = ' ';
          userCoordinates[1]--;
          gameBoard[userCoordinates[0]][userCoordinates[1]] = userCharachter;
        }
        break;
      case 'right':
        if (userCoordinates[1] < gameBoardWidth - 1) {
          gameBoard[userCoordinates[0]][userCoordinates[1]] = ' ';
          userCoordinates[1]++;
          gameBoard[userCoordinates[0]][userCoordinates[1]] = userCharachter;
        }
        break;
      default:
        throw 'Choice $keyPressed is not a valid choice.';
    }

    if (userCoordinates[1] == gameBoardWidth - 1) {
      gameFinished = true;
      await finalHighScore(user);
    }
  }

  Future<void> gameWin(user) async {
    await printGameBoard(user);
    await sleep(Duration(milliseconds: 500));

    await chaseGameWinnerAsciiArt();

    clearScreen();
    asciiLogo();

    await typeWriterEffect('You escaped in $moves moves.');
    stdout.writeln();

    await typeWriterEffect('Your fastest escape was in $highScore moves.');
    stdout.writeln();

    await typeWriterEffect('Good job!');
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

  int generateRandomNumber(int min, int max) {
    Random random = Random();
    return min + random.nextInt(max - min + 1);
  }
}
