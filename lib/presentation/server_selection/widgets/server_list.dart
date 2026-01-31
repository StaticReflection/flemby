import 'package:flemby/core/l10n/generated/app_localizations.dart';
import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flutter/material.dart';

class ServerList extends StatelessWidget {
  const ServerList({
    required this.serverList,
    required this.selectedServer,
    required this.onChanged,
    required this.onTapEdit,
    required this.onTapRemove,
    super.key,
  });

  final List<EmbyServer> serverList;
  final EmbyServer? selectedServer;
  final Function(EmbyServer?) onChanged;
  final Function(EmbyServer?) onTapEdit;
  final Function(EmbyServer?) onTapRemove;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<EmbyServer>(
      groupValue: selectedServer,
      onChanged: onChanged,
      child: ListView.builder(
        itemCount: serverList.length,
        itemBuilder: (context, index) {
          final server = serverList[index];

          return RadioListTile(
            value: server,
            title: Text(server.name),
            subtitle: Text('${server.protocol}${server.host}:${server.port}'),
            secondary: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () => onTapEdit(server),
                  child: Text(AppLocalizations.of(context).edit),
                ),
                PopupMenuItem(
                  onTap: () => onTapRemove(server),
                  child: Text(AppLocalizations.of(context).remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
