// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Flemby';

  @override
  String get next => '下一步';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确认';

  @override
  String get name => '名称';

  @override
  String get host => '地址';

  @override
  String get port => '端口';

  @override
  String get edit => '编辑';

  @override
  String get remove => '移除';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get dialogTitleWarning => '警告';

  @override
  String get dialogTitleAlert => '提示';

  @override
  String get dialogTitleError => '错误';

  @override
  String get protocol => '协议';

  @override
  String get serverSelectionTitle => '选择服务器';

  @override
  String get serverListEmpty => '服务器列表为空，请先添加一个';

  @override
  String get addServerDialogTitle => '添加 Emby 服务器';

  @override
  String get accountSelectionTitle => '选择账号';

  @override
  String get accountListEmpty => '账号列表为空，请先添加一个';

  @override
  String get addAccount => '添加账户';

  @override
  String get addAccountDialogTitle => '添加 Emby 账号';

  @override
  String get addAccountDialogDescription =>
      'Flemby 不会将您的凭据上传到任何远程服务器或存储在本地。您的登录信息仅用于验证您的身份并获取访问令牌。';
}
