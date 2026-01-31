import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

abstract class FlembyBaseBloc<E, S, Ef> extends Bloc<E, S> {
  FlembyBaseBloc(super.initialState);

  final StreamController<Ef> _effectController =
      StreamController<Ef>.broadcast();

  Stream<Ef> get effectStream => _effectController.stream;

  void emitEffect(Ef effect) {
    if (!_effectController.isClosed) {
      _effectController.add(effect);
    }
  }

  @override
  Future<void> close() {
    _effectController.close();
    return super.close();
  }
}
