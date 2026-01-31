import 'package:flemby/core/l10n/generated/app_localizations.dart';
import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flemby/domain/entities/http_protocol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class _BaseDialog extends StatefulWidget {
  const _BaseDialog({required this.title, required this.confirm, this.server});

  final String title;
  final Function(EmbyServer server) confirm;
  final EmbyServer? server;

  @override
  State<_BaseDialog> createState() => __BaseDialogState();
}

class __BaseDialogState extends State<_BaseDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _hostController;
  late final TextEditingController _portController;
  late HttpProtocol _selectedProtocol;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.server?.name);
    _hostController = TextEditingController(text: widget.server?.host);
    _portController = TextEditingController(
      text: widget.server?.port.toString(),
    );

    _selectedProtocol = widget.server?.protocol ?? HttpProtocol.http;

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _hostController.dispose();
    _portController.dispose();

    super.dispose();
  }

  void _onConfirm() {
    final name = _nameController.text.trim();
    final host = _hostController.text.trim();
    final port = _portController.text.trim();

    if (host.isNotEmpty && port.isNotEmpty) {
      final newServer = EmbyServer(
        id: widget.server?.id ?? '',
        name: name.isEmpty ? host : name,
        protocol: _selectedProtocol,
        host: host,
        port: int.parse(port),
      );

      widget.confirm(newServer);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).addServerDialogTitle),
      content: SingleChildScrollView(
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).name,
              ),
            ),
            TextField(
              controller: _hostController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).host,
              ),
              keyboardType: TextInputType.url,
            ),
            Row(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu<HttpProtocol>(
                  width: 140,
                  initialSelection: _selectedProtocol,
                  requestFocusOnTap: false,
                  enableFilter: false,
                  label: Text(AppLocalizations.of(context).protocol),
                  dropdownMenuEntries: HttpProtocol.values.map((protocol) {
                    return DropdownMenuEntry<HttpProtocol>(
                      value: protocol,
                      label: protocol.scheme,
                    );
                  }).toList(),
                  onSelected: (HttpProtocol? value) {
                    if (value != null) {
                      setState(() {
                        _selectedProtocol = value;
                      });
                    }
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _portController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).port,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 5,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(AppLocalizations.of(context).cancel),
        ),
        FilledButton(
          onPressed: _onConfirm,
          child: Text(AppLocalizations.of(context).confirm),
        ),
      ],
    );
  }
}

class AddServerDialog extends StatelessWidget {
  const AddServerDialog({required this.confirm, super.key});

  final Function(EmbyServer server) confirm;

  @override
  Widget build(BuildContext context) {
    return _BaseDialog(
      title: AppLocalizations.of(context).addServerDialogTitle,
      confirm: confirm,
    );
  }
}

class EditServerDialog extends StatelessWidget {
  const EditServerDialog({
    required this.server,
    required this.confirm,
    super.key,
  });

  final EmbyServer server;
  final Function(EmbyServer server) confirm;

  @override
  Widget build(BuildContext context) {
    return _BaseDialog(title: "Edit Server", server: server, confirm: confirm);
  }
}
