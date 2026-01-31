// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionInfoModel _$SessionInfoModelFromJson(Map<String, dynamic> json) =>
    SessionInfoModel(
      playState: json['PlayState'] == null
          ? null
          : PlayerStateInfoModel.fromJson(
              json['PlayState'] as Map<String, dynamic>,
            ),
      additionalUsers: (json['AdditionalUsers'] as List<dynamic>?)
          ?.map((e) => SessionUserInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      remoteEndPoint: json['RemoteEndPoint'] as String?,
      protocol: json['Protocol'] as String?,
      playableMediaTypes: (json['PlayableMediaTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      playlistItemId: json['PlaylistItemId'] as String?,
      playlistIndex: (json['PlaylistIndex'] as num?)?.toInt(),
      playlistLength: (json['PlaylistLength'] as num?)?.toInt(),
      id: json['Id'] as String?,
      serverId: json['ServerId'] as String?,
      userId: json['UserId'] as String?,
      partyId: json['PartyId'] as String?,
      userName: json['UserName'] as String?,
      userPrimaryImageTag: json['UserPrimaryImageTag'] as String?,
      client: json['Client'] as String?,
      lastActivityDate: json['LastActivityDate'] == null
          ? null
          : DateTime.parse(json['LastActivityDate'] as String),
      deviceName: json['DeviceName'] as String?,
      deviceType: json['DeviceType'] as String?,
      nowPlayingItem: json['NowPlayingItem'] == null
          ? null
          : BaseItemDtoModel.fromJson(
              json['NowPlayingItem'] as Map<String, dynamic>,
            ),
      internalDeviceId: (json['InternalDeviceId'] as num?)?.toInt(),
      deviceId: json['DeviceId'] as String?,
      applicationVersion: json['ApplicationVersion'] as String?,
      appIconUrl: json['AppIconUrl'] as String?,
      supportedCommands: (json['SupportedCommands'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      transcodingInfo: json['TranscodingInfo'] == null
          ? null
          : TranscodingInfoModel.fromJson(
              json['TranscodingInfo'] as Map<String, dynamic>,
            ),
      supportsRemoteControl: json['SupportsRemoteControl'] as bool?,
    );

Map<String, dynamic> _$SessionInfoModelToJson(SessionInfoModel instance) =>
    <String, dynamic>{
      'PlayState': instance.playState,
      'AdditionalUsers': instance.additionalUsers,
      'RemoteEndPoint': instance.remoteEndPoint,
      'Protocol': instance.protocol,
      'PlayableMediaTypes': instance.playableMediaTypes,
      'PlaylistItemId': instance.playlistItemId,
      'PlaylistIndex': instance.playlistIndex,
      'PlaylistLength': instance.playlistLength,
      'Id': instance.id,
      'ServerId': instance.serverId,
      'UserId': instance.userId,
      'PartyId': instance.partyId,
      'UserName': instance.userName,
      'UserPrimaryImageTag': instance.userPrimaryImageTag,
      'Client': instance.client,
      'LastActivityDate': instance.lastActivityDate?.toIso8601String(),
      'DeviceName': instance.deviceName,
      'DeviceType': instance.deviceType,
      'NowPlayingItem': instance.nowPlayingItem,
      'InternalDeviceId': instance.internalDeviceId,
      'DeviceId': instance.deviceId,
      'ApplicationVersion': instance.applicationVersion,
      'AppIconUrl': instance.appIconUrl,
      'SupportedCommands': instance.supportedCommands,
      'TranscodingInfo': instance.transcodingInfo,
      'SupportsRemoteControl': instance.supportsRemoteControl,
    };
