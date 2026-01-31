import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flemby/core/widgets/flemby_base_widget.dart';
import 'package:flemby/domain/entities/authenticate_user_by_name.dart';
import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flemby/presentation/account_selection/bloc/account_selection_bloc.dart';
import 'package:flemby/presentation/account_selection/widgets/account_form_dialogs.dart';
import 'package:flemby/presentation/account_selection/widgets/account_list.dart';
import 'package:go_router/go_router.dart';

class AccountSelectionView
    extends FlembyBaseWidget<AccountSelectionBloc, AccountSelectionEffect> {
  const AccountSelectionView({super.key});

  @override
  Widget buildWidget(BuildContext context, AccountSelectionBloc bloc) {
    return BlocBuilder<AccountSelectionBloc, AccountSelectionState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(l10n(context).accountSelectionTitle)),
          body: switch (state) {
            AccountSelectionInitial() || AccountSelectionLoading() =>
              const Center(child: CircularProgressIndicator()),
            AccountSelectionLoadFailure(message: var msg) => Center(
              child: Text(msg),
            ),
            AccountSelectionLoadSuccess() => Center(
              child: Column(
                children: [
                  Text(
                    state.systemInfo.serverName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Expanded(
                    child: state.accountList.isEmpty
                        ? Center(child: Text(l10n(context).accountListEmpty))
                        : AccountList(
                            accountList: state.accountList,
                            onTapRemove: (account) {
                              if (account != null) {
                                bloc.add(
                                  AccountSelectionRemoveAccount(account),
                                );
                              }
                            },
                            selectedAccount: state.currentAccount,
                            onChanged: (EmbyAccount? account) => bloc.add(
                              AccountSelectionSelectAccount(account),
                            ),
                          ),
                  ),
                  Padding(
                    padding: .all(12),
                    child: Column(
                      crossAxisAlignment: .stretch,
                      spacing: 12,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AddAccountDialog(
                                confirm: (username, password) {
                                  bloc.add(
                                    AccountSelectionAddAccount(
                                      user: AuthenticateUserByName(
                                        username: username,
                                        pw: password,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(l10n(context).addAccount),
                        ),
                        FilledButton(
                          onPressed: state.currentAccount == null
                              ? null
                              : () {},
                          child: Text(l10n(context).next),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          },
        );
      },
    );
  }

  @override
  void onEffect(BuildContext context, AccountSelectionEffect effect) {
    if (effect is AccountSelectionShowErrorMessage) {
      showSnackBar(context, effect.message);
    }

    if (effect is AccountSelectionAddAccountSuccess) {
      if (context.canPop()) context.pop();
    }
  }
}
