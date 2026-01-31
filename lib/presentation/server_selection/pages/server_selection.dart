import 'package:flemby/core/di/injection_container.dart';
import 'package:flemby/presentation/server_selection/bloc/server_selection_bloc.dart';
import 'package:flemby/presentation/server_selection/pages/server_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerSelectionPage extends StatelessWidget {
  const ServerSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ServerSelectionBloc>(),
      child: ServerSelectionView(),
    );
  }
}
