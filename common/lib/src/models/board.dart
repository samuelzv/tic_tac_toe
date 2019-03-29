import 'cell.dart';
import 'cell_value.dart';

class Board {
  List<List<Cell>> _cells;

  Board();

  void setInitialCells(size) {
    setCells(_getInitialCells(size));
  }

  List<List<Cell>> _getInitialCells(int size) {
    return List<List<Cell>>.generate(size, (int row) => 
      List<Cell>.generate(size, (int column) => Cell(CellValue.empty)));
  }

  void setCellValue(int row, int column, CellValue value) {
    _cells[row][column].setValue(value);
  }

  void setCells(List<List<Cell>> cells) => _cells = cells;

  List<List<Cell>> getCells() => _cells;

}