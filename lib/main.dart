import 'dart:io';
import 'dart:async';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';

void clearScreen() {
  if (Platform.isWindows) {
    print('\x1B[2J\x1B[H');
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

Future<void> typeWriterEffect(String text) async {
  for (int i = 0; i < text.length; i++) {
    stdout.write(text[i]);
    await Future.delayed(Duration(milliseconds: 30));
  }
  stdout.writeln();
}

String continueAppLoop() {
  String programLoop;
  stdout.write("Continue (y/n): ");
  programLoop = stdin.readLineSync()!;

  return programLoop;
}

Future<void> awaitContinue() async {
  stdout.write("Press ENTER to continue");
  stdin.readByteSync();
}

Future<void> appLoop() async {
  clearScreen();
  asciiLogo();
}