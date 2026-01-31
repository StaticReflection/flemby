// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Flemby';

  @override
  String get next => 'Next';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get name => 'Name';

  @override
  String get host => 'Host';

  @override
  String get port => 'Port';

  @override
  String get edit => 'Edit';

  @override
  String get remove => 'Remove';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get dialogTitleWarning => 'Warning';

  @override
  String get dialogTitleAlert => 'Alert';

  @override
  String get dialogTitleError => 'Error';

  @override
  String get protocol => 'Protocol';

  @override
  String get serverSelectionTitle => 'Select Server';

  @override
  String get serverListEmpty => 'No servers found, please add one';

  @override
  String get addServerDialogTitle => 'Add Emby Server';

  @override
  String get accountSelectionTitle => 'Select Account';

  @override
  String get accountListEmpty => 'No accounts fond, please add one';

  @override
  String get addAccount => 'Add account';

  @override
  String get addAccountDialogTitle => 'Add Emby Account';

  @override
  String get addAccountDialogDescription =>
      'Flemby does not upload your credentials to any remote servers or store them locally. Your login info is used solely to authenticate your identity and retrieve an Access Token.';
}
