import 'dart:io';
import 'dart:math';
import 'package:gamebox_in_dart/asciiArt/ascii_rock_paper_scissors.dart';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';

class RockPaperScissors {
  dynamic score = '0-0';
  late dynamic highScore;
  late List<dynamic> highScoreList;
  late List<dynamic> scoreList;
  late List<dynamic> logicList;
  bool gameContinue = false;
  dynamic userChoice = -1;
  dynamic computerChoice = -1;

  Future<void> rockPaperScissorsGame(user) async {
    clearScreen();
    asciiLogo();

    late bool programLoop;
    highScore = user.rockPaperScissorsHighScore;

    highScoreList = highScore.split('');
    scoreList = score.split('');

    await rockPaperScissorsIntro(user);

    do {
      highScore = user.rockPaperScissorsHighScore;
      highScoreList = highScore.split('');
      scoreList = score.split('');

      await rockPaperScissorsChoice(user);

      logicList = rockPaperScissorsLogic(user);

      await rockPaperScissorsResultScreen(user);

      await rockPaperScissorsWriteResults(user);

      programLoop = continueGameLoop();
    } while (programLoop);
  }

  Future<void> rockPaperScissorsIntro(user) async {
    await typeWriterEffect('Welcome to Rock Paper Scissors, ${user.name}.');
    stdout.writeln();

    await typeWriterEffect('This is a normal game of Rock Paper Scissors.');
    await typeWriterEffect(
        'You are playing against a computer who might have mind reading abilities...');
    stdout.writeln();

    await typeWriterEffect(
        'If you do not know how to play Rock Paper Scissors, just look it up...');
    stdout.writeln();

    await typeWriterEffect(
        'Your current high score is: ${user.name} $highScore Computer');

    stdout.writeln();
    awaitContinue();
  }

  Future<void> rockPaperScissorsChoice(user) async {
    bool errorHappened = false;

    clearScreen();
    asciiLogo();

    print('Score: $score');
    stdout.writeln();

    print('You have three choices: Rock (1), Paper (2) or Scissors (3).');
    descriptorScreen();

    do {
      try {
        stdout.writeln();
        stdout.write('Choice (1/2/3): ');
        userChoice = int.parse(stdin.readLineSync()!);

        switch (userChoice) {
          case 1:
            userChoice = 'Rock';
            break;
          case 2:
            userChoice = 'Paper';
            break;
          case 3:
            userChoice = 'Scissors';
            break;
          default:
            throw 'Choice $userChoice is not a valid choice.';
        }
      } catch (e) {
        print('There was an error: $e');
        errorHappened = true;
        awaitContinue();
      }
    } while (errorHappened);

    stdout.writeln();
    await typeWriterEffect('Rock...');
    await sleep(Duration(milliseconds: 100));
    await typeWriterEffect('Paper...');
    await sleep(Duration(milliseconds: 100));
    await typeWriterEffect('Scissors...');
    await sleep(Duration(milliseconds: 100));
    await typeWriterEffect('Shoot!');
    await sleep(Duration(milliseconds: 200));
  }

  List<dynamic> rockPaperScissorsLogic(user) {
    List<dynamic> logicList = [userChoice, 'null', 'null', -1];
    computerChoice = generateRandomNumber(1, 3);

    switch (computerChoice) {
      case 1:
        computerChoice = 'Rock';
        logicList[1] = computerChoice;
        break;
      case 2:
        computerChoice = 'Paper';
        logicList[1] = computerChoice;
        break;
      case 3:
        computerChoice = 'Scissors';
        logicList[1] = computerChoice;
        break;
      default:
        throw 'Choice $computerChoice was invalid. If you see this message, please contact the developer.';
    }

    if (userChoice == computerChoice) {
      logicList[2] = 'It was a draw!';
      logicList[3] = 0;
    } else if ((userChoice == 'Rock' && computerChoice == 'Scissors') ||
        (userChoice == 'Paper' && computerChoice == 'Rock') ||
        (userChoice == 'Scissors' && computerChoice == 'Paper')) {
      logicList[2] = 'You beat the computer!';
      logicList[3] = 1;
    } else if ((computerChoice == 'Rock' && userChoice == 'Scissors') ||
        (computerChoice == 'Paper' && userChoice == 'Rock') ||
        (computerChoice == 'Scissors' && userChoice == 'Paper')) {
      logicList[2] = 'The computer beat you.';
      logicList[3] = 2;
    } else {
      logicList[2] = 'Error';
    }

    int userScore = int.parse(scoreList[0]);
    int computerScore = int.parse(scoreList[2]);

    if (logicList[3] == 1) {
      userScore += 1;
    } else if (logicList[3] == 2) {
      computerScore += 1;
    }

    score = '$userScore-$computerScore';

    return logicList;
  }

  Future<void> rockPaperScissorsResultScreen(user) async {
    clearScreen();
    asciiLogo();

    await typeWriterEffect('Results:');
    stdout.writeln();

    await typeWriterEffect('${user.name}\'s choice: ${logicList[0]}');
    await typeWriterEffect('Computer\'s choice: ${logicList[1]}');

    stdout.writeln();
    await typeWriterEffect('${logicList[2]}');
  }

  Future<void> rockPaperScissorsWriteResults(user) async {
    /*
    int userScore = int.parse(scoreList[0]);
    int computerScore = int.parse(scoreList[2]);

    if (logicList[3] == 1) {
      userScore++;
    } else if (logicList[3] == 2) {
      computerScore++;
    }

    score = '$userScore-$computerScore';

    */

    stdout.writeln();
    print('Score: $score');
  }

  Future<void> finalHighScore(user) async {
    int userScore = int.parse(scoreList[0]);
    int computerScore = int.parse(scoreList[2]);

    if (userScore > int.parse(highScoreList[0]) && userScore > computerScore) {
      String highScore = '$userScore-$computerScore';

      await user.updateLastOption(highScore);
    }

    if ((userScore + 1 - computerScore) >
        (int.parse(highScoreList[0]) - int.parse(highScoreList[2]))) {
      String highScore = '${userScore + 1}-$computerScore';

      await user.updateLastOption(highScore);
    } else if ((userScore + 1 - computerScore) ==
        (int.parse(highScoreList[0]) - int.parse(highScoreList[2]))) {
      if (userScore > int.parse(highScoreList[0])) {
        String highScore = '$userScore-$computerScore';

        await user.updateLastOption(highScore);
      }
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
