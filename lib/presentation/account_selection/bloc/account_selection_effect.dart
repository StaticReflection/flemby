part of 'account_selection_bloc.dart';

sealed class AccountSelectionEffect {
  const AccountSelectionEffect();
}

class AccountSelectionShowErrorMessage extends AccountSelectionEffect {
  final String message;
  const AccountSelectionShowErrorMessage(this.message);
}

class AccountSelectionAddAccountSuccess extends AccountSelectionEffect {}
