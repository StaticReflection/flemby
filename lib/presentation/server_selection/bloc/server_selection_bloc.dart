import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flemby/core/bloc/flemby_base_bloc.dart';
import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flemby/domain/usecases/emby_server/validate_server_connection.dart';
import 'package:flemby/domain/usecases/server/add_server_usecase.dart';
import 'package:flemby/domain/usecases/server/get_selected_server_usecase.dart';
import 'package:flemby/domain/usecases/server/get_server_list_usecase.dart';
import 'package:flemby/domain/usecases/server/remove_server_usecase.dart';
import 'package:flemby/domain/usecases/server/save_selected_server_usecase.dart';
import 'package:flemby/domain/usecases/server/update_server_usecase.dart';
import 'package:flutter/material.dart';

part 'server_selection_event.dart';
part 'server_selection_state.dart';
part 'server_selection_effect.dart';

class ServerSelectionBloc
    extends
        FlembyBaseBloc<
          ServerSelectionEvent,
          ServerSelectionState,
          ServerSelectionEffect
        > {
  final GetServerListUseCase _getServerList;
  final GetSelectedServerUseCase _getSelectedServer;
  final SaveSelectedServerUseCase _saveSelectedServer;
  final AddServerUseCase _addServer;
  final RemoveServerUseCase _removeServer;
  final UpdateServerUseCase _updateServer;
  final ValidateServerConnectionUseCase _validateConnection;

  ServerSelectionBloc(
    this._getServerList,
    this._getSelectedServer,
    this._saveSelectedServer,
    this._addServer,
    this._removeServer,
    this._updateServer,
    this._validateConnection,
  ) : super(ServerSelectionInitial()) {
    on<ServerSelectionStarted>(_onStarted);
    on<ServerSelectionLoadServers>(_onLoadServers);
    on<ServerSelectionSelected>(_onServerSelected);
    on<ServerSelectionAdded>(_onServerAdded);
    on<ServerSelectionRemoved>(_onServerRemoved);
    on<ServerSelectionEdited>(_onServerEdited);
    on<ServerSelectionConnectionValidated>(_onConnectionValidated);

    add(ServerSelectionStarted());
  }

  Future<void> _onStarted(
    ServerSelectionStarted event,
    Emitter<ServerSelectionState> emit,
  ) async {
    emit(ServerSelectionLoading());
    add(ServerSelectionLoadServers());
    try {} catch (e) {
      emit(ServerSelectionFailure(message: e.toString()));
    }
  }

  Future<void> _onLoadServers(
    ServerSelectionLoadServers event,
    Emitter<ServerSelectionState> emit,
  ) async {
    try {
      final servers = await _getServerList();
      final savedServer = await _getSelectedServer.call();

      EmbyServer? selectedServer;

      if (savedServer != null && servers.isNotEmpty) {
        try {
          selectedServer = servers.firstWhere((s) => s.id == savedServer.id);
        } catch (_) {
          selectedServer = null;
        }
      }

      emit(
        ServerSelectionSuccess(
          servers: servers,
          selectedServer: selectedServer,
        ),
      );
    } catch (e) {
      emit(ServerSelectionFailure(message: e.toString()));
    }
  }

  Future<void> _onServerSelected(
    ServerSelectionSelected event,
    Emitter<ServerSelectionState> emit,
  ) async {
    final currentState = state;
    if (currentState is ServerSelectionSuccess) {
      try {
        await _saveSelectedServer.call(event.server);
        emit(currentState.copyWith(selectedServer: event.server));
      } catch (e) {
        emit(ServerSelectionFailure(message: e.toString()));
      }
    }
  }

  Future<void> _onServerAdded(
    ServerSelectionAdded event,
    Emitter<ServerSelectionState> emit,
  ) async {
    try {
      await _addServer.call(event.server);
      add(ServerSelectionLoadServers());
    } catch (e) {
      emit(ServerSelectionFailure(message: e.toString()));
    }
  }

  Future<void> _onServerRemoved(
    ServerSelectionRemoved event,
    Emitter<ServerSelectionState> emit,
  ) async {
    try {
      await _removeServer.call(event.id);
      add(ServerSelectionLoadServers());
    } catch (e) {
      emit(ServerSelectionFailure(message: e.toString()));
    }
  }

  Future<void> _onServerEdited(
    ServerSelectionEdited event,
    Emitter<ServerSelectionState> emit,
  ) async {
    try {
      await _updateServer.call(event.server);
      add(ServerSelectionLoadServers());
    } catch (e) {
      emit(ServerSelectionFailure(message: e.toString()));
    }
  }

  Future<void> _onConnectionValidated(
    ServerSelectionConnectionValidated event,
    Emitter<ServerSelectionState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ServerSelectionSuccess) return;

    final servers = currentState.servers;
    final selected = currentState.selectedServer;

    emit(ServerSelectionLoading());
    try {
      await _validateConnection.call();
      emitEffect(ServerSelectionConnectionValidatedSuccess());
      emit(ServerSelectionSuccess(servers: servers, selectedServer: selected));
    } catch (e) {
      emitEffect(ServerSelectionShowErrorMessage(e.toString()));
      emit(currentState);
    }
  }
}
