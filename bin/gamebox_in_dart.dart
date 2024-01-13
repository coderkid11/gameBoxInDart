import 'package:gamebox_in_dart/main.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/users/user_system.dart';

Future<void> main() async {
  clearScreen();

  try {
    String programLoop;
    clearScreen();

    asciiLogo();
    await typeWriterEffect("Welcome to GameBox!");
    print("");
    await typeWriterEffect("This is a developing service with games being coded every week!");
    await awaitContinue();

    await appLoop();
  } catch(e) {
    print("There was an error: $e");
  } finally {
    print("");
    await typeWriterEffect("Thank you for using GameBox.");
    await typeWriterEffect("Come back soon!");
  }
}