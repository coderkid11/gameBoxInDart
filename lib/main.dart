import 'dart:io';
import 'dart:async';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/users/user_system.dart';
import 'package:gamebox_in_dart/games/games_main.dart';

void clearScreen() {
  if (Platform.isWindows) {
    print('\x1B[2J\x1B[H');
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

Future<void> sleep(Duration duration) {
  return Future.delayed(duration, () => {});
}

Future<void> typeWriterEffect(String text) async {
  for (int i = 0; i < text.length; i++) {
    stdout.write(text[i]);
    await sleep(Duration(milliseconds: 30));
  }
  stdout.writeln();
}

Future<String> typeWriterEffectInput(String text) async {
  for (int i = 0; i < text.length; i++) {
    stdout.write(text[i]);
    await sleep(Duration(milliseconds: 30));
  }
  return stdin.readLineSync()!;
}

String continueAppLoop() {
  clearScreen();
  asciiLogo();
  
  String programLoop;
  stdout.write("Do you want to choose another game? (y/n): ");
  programLoop = stdin.readLineSync()!;

  return programLoop;
}

int getColumnLength(List<List<String>> array, int columnIndex) {
  int length = 0;

  for (int i = 0; i < array.length; i++) {
    if (array[i].length > columnIndex) {
      length = length < array[i][columnIndex].length
          ? array[i][columnIndex].length
          : length;
    }
  }

  return length;
}

void awaitContinue() async {
  stdout.write("Press ENTER to continue");
  stdin.readByteSync();
}

void appLoop() async {
  try {
    UserSystem user = UserSystem();
    await user.initialiseUserDetails();
    await user.initialiseLogin();

    String programLoop;

    if (!user.exitApp) {
      do {
        clearScreen();
        asciiLogo();

        GameSelection gameSelection = GameSelection();
        await gameSelection.gameSelection(user);

        if (!user.exitApp) {
          programLoop = continueAppLoop();
        } else {
          programLoop = 'n';
        }
      } while ('y' == programLoop);
    }
  } catch (e) {
    print('There was an error: $e');
    awaitContinue();
  } finally {
    // "Thank you" message will only be printed when the user decides to exit
    print("");
    await typeWriterEffect("Thank you for using GameBox.");
    await typeWriterEffect("Come back soon!");
  }
}
