part of 'server_selection_bloc.dart';

@immutable
sealed class ServerSelectionState extends Equatable {
  const ServerSelectionState();
  @override
  List<Object?> get props => [];
}

final class ServerSelectionInitial extends ServerSelectionState {}

final class ServerSelectionLoading extends ServerSelectionState {}

final class ServerSelectionSuccess extends ServerSelectionState {
  final List<EmbyServer> servers;
  final EmbyServer? selectedServer;

  const ServerSelectionSuccess({required this.servers, this.selectedServer});

  ServerSelectionSuccess copyWith({
    List<EmbyServer>? servers,
    EmbyServer? selectedServer,
    bool? isValidated,
  }) {
    return ServerSelectionSuccess(
      servers: servers ?? this.servers,
      selectedServer: selectedServer ?? this.selectedServer,
    );
  }

  @override
  List<Object?> get props => [servers, selectedServer];
}

final class ServerSelectionFailure extends ServerSelectionState {
  final String message;
  const ServerSelectionFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
