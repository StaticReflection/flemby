import 'package:flemby/core/di/injection_container.dart';
import 'package:flemby/presentation/account_selection/bloc/account_selection_bloc.dart';
import 'package:flemby/presentation/account_selection/pages/account_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSelectionPage extends StatelessWidget {
  const AccountSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccountSelectionBloc>(),
      child: AccountSelectionView(),
    );
  }
}
