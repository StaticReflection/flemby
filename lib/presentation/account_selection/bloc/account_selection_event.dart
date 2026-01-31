part of 'account_selection_bloc.dart';

sealed class AccountSelectionEvent extends Equatable {
  const AccountSelectionEvent();
  @override
  List<Object?> get props => [];
}

class AccountSelectionStarted extends AccountSelectionEvent {}

class AccountSelectionLoadAccounts extends AccountSelectionEvent {}

class AccountSelectionAddAccount extends AccountSelectionEvent {
  final AuthenticateUserByName user;

  const AccountSelectionAddAccount({required this.user});

  @override
  List<Object?> get props => [user];
}

class AccountSelectionRemoveAccount extends AccountSelectionEvent {
  final EmbyAccount account;

  const AccountSelectionRemoveAccount(this.account);

  @override
  List<Object?> get props => [account];
}

class AccountSelectionSelectAccount extends AccountSelectionEvent {
  final EmbyAccount? account;

  const AccountSelectionSelectAccount(this.account);

  @override
  List<Object?> get props => [account];
}
