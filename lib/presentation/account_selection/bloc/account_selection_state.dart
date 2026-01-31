part of 'account_selection_bloc.dart';

sealed class AccountSelectionState extends Equatable {
  const AccountSelectionState();
  @override
  List<Object?> get props => [];
}

final class AccountSelectionInitial extends AccountSelectionState {}

final class AccountSelectionLoading extends AccountSelectionState {}

final class AccountSelectionLoadSuccess extends AccountSelectionState {
  final PublicSystemInfo systemInfo;
  final List<EmbyAccount> accountList;
  final EmbyAccount? currentAccount;

  const AccountSelectionLoadSuccess({
    required this.systemInfo,
    required this.accountList,
    this.currentAccount,
  });

  AccountSelectionLoadSuccess copyWith({
    PublicSystemInfo? systemInfo,
    List<EmbyAccount>? accountList,
    final EmbyAccount? currentAccount,
  }) {
    return AccountSelectionLoadSuccess(
      systemInfo: systemInfo ?? this.systemInfo,
      accountList: accountList ?? this.accountList,
      currentAccount: currentAccount,
    );
  }

  @override
  List<Object?> get props => [systemInfo, accountList, currentAccount];
}

final class AccountSelectionLoadFailure extends AccountSelectionState {
  final String message;

  const AccountSelectionLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
