import 'dart:async';

import 'package:bloc/bloc.dart';

import './../models/models.dart';
import '../bloc_event.dart';
import './game_bloc_event.dart';

class GameBloc extends Bloc<BlocEvent, GameState> {
  @override
  GameState get initialState => Game().state;

  @override
  Stream<GameState> mapEventToState(BlocEvent event) async* {
    if (event is GameStartBlocEvent) {
        Game game = Game();
        game.start(event.boardSize);

        yield game.state;
    }

    if (event is HumanMovementBlocEvent) {
      Game game = Game(); 
      game.setState(currentState);
      game.makeHumanMovement(event.row, event.column);

      yield game.state;
    }
  }
}

