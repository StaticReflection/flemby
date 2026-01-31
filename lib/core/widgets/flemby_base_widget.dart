import 'dart:async';
import 'package:flemby/core/bloc/flemby_base_bloc.dart';
import 'package:flemby/core/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class FlembyBaseWidget<
  B extends FlembyBaseBloc<dynamic, dynamic, E>,
  E
>
    extends StatelessWidget {
  const FlembyBaseWidget({super.key});

  Widget buildWidget(BuildContext context, B bloc);

  void onEffect(BuildContext context, E effect);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<B>();

    return _FlembyEffectListener<E>(
      stream: bloc.effectStream,
      onEffect: (effect) => onEffect(context, effect),
      child: buildWidget(context, bloc),
    );
  }

  ThemeData theme(BuildContext context) => Theme.of(context);

  AppLocalizations l10n(BuildContext context) => AppLocalizations.of(context);

  ScaffoldFeatureController showSnackBar(
    BuildContext context,
    String content,
  ) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(showCloseIcon: true, content: Text(content)));

  Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
    String? confirmLabel,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            FilledButton(
              onPressed: () => context.pop(),
              child: Text(confirmLabel ?? l10n(context).confirm),
            ),
          ],
        );
      },
    );
  }
}

class _FlembyEffectListener<E> extends StatefulWidget {
  final Stream<E> stream;
  final void Function(E effect) onEffect;
  final Widget child;

  const _FlembyEffectListener({
    required this.stream,
    required this.onEffect,
    required this.child,
  });

  @override
  State<_FlembyEffectListener<E>> createState() =>
      _FlembyEffectListenerState<E>();
}

class _FlembyEffectListenerState<E> extends State<_FlembyEffectListener<E>> {
  StreamSubscription<E>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.stream.listen((effect) {
      if (mounted) widget.onEffect(effect);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
