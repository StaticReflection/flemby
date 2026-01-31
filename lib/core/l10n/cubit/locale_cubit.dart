import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit() : super(null);

  void changeLocale(String languageCode) {
    emit(Locale(languageCode));
  }

  void useSystemSettings() {
    emit(null);
  }
}
