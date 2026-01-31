import 'package:flemby/domain/entities/user_configuration.dart';
import 'package:flemby/domain/entities/user_item_share_level.dart';
import 'package:flemby/domain/entities/user_link_type.dart';
import 'package:flemby/domain/entities/user_policy.dart';

class UserDto {
  final String? name;
  final String? serverId;
  final String? serverName;
  final String? prefix;
  final String? connectUserName;
  final DateTime? dateCreated;
  final UserLinkType? connectLinkType;
  final String? id;
  final String? primaryImageTag;
  final bool? hasPassword;
  final bool? hasConfiguredPassword;
  final bool? enableAutoLogin;
  final DateTime? lastLoginDate;
  final DateTime? lastActivityDate;
  final UserConfiguration? configuration;
  final UserPolicy? policy;
  final double? primaryImageAspectRatio;
  final UserItemShareLevel? userItemShareLevel;

  const UserDto({
    this.name,
    this.serverId,
    this.serverName,
    this.prefix,
    this.connectUserName,
    this.dateCreated,
    this.connectLinkType,
    this.id,
    this.primaryImageTag,
    this.hasPassword,
    this.hasConfiguredPassword,
    this.enableAutoLogin,
    this.lastLoginDate,
    this.lastActivityDate,
    this.configuration,
    this.policy,
    this.primaryImageAspectRatio,
    this.userItemShareLevel,
  });
}
