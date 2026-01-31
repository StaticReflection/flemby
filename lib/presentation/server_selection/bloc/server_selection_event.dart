part of 'server_selection_bloc.dart';

@immutable
sealed class ServerSelectionEvent {}

class ServerSelectionStarted extends ServerSelectionEvent {}

class ServerSelectionLoadServers extends ServerSelectionEvent {}

class ServerSelectionSelected extends ServerSelectionEvent {
  final EmbyServer? server;
  ServerSelectionSelected(this.server);
}

class ServerSelectionAdded extends ServerSelectionEvent {
  final EmbyServer server;
  ServerSelectionAdded(this.server);
}

class ServerSelectionRemoved extends ServerSelectionEvent {
  final String id;
  ServerSelectionRemoved(this.id);
}

class ServerSelectionEdited extends ServerSelectionEvent {
  final EmbyServer server;
  ServerSelectionEdited(this.server);
}

class ServerSelectionConnectionValidated extends ServerSelectionEvent {}
