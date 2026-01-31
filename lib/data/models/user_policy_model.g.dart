// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_policy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPolicyModel _$UserPolicyModelFromJson(
  Map<String, dynamic> json,
) => UserPolicyModel(
  isAdministrator: json['IsAdministrator'] as bool?,
  isHidden: json['IsHidden'] as bool?,
  isHiddenRemotely: json['IsHiddenRemotely'] as bool?,
  isHiddenFromUnusedDevices: json['IsHiddenFromUnusedDevices'] as bool?,
  isDisabled: json['IsDisabled'] as bool?,
  lockedOutDate: (json['LockedOutDate'] as num?)?.toInt(),
  maxParentalRating: (json['MaxParentalRating'] as num?)?.toInt(),
  allowTagOrRating: json['AllowTagOrRating'] as bool?,
  blockedTags: (json['BlockedTags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  isTagBlockingModeInclusive: json['IsTagBlockingModeInclusive'] as bool?,
  includeTags: (json['IncludeTags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  enableUserPreferenceAccess: json['EnableUserPreferenceAccess'] as bool?,
  accessSchedules: (json['AccessSchedules'] as List<dynamic>?)
      ?.map((e) => AccessScheduleModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  blockUnratedItems: (json['BlockUnratedItems'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$UnratedItemModelEnumMap, e))
      .toList(),
  enableRemoteControlOfOtherUsers:
      json['EnableRemoteControlOfOtherUsers'] as bool?,
  enableSharedDeviceControl: json['EnableSharedDeviceControl'] as bool?,
  enableRemoteAccess: json['EnableRemoteAccess'] as bool?,
  enableLiveTvManagement: json['EnableLiveTvManagement'] as bool?,
  enableLiveTvAccess: json['EnableLiveTvAccess'] as bool?,
  enableMediaPlayback: json['EnableMediaPlayback'] as bool?,
  enableAudioPlaybackTranscoding:
      json['EnableAudioPlaybackTranscoding'] as bool?,
  enableVideoPlaybackTranscoding:
      json['EnableVideoPlaybackTranscoding'] as bool?,
  autoRemoteQuality: (json['AutoRemoteQuality'] as num?)?.toInt(),
  enablePlaybackRemuxing: json['EnablePlaybackRemuxing'] as bool?,
  enableContentDeletion: json['EnableContentDeletion'] as bool?,
  restrictedFeatures: (json['RestrictedFeatures'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  enableContentDeletionFromFolders:
      (json['EnableContentDeletionFromFolders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  enableContentDownloading: json['EnableContentDownloading'] as bool?,
  enableSubtitleDownloading: json['EnableSubtitleDownloading'] as bool?,
  enableSubtitleManagement: json['EnableSubtitleManagement'] as bool?,
  enableSyncTranscoding: json['EnableSyncTranscoding'] as bool?,
  enableMediaConversion: json['EnableMediaConversion'] as bool?,
  enabledChannels: (json['EnabledChannels'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  enableAllChannels: json['EnableAllChannels'] as bool?,
  enabledFolders: (json['EnabledFolders'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  enableAllFolders: json['EnableAllFolders'] as bool?,
  invalidLoginAttemptCount: (json['InvalidLoginAttemptCount'] as num?)?.toInt(),
  enablePublicSharing: json['EnablePublicSharing'] as bool?,
  remoteClientBitrateLimit: (json['RemoteClientBitrateLimit'] as num?)?.toInt(),
  authenticationProviderId: json['AuthenticationProviderId'] as String?,
  excludedSubFolders: (json['ExcludedSubFolders'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  simultaneousStreamLimit: (json['SimultaneousStreamLimit'] as num?)?.toInt(),
  enabledDevices: (json['EnabledDevices'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  enableAllDevices: json['EnableAllDevices'] as bool?,
  allowCameraUpload: json['AllowCameraUpload'] as bool?,
  allowSharingPersonalItems: json['AllowSharingPersonalItems'] as bool?,
);

Map<String, dynamic> _$UserPolicyModelToJson(
  UserPolicyModel instance,
) => <String, dynamic>{
  'IsAdministrator': instance.isAdministrator,
  'IsHidden': instance.isHidden,
  'IsHiddenRemotely': instance.isHiddenRemotely,
  'IsHiddenFromUnusedDevices': instance.isHiddenFromUnusedDevices,
  'IsDisabled': instance.isDisabled,
  'LockedOutDate': instance.lockedOutDate,
  'MaxParentalRating': instance.maxParentalRating,
  'AllowTagOrRating': instance.allowTagOrRating,
  'BlockedTags': instance.blockedTags,
  'IsTagBlockingModeInclusive': instance.isTagBlockingModeInclusive,
  'IncludeTags': instance.includeTags,
  'EnableUserPreferenceAccess': instance.enableUserPreferenceAccess,
  'AccessSchedules': instance.accessSchedules,
  'BlockUnratedItems': instance.blockUnratedItems
      ?.map((e) => _$UnratedItemModelEnumMap[e]!)
      .toList(),
  'EnableRemoteControlOfOtherUsers': instance.enableRemoteControlOfOtherUsers,
  'EnableSharedDeviceControl': instance.enableSharedDeviceControl,
  'EnableRemoteAccess': instance.enableRemoteAccess,
  'EnableLiveTvManagement': instance.enableLiveTvManagement,
  'EnableLiveTvAccess': instance.enableLiveTvAccess,
  'EnableMediaPlayback': instance.enableMediaPlayback,
  'EnableAudioPlaybackTranscoding': instance.enableAudioPlaybackTranscoding,
  'EnableVideoPlaybackTranscoding': instance.enableVideoPlaybackTranscoding,
  'AutoRemoteQuality': instance.autoRemoteQuality,
  'EnablePlaybackRemuxing': instance.enablePlaybackRemuxing,
  'EnableContentDeletion': instance.enableContentDeletion,
  'RestrictedFeatures': instance.restrictedFeatures,
  'EnableContentDeletionFromFolders': instance.enableContentDeletionFromFolders,
  'EnableContentDownloading': instance.enableContentDownloading,
  'EnableSubtitleDownloading': instance.enableSubtitleDownloading,
  'EnableSubtitleManagement': instance.enableSubtitleManagement,
  'EnableSyncTranscoding': instance.enableSyncTranscoding,
  'EnableMediaConversion': instance.enableMediaConversion,
  'EnabledChannels': instance.enabledChannels,
  'EnableAllChannels': instance.enableAllChannels,
  'EnabledFolders': instance.enabledFolders,
  'EnableAllFolders': instance.enableAllFolders,
  'InvalidLoginAttemptCount': instance.invalidLoginAttemptCount,
  'EnablePublicSharing': instance.enablePublicSharing,
  'RemoteClientBitrateLimit': instance.remoteClientBitrateLimit,
  'AuthenticationProviderId': instance.authenticationProviderId,
  'ExcludedSubFolders': instance.excludedSubFolders,
  'SimultaneousStreamLimit': instance.simultaneousStreamLimit,
  'EnabledDevices': instance.enabledDevices,
  'EnableAllDevices': instance.enableAllDevices,
  'AllowCameraUpload': instance.allowCameraUpload,
  'AllowSharingPersonalItems': instance.allowSharingPersonalItems,
};

const _$UnratedItemModelEnumMap = {
  UnratedItemModel.book: 'Book',
  UnratedItemModel.channelContent: 'ChannelContent',
  UnratedItemModel.game: 'Game',
  UnratedItemModel.liveTvChannel: 'LiveTvChannel',
  UnratedItemModel.liveTvProgram: 'LiveTvProgram',
  UnratedItemModel.movie: 'Movie',
  UnratedItemModel.music: 'Music',
  UnratedItemModel.other: 'Other',
  UnratedItemModel.series: 'Series',
  UnratedItemModel.trailer: 'Trailer',
};
