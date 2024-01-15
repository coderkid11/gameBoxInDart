import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/globals.dart' as globals;

void main() async {
  clearScreen();
  
  try {
    clearScreen();

    asciiLogo();
    await typeWriterEffect("Welcome to GameBox!");
    print("");
    await typeWriterEffect("This is a developing service with games being coded every week!");
    awaitContinue();

    appLoop();
  } catch(e) {
    print("There was an error: $e");
    awaitContinue();
  }
}