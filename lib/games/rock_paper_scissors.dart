import 'dart:io';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';

void rockPaperScissorsGame(user) async {
  clearScreen();
  asciiLogo();

  dynamic highScore = user.rockPaperScissorsHighScore;

  await typeWriterEffect('Welcome to Rock Paper Scissors, ${user.name}.');
  stdout.writeln();

  await typeWriterEffect('This is a normal game of Rock Paper Scissors.');
  await typeWriterEffect(
      'You are playing against a computer who might have mind reading abilities...');
  stdout.writeln();

  await typeWriterEffect('Your current high score is: $highScore');

  awaitContinue();
}
