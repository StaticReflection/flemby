import 'package:flemby/domain/entities/base_item_dto.dart';
import 'package:flemby/domain/entities/player_state_info.dart';
import 'package:flemby/domain/entities/session_user_info.dart';
import 'package:flemby/domain/entities/transcoding_info.dart';

class SessionInfo {
  final PlayerStateInfo? playState;
  final List<SessionUserInfo>? additionalUsers;
  final String? remoteEndPoint;
  final String? protocol;
  final List<String>? playableMediaTypes;
  final String? playlistItemId;
  final int? playlistIndex;
  final int? playlistLength;
  final String? id;
  final String? serverId;
  final String? userId;
  final String? partyId;
  final String? userName;
  final String? userPrimaryImageTag;
  final String? client;
  final DateTime? lastActivityDate;
  final String? deviceName;
  final String? deviceType;
  final BaseItemDto? nowPlayingItem;
  final int? internalDeviceId;
  final String? deviceId;
  final String? applicationVersion;
  final String? appIconUrl;
  final List<String>? supportedCommands;
  final TranscodingInfo? transcodingInfo;
  final bool? supportsRemoteControl;

  const SessionInfo({
    this.playState,
    this.additionalUsers,
    this.remoteEndPoint,
    this.protocol,
    this.playableMediaTypes,
    this.playlistItemId,
    this.playlistIndex,
    this.playlistLength,
    this.id,
    this.serverId,
    this.userId,
    this.partyId,
    this.userName,
    this.userPrimaryImageTag,
    this.client,
    this.lastActivityDate,
    this.deviceName,
    this.deviceType,
    this.nowPlayingItem,
    this.internalDeviceId,
    this.deviceId,
    this.applicationVersion,
    this.appIconUrl,
    this.supportedCommands,
    this.transcodingInfo,
    this.supportsRemoteControl,
  });
}
