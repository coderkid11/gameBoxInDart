import 'dart:io';

void main() {
  List<String> board = List.filled(9, ' ');
  String currentPlayer = 'X';
  bool isGameOver = false;

  void printBoard() {
    print(' ${board[0]} | ${board[1]} | ${board[2]} ');
    print('---+---+---');
    print(' ${board[3]} | ${board[4]} | ${board[5]} ');
    print('---+---+---');
    print(' ${board[6]} | ${board[7]} | ${board[8]} ');
  }

  bool isBoardFull() {
    return !board.contains(' ');
  }

  bool checkWin() {
    List<List<int>> winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6] // Diagonals
    ];

    for (var combination in winningCombinations) {
      if (board[combination[0]] == board[combination[1]] &&
          board[combination[1]] == board[combination[2]] &&
          board[combination[0]] != ' ') {
        return true;
      }
    }

    return false;
  }

  void makeMove(int position) {
    if (board[position] == ' ') {
      board[position] = currentPlayer;
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    } else {
      print('Invalid move. Please try again.');
    }
  }

  print('Welcome to Tic Tac Toe!');
  printBoard();

  while (!isGameOver) {
    print('Player $currentPlayer, make your move (0-8):');
    String? input = stdin.readLineSync();
    int? position = input != null ? int.tryParse(input) : null;

    if (position != null && position >= 0 && position < 9) {
      makeMove(position);
      printBoard();

      if (checkWin()) {
        print('Player $currentPlayer wins!');
        isGameOver = true;
      } else if (isBoardFull()) {
        print('It\'s a tie!');
        isGameOver = true;
      }
    } else {
      print('Invalid input. Please enter a number between 0 and 8.');
    }
  }
}
