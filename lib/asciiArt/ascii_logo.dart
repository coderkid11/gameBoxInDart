import 'package:dart_console/dart_console.dart';
import 'package:gamebox_in_dart/main.dart';

void asciiLogo() {
  console.hideCursor();

  final centerRow = console.windowHeight ~/ 2;
  final centerColumn = (console.windowWidth - 56) ~/ 2; // 56 is the width of the ASCII logo

  console.cursorPosition = Coordinate(0, centerColumn); // -3 to move the cursor up to the start of the logo
  print("  ________                     __________              ");
  console.cursorPosition = Coordinate(1, centerColumn);
  print(" /  _____/_____    _____   ____\\______   \\ _______  ___");
  console.cursorPosition = Coordinate(2, centerColumn);
  print("/   \\  ___\\__  \\  /     \\_/ __ \\|    |  _//  _ \\  \\/  /");
  console.cursorPosition = Coordinate(3, centerColumn);
  print("\\    \\_\\  \\/ __ \\|  Y Y  \\  ___/|    |   (  <_> >    < ");
  console.cursorPosition = Coordinate(4, centerColumn);
  print(" \\______  (____  /__|_|  /\\___  >______  /\\____/__/\\_ \\");
  console.cursorPosition = Coordinate(5, centerColumn);
  print("        \\/     \\/      \\/     \\/       \\/            \\/");

  console.showCursor();
}