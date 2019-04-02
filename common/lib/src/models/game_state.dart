import './player.dart';
import './cell.dart';

class GameState {
  String username;
  Player turn;
  List<List<Cell>> cells;
  bool isGameOver;

  GameState(this.username, this.turn, this.cells, this.isGameOver);
}
