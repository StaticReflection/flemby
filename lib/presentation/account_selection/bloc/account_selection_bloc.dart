import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flemby/core/bloc/flemby_base_bloc.dart';
import 'package:flemby/core/exceptions/emby_exception.dart';
import 'package:flemby/domain/entities/authenticate_user_by_name.dart';
import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flemby/domain/entities/public_system_info.dart';
import 'package:flemby/domain/usecases/account/add_emby_account.dart';
import 'package:flemby/domain/usecases/account/get_emby_account_list.dart';
import 'package:flemby/domain/usecases/account/get_selected_emby_account.dart';
import 'package:flemby/domain/usecases/account/remove_emby_account.dart';
import 'package:flemby/domain/usecases/account/save_selected_emby_account.dart';
import 'package:flemby/domain/usecases/emby_server/authenticate_by_name.dart';
import 'package:flemby/domain/usecases/emby_server/get_public_system_info.dart';

part 'account_selection_event.dart';
part 'account_selection_state.dart';
part 'account_selection_effect.dart';

class AccountSelectionBloc
    extends
        FlembyBaseBloc<
          AccountSelectionEvent,
          AccountSelectionState,
          AccountSelectionEffect
        > {
  final GetPublicSystemInfoUsecase getPublicSystemInfoUsecase;
  final GetEmbyAccountListUseCase getEmbyAccountListUseCase;
  final AddEmbyAccountUseCase addEmbyAccountUseCase;
  final RemoveEmbyAccountUseCase removeEmbyAccountUseCase;
  final GetSelectedEmbyAccountUseCase getSelectedEmbyAccountUseCase;
  final SaveSelectedEmbyAccountUseCase saveSelectedEmbyAccountUseCase;
  final AuthenticateByNameUseCase authenticateByNameUseCase;

  AccountSelectionBloc({
    required this.getPublicSystemInfoUsecase,
    required this.getEmbyAccountListUseCase,
    required this.addEmbyAccountUseCase,
    required this.removeEmbyAccountUseCase,
    required this.getSelectedEmbyAccountUseCase,
    required this.saveSelectedEmbyAccountUseCase,
    required this.authenticateByNameUseCase,
  }) : super(AccountSelectionInitial()) {
    on<AccountSelectionStarted>(_onStarted);
    on<AccountSelectionLoadAccounts>(_onLoadAccounts);
    on<AccountSelectionAddAccount>(_addAccount);
    on<AccountSelectionRemoveAccount>(_removeAccount);
    on<AccountSelectionSelectAccount>(_onSelectAccount);

    add(AccountSelectionStarted());
  }

  Future<void> _onStarted(
    AccountSelectionStarted event,
    Emitter<AccountSelectionState> emit,
  ) async {
    emit(AccountSelectionLoading());
    try {
      final systemInfo = await getPublicSystemInfoUsecase.call();

      emit(
        AccountSelectionLoadSuccess(
          systemInfo: systemInfo,
          accountList: const [],
          currentAccount: null,
        ),
      );

      add(AccountSelectionLoadAccounts());
    } catch (e) {
      emit(AccountSelectionLoadFailure(e.toString()));
    }
  }

  Future<void> _onLoadAccounts(
    AccountSelectionLoadAccounts event,
    Emitter<AccountSelectionState> emit,
  ) async {
    final currentState = state;
    if (currentState is! AccountSelectionLoadSuccess) return;

    try {
      final serverId = currentState.systemInfo.id;

      final results = await Future.wait([
        getEmbyAccountListUseCase.call(serverId),
        getSelectedEmbyAccountUseCase.call(serverId),
      ]);

      final accountList = results[0] as List<EmbyAccount>;
      final savedAccount = results[1] as EmbyAccount?;

      EmbyAccount? currentAccount;
      if (savedAccount != null && accountList.isNotEmpty) {
        try {
          currentAccount = accountList.firstWhere(
            (a) => a.id == savedAccount.id,
          );
        } catch (_) {
          currentAccount = null;
        }
      }

      emit(
        currentState.copyWith(
          accountList: accountList,
          currentAccount: currentAccount,
        ),
      );
    } catch (e) {
      emit(AccountSelectionLoadFailure(e.toString()));
    }
  }

  Future<void> _addAccount(
    AccountSelectionAddAccount event,
    Emitter<AccountSelectionState> emit,
  ) async {
    final currentState = state;
    if (currentState is AccountSelectionLoadSuccess) {
      if (event.user.username.isNotEmpty && event.user.pw.isNotEmpty) {
        try {
          final authResult = await authenticateByNameUseCase.call(event.user);

          final newAccount = EmbyAccount(
            name: authResult.user.name!,
            accessToken: authResult.accessToken,
            id: authResult.user.id!,
          );

          await addEmbyAccountUseCase.call(
            serverId: currentState.systemInfo.id,
            account: newAccount,
          );

          final newList = await getEmbyAccountListUseCase.call(
            currentState.systemInfo.id,
          );

          emit(currentState.copyWith(accountList: newList));

          emitEffect(AccountSelectionAddAccountSuccess());
        } catch (e) {
          final errorMsg = e is EmbyException
              ? '[${e.statusCode}]: ${e.message}'
              : e.toString();

          emitEffect(AccountSelectionShowErrorMessage(errorMsg));

          emit(currentState);
        }
      }
    }
  }

  Future<void> _removeAccount(
    AccountSelectionRemoveAccount event,
    Emitter<AccountSelectionState> emit,
  ) async {
    final currentState = state;
    if (currentState is AccountSelectionLoadSuccess) {
      await removeEmbyAccountUseCase.call(
        serverId: currentState.systemInfo.id,
        account: event.account,
      );

      add(AccountSelectionLoadAccounts());
    }
  }

  Future<void> _onSelectAccount(
    AccountSelectionSelectAccount event,
    Emitter<AccountSelectionState> emit,
  ) async {
    final currentState = state;
    if (currentState is AccountSelectionLoadSuccess) {
      await saveSelectedEmbyAccountUseCase.call(
        serverId: currentState.systemInfo.id,
        account: event.account,
      );

      emit(currentState.copyWith(currentAccount: event.account));
    }
  }
}
