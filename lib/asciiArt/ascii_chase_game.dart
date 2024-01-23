import 'package:dart_console/dart_console.dart';
import 'package:gamebox_in_dart/asciiArt/ascii_logo.dart';
import 'package:gamebox_in_dart/main.dart';

Future<void> chaseGameWinnerAsciiArt() async {
  clearScreen();
  asciiLogo();

  // console.hideCursor();

  final centerRow = console.windowHeight ~/ 2;
  var centerColumn =
      (console.windowWidth - 35) ~/ 2; // 31 is the width of the ASCII logo

  console.cursorPosition = Coordinate(centerRow,
      centerColumn); // -3 to move the cursor up to the start of the logo

  print(" Winner Winner Chicken Dinner! ");

  await sleep(Duration(milliseconds: 750));

  console.cursorPosition = Coordinate(centerRow - 1, centerColumn);

  print("-------------------------------");

  console.cursorPosition = Coordinate(centerRow, centerColumn);

  print("|Winner Winner Chicken Dinner!|");

  console.cursorPosition = Coordinate(centerRow + 1, centerColumn);

  print("-------------------------------");

  await sleep(Duration(milliseconds: 750));

  clearScreen();
  asciiLogo();

  centerColumn =
      (console.windowWidth - 100) ~/ 2; // 56 is the width of the ASCII logo

  console.cursorPosition = Coordinate(centerRow - 7, centerColumn);

  print(
      ' __    _  _  ____  ____   ____     ___  ____       __    __  ____  ____   ____     ___  ____ ');

  console.cursorPosition = Coordinate(centerRow - 6, centerColumn);

  print(
      '|  |__|  ||    ||    \\ |    \\   /  _]|    \\     |  |__|  ||    ||    \\ |    \\   /  _]|    \\');

  console.cursorPosition = Coordinate(centerRow - 5, centerColumn);

  print(
      '|  |  |  | |  | |  _  ||  _  | /  [_ |  D  )    |  |  |  | |  | |  _  ||  _  | /  [_ |  D  )');

  console.cursorPosition = Coordinate(centerRow - 4, centerColumn);

  print(
      '|  |  |  | |  | |  |  ||  |  ||    _]|    /     |  |  |  | |  | |  |  ||  |  ||    _]|    /');

  console.cursorPosition = Coordinate(centerRow - 3, centerColumn);

  print(
      '|  `  \'  | |  | |  |  ||  |  ||   [_ |    \\     |  `  \'  | |  | |  |  ||  |  ||   [_ |    \\');

  console.cursorPosition = Coordinate(centerRow - 2, centerColumn);

  print(
      ' \\      /  |  | |  |  ||  |  ||     ||  .  \\     \\      /  |  | |  |  ||  |  ||     ||  .  \\');

  console.cursorPosition = Coordinate(centerRow - 1, centerColumn);

  print(
      '  \\_/\\_/  |____||__|__||__|__||_____||__|\\_|      \\_/\\_/  |____||__|__||__|__||_____||__|\\_|');

  console.cursorPosition = Coordinate(centerRow, centerColumn);

  print('');

  console.cursorPosition = Coordinate(centerRow + 1, centerColumn);

  print(
      '      __  __ __  ____   __  __  _    ___  ____       ___    ____  ____   ____     ___  ____   __ ');

  console.cursorPosition = Coordinate(centerRow + 2, centerColumn);

  print(
      '   /  ]|  |  ||    | /  ]|  |/ ]  /  _]|    \\     |   \\  |    ||    \\ |    \\   /  _]|    \\ |  |');

  console.cursorPosition = Coordinate(centerRow + 3, centerColumn);

  print(
      '  /  / |  |  | |  | /  / |  \' /  /  [_ |  _  |    |    \\  |  | |  _  ||  _  | /  [_ |  D  )|  |');

  console.cursorPosition = Coordinate(centerRow + 4, centerColumn);

  print(
      ' /  /  |  _  | |  |/  /  |    \\ |    _]|  |  |    |  D  | |  | |  |  ||  |  ||    _]|    / |__|');

  console.cursorPosition = Coordinate(centerRow + 5, centerColumn);

  print(
      '/   \\_ |  |  | |  /   \\_ |     \\|   [_ |  |  |    |     | |  | |  |  ||  |  ||   [_ |    \\  __ ');

  console.cursorPosition = Coordinate(centerRow + 6, centerColumn);

  print(
      '\\     ||  |  | |  \\     ||  .  ||     ||  |  |    |     | |  | |  |  ||  |  ||     ||  .  \\|  |');

  console.cursorPosition = Coordinate(centerRow + 7, centerColumn);

  print(
      ' \\____||__|__||____\\____||__|\\_||_____||__|__|    |_____||____||__|__||__|__||_____||__|\\_||__|');

  console.cursorPosition = Coordinate(centerRow + 8, centerColumn);
  print('');

  console.cursorPosition = Coordinate(centerRow + 9, centerColumn);

  await sleep(Duration(seconds: 2));
  // console.showCursor();
  // resetTerminal();
}

void main() {
  chaseGameWinnerAsciiArt();
}

/*
 __    _  _  ____  ____   ____     ___  ____       __    __  ____  ____   ____     ___  ____  
|  |__|  ||    ||    \ |    \   /  _]|    \     |  |__|  ||    ||    \ |    \   /  _]|    \   
|  |  |  | |  | |  _  ||  _  | /  [_ |  D  )    |  |  |  | |  | |  _  ||  _  | /  [_ |  D  )  
|  |  |  | |  | |  |  ||  |  ||    _]|    /     |  |  |  | |  | |  |  ||  |  ||    _]|    /   
|  `  '  | |  | |  |  ||  |  ||   [_ |    \     |  `  '  | |  | |  |  ||  |  ||   [_ |    \   
 \      /  |  | |  |  ||  |  ||     ||  .  \     \      /  |  | |  |  ||  |  ||     ||  .  \  
  \_/\_/  |____||__|__||__|__||_____||__|\_|      \_/\_/  |____||__|__||__|__||_____||__|\_| 

      __  __ __  ____   __  __  _    ___  ____       ___    ____  ____   ____     ___  ____   __ 
   /  ]|  |  ||    | /  ]|  |/ ]  /  _]|    \     |   \  |    ||    \ |    \   /  _]|    \ |  |
  /  / |  |  | |  | /  / |  ' /  /  [_ |  _  |    |    \  |  | |  _  ||  _  | /  [_ |  D  )|  |
 /  /  |  _  | |  |/  /  |    \ |    _]|  |  |    |  D  | |  | |  |  ||  |  ||    _]|    / |__|
/   \_ |  |  | |  /   \_ |     \|   [_ |  |  |    |     | |  | |  |  ||  |  ||   [_ |    \  __ 
\     ||  |  | |  \     ||  .  ||     ||  |  |    |     | |  | |  |  ||  |  ||     ||  .  \|  |
 \____||__|__||____\____||__|\_||_____||__|__|    |_____||____||__|__||__|__||_____||__|\_||__|
                                                                                               

*/