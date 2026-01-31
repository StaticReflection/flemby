import 'package:flemby/core/l10n/generated/app_localizations.dart';
import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _BaseDialog extends StatefulWidget {
  const _BaseDialog({required this.confirm, this.account});

  final Function(String username, String password) confirm;
  final EmbyAccount? account;

  @override
  State<_BaseDialog> createState() => __BaseDialogState();
}

class __BaseDialogState extends State<_BaseDialog> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController(text: widget.account?.name);
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).addAccountDialogTitle),
      content: Column(
        spacing: 12,
        mainAxisSize: .min,
        children: [
          Text(AppLocalizations.of(context).addAccountDialogDescription),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).username,
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).password,
            ),
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () {
            widget.confirm(usernameController.text, passwordController.text);
          },
          child: Text(AppLocalizations.of(context).confirm),
        ),
        ElevatedButton(
          onPressed: context.pop,
          child: Text(AppLocalizations.of(context).cancel),
        ),
      ],
    );
  }
}

class AddAccountDialog extends StatelessWidget {
  const AddAccountDialog({required this.confirm, super.key});

  final Function(String username, String password) confirm;

  @override
  Widget build(BuildContext context) {
    return _BaseDialog(confirm: confirm);
  }
}

class EditAccountDialog extends StatelessWidget {
  const EditAccountDialog({required this.confirm, this.account, super.key});

  final Function(String username, String password) confirm;
  final EmbyAccount? account;

  @override
  Widget build(BuildContext context) {
    return _BaseDialog(confirm: confirm, account: account);
  }
}
