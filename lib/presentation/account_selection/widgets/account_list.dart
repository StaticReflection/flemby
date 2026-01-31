import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flutter/material.dart';

class AccountList extends StatelessWidget {
  const AccountList({
    required this.accountList,
    required this.selectedAccount,
    required this.onChanged,
    required this.onTapRemove,
    super.key,
  });

  final List<EmbyAccount> accountList;
  final EmbyAccount? selectedAccount;
  final Function(EmbyAccount?) onChanged;
  final Function(EmbyAccount?) onTapRemove;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<EmbyAccount>(
      groupValue: selectedAccount,
      onChanged: onChanged,
      child: ListView.builder(
        itemCount: accountList.length,
        itemBuilder: (context, index) {
          final account = accountList[index];

          return RadioListTile(
            value: account,
            title: Text(account.name),
            subtitle: Text(account.id),
            secondary: IconButton(
              onPressed: () => onTapRemove(account),
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
