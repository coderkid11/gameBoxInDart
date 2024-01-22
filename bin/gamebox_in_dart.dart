import 'dart:io';
import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';

void main() async {
  if (stdout.terminalLines > 50 && stdout.terminalColumns > 150) {
    try {
    clearScreen();

    asciiLogo();
    await typeWriterEffect("Welcome to GameBox!");
    print("");
    await typeWriterEffect("This is a developing service with games being coded every week!");
    awaitContinue();

    appLoop();
    } catch (e) {
      print("There was an error: $e");
      awaitContinue();
    }
  } else {
    print("Please resize your terminal to be smaller.");
    print("Current terminal size: ${stdout.terminalLines}x${stdout.terminalColumns}");
  }
}