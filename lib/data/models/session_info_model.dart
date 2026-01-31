import 'package:flemby/domain/entities/session_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'player_state_info_model.dart';
import 'session_user_info_model.dart';
import 'base_item_dto_model.dart';
import 'transcoding_info_model.dart';

part 'session_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class SessionInfoModel {
  final PlayerStateInfoModel? playState;
  final List<SessionUserInfoModel>? additionalUsers;
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
  final BaseItemDtoModel? nowPlayingItem;
  final int? internalDeviceId;
  final String? deviceId;
  final String? applicationVersion;
  final String? appIconUrl;
  final List<String>? supportedCommands;
  final TranscodingInfoModel? transcodingInfo;
  final bool? supportsRemoteControl;

  const SessionInfoModel({
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

  factory SessionInfoModel.fromEntity(SessionInfo entity) {
    return SessionInfoModel(
      playState: entity.playState != null
          ? PlayerStateInfoModel.fromEntity(entity.playState!)
          : null,
      additionalUsers: entity.additionalUsers
          ?.map((e) => SessionUserInfoModel.fromEntity(e))
          .toList(),
      remoteEndPoint: entity.remoteEndPoint,
      protocol: entity.protocol,
      playableMediaTypes: entity.playableMediaTypes,
      playlistItemId: entity.playlistItemId,
      playlistIndex: entity.playlistIndex,
      playlistLength: entity.playlistLength,
      id: entity.id,
      serverId: entity.serverId,
      userId: entity.userId,
      partyId: entity.partyId,
      userName: entity.userName,
      userPrimaryImageTag: entity.userPrimaryImageTag,
      client: entity.client,
      lastActivityDate: entity.lastActivityDate,
      deviceName: entity.deviceName,
      deviceType: entity.deviceType,
      nowPlayingItem: entity.nowPlayingItem != null
          ? BaseItemDtoModel.fromEntity(entity.nowPlayingItem!)
          : null,
      internalDeviceId: entity.internalDeviceId,
      deviceId: entity.deviceId,
      applicationVersion: entity.applicationVersion,
      appIconUrl: entity.appIconUrl,
      supportedCommands: entity.supportedCommands,
      transcodingInfo: entity.transcodingInfo != null
          ? TranscodingInfoModel.fromEntity(entity.transcodingInfo!)
          : null,
      supportsRemoteControl: entity.supportsRemoteControl,
    );
  }

  SessionInfo toEntity() {
    return SessionInfo(
      playState: playState?.toEntity(),
      additionalUsers: additionalUsers?.map((e) => e.toEntity()).toList(),
      remoteEndPoint: remoteEndPoint,
      protocol: protocol,
      playableMediaTypes: playableMediaTypes,
      playlistItemId: playlistItemId,
      playlistIndex: playlistIndex,
      playlistLength: playlistLength,
      id: id,
      serverId: serverId,
      userId: userId,
      partyId: partyId,
      userName: userName,
      userPrimaryImageTag: userPrimaryImageTag,
      client: client,
      lastActivityDate: lastActivityDate,
      deviceName: deviceName,
      deviceType: deviceType,
      nowPlayingItem: nowPlayingItem?.toEntity(),
      internalDeviceId: internalDeviceId,
      deviceId: deviceId,
      applicationVersion: applicationVersion,
      appIconUrl: appIconUrl,
      supportedCommands: supportedCommands,
      transcodingInfo: transcodingInfo?.toEntity(),
      supportsRemoteControl: supportsRemoteControl,
    );
  }

  factory SessionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SessionInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionInfoModelToJson(this);
}
