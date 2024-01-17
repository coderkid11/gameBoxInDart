import 'dart:io';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';

class RockPaperScissors {
  late dynamic highScore;
  late List<dynamic> highScoreList;

  Future<void> rockPaperScissorsGame(user) async {
    clearScreen();
    asciiLogo();

    dynamic highScore = user.rockPaperScissorsHighScore;

    List<dynamic> highScoreList = highScore.split('');

    rockPaperScissorsIntro(user);
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
}
