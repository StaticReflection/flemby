part of 'server_selection_bloc.dart';

sealed class ServerSelectionEffect {
  const ServerSelectionEffect();
}

class ServerSelectionShowErrorMessage extends ServerSelectionEffect {
  final String message;
  const ServerSelectionShowErrorMessage(this.message);
}

class ServerSelectionConnectionValidatedSuccess extends ServerSelectionEffect {}
