import 'package:flemby/core/widgets/flemby_base_widget.dart';
import 'package:flemby/core/router/app_router.dart';
import 'package:flemby/presentation/server_selection/bloc/server_selection_bloc.dart';
import 'package:flemby/presentation/server_selection/widgets/server_form_dialogs.dart';
import 'package:flemby/presentation/server_selection/widgets/server_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ServerSelectionView
    extends FlembyBaseWidget<ServerSelectionBloc, ServerSelectionEffect> {
  const ServerSelectionView({super.key});

  @override
  Widget buildWidget(BuildContext context, ServerSelectionBloc bloc) {
    return Scaffold(
      appBar: AppBar(title: Text(l10n(context).serverSelectionTitle)),
      body: BlocBuilder<ServerSelectionBloc, ServerSelectionState>(
        builder: (context, state) {
          if (state is ServerSelectionLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ServerSelectionFailure) {
            return Center(child: Text(state.message));
          }

          if (state is ServerSelectionSuccess) {
            return Column(
              children: [
                Expanded(
                  child: state.servers.isEmpty
                      ? Center(child: Text(l10n(context).serverListEmpty))
                      : ServerList(
                          serverList: state.servers,
                          selectedServer: state.selectedServer,
                          onChanged: (server) =>
                              bloc.add(ServerSelectionSelected(server)),
                          onTapEdit: (server) {
                            if (server != null) {
                              showDialog(
                                context: context,
                                builder: (_) => EditServerDialog(
                                  server: server,
                                  confirm: (newServer) => bloc.add(
                                    ServerSelectionEdited(newServer),
                                  ),
                                ),
                              );
                            }
                          },
                          onTapRemove: (server) {
                            if (server != null) {
                              bloc.add(ServerSelectionRemoved(server.id));
                            }
                          },
                        ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: .stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AddServerDialog(
                              confirm: (server) =>
                                  bloc.add(ServerSelectionAdded(server)),
                            ),
                          );
                        },
                        child: Text(l10n(context).addServerDialogTitle),
                      ),
                      FilledButton(
                        onPressed: state.selectedServer == null
                            ? null
                            : () => bloc.add(
                                ServerSelectionConnectionValidated(),
                              ),
                        child: Text(l10n(context).next),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void onEffect(BuildContext context, ServerSelectionEffect effect) {
    if (effect is ServerSelectionShowErrorMessage) {
      showSnackBar(context, effect.message);
    }

    if (effect is ServerSelectionConnectionValidatedSuccess) {
      context.push(AppRouter.accountSelection);
    }
  }
}
