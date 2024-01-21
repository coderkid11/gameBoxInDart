import 'dart:io';

List<List<String>> rockSymbol() {
  List<List<String>> rockSymbolArray = [
    ['   ________     '],
    ['---\'   ____)   '],
    ['      (_____)   '],
    ['      (_____)   '],
    ['      (____)    '],
    ['---.__(___)     '],
  ];

  return rockSymbolArray;
}

List<List<String>> paperSymbol() {
  List<List<String>> paperSymbolArray = [
    ['     _______         '],
    ['---\'    ____)___    '],
    ['           ______)   '],
    ['          _______)   '],
    ['         _______)    '],
    ['---.__________)      '],
  ];

  return paperSymbolArray;
}

List<List<String>> scissorsSymbol() {
  List<List<String>> scissorsSymbolArray = [
    ['    _______          '],
    [' ---\'   ____)___    '],
    ['          ______)    '],
    ['       __________)   '],
    ['      (____)         '],
    ['---.__(___)          '],
  ];

  return scissorsSymbolArray;
}

void descriptorScreen() {
  List<List<String>> rockSymbolArray = rockSymbol();
  List<List<String>> paperSymbolArray = paperSymbol();
  List<List<String>> scissorsSymbolArray = scissorsSymbol();

  for (int i = 0; i <= 5; i++) {
    stdout.write(rockSymbolArray[i][0]);
    stdout.write(paperSymbolArray[i][0]);
    stdout.write(scissorsSymbolArray[i][0]);
    stdout.writeln();
  }
}

/*

TODO:
  - Fix formatting error

*/