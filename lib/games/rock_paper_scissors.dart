import 'dart:io';
import 'package:gamebox_in_dart/asciiArt/ascii_rock_paper_scissors.dart';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';

class RockPaperScissors {
  late dynamic highScore;
  late List<dynamic> highScoreList;
  bool gameContinue = false;

  Future<void> rockPaperScissorsGame(user) async {
    clearScreen();
    asciiLogo();

    late bool programLoop;
    dynamic highScore = user.rockPaperScissorsHighScore;

    List<dynamic> highScoreList = highScore.split('');

    rockPaperScissorsIntro(user);

    do {
      rockPaperScissorsChoice(user);
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
        'Your current high score is: ${user.name}$highScore Computer');

    stdout.writeln;
    awaitContinue();
  }

  Future<void> rockPaperScissorsChoice(user) async {
    clearScreen();
    asciiLogo();

    print('You have three choice: Rock, Paper or Scissors');
    stdout.writeln();
    descriptorScreen();
    
    awaitContinue();
    stdout.writeln();
  }

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
