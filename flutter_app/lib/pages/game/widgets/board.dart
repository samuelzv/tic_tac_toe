import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart';

class Board  extends StatelessWidget {

  Widget _board(List<List<Cell>> cells) {
    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        padding: EdgeInsets.all(40.0),
        mainAxisSpacing: 80.0,
        crossAxisSpacing: 80.0,
        children: _getFlattenCells(cells)
          .map((Cell cell) {
            return GridTile(
              child: FloatingActionButton(
                elevation: 0.0,
                child: new Icon(Icons.check),
                // backgroundColor: new Color(0xFFE57373),
                onPressed: (){}
              ),
            );
          }
        ).toList()
    );
  }

  List<Cell> _getFlattenCells(List<List<Cell>> cells) {
    List<Cell> flatten = [];

    for (int row = 0;  row < cells.length; row++) {
      for (int col = 0; col < cells[row].length; col++) {
        flatten.add(cells[row][col]);
      }
    }

    return flatten;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<GameBloc>(context),
      builder: (BuildContext context, DataState gameState) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Text('This is a Header2'),
              Expanded(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .7 ,
                    child: _board(gameState.cells) 
                  )
                )
              ),  
              Text('These are the play buttons'),
              Text('This is the score ${MediaQuery.of(context).size.height}'),
            ]
          )
        );
      }
    );
  }
}