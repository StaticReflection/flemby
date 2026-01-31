import 'package:flemby/domain/entities/user_policy.dart';
import 'package:json_annotation/json_annotation.dart';
import 'access_schedule_model.dart';
import 'unrated_item_model.dart';

part 'user_policy_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserPolicyModel {
  final bool? isAdministrator;
  final bool? isHidden;
  final bool? isHiddenRemotely;
  final bool? isHiddenFromUnusedDevices;
  final bool? isDisabled;
  final int? lockedOutDate;
  final int? maxParentalRating;
  final bool? allowTagOrRating;
  final List<String>? blockedTags;
  final bool? isTagBlockingModeInclusive;
  final List<String>? includeTags;
  final bool? enableUserPreferenceAccess;
  final List<AccessScheduleModel>? accessSchedules;
  final List<UnratedItemModel>? blockUnratedItems;
  final bool? enableRemoteControlOfOtherUsers;
  final bool? enableSharedDeviceControl;
  final bool? enableRemoteAccess;
  final bool? enableLiveTvManagement;
  final bool? enableLiveTvAccess;
  final bool? enableMediaPlayback;
  final bool? enableAudioPlaybackTranscoding;
  final bool? enableVideoPlaybackTranscoding;
  final int? autoRemoteQuality;
  final bool? enablePlaybackRemuxing;
  final bool? enableContentDeletion;
  final List<String>? restrictedFeatures;
  final List<String>? enableContentDeletionFromFolders;
  final bool? enableContentDownloading;
  final bool? enableSubtitleDownloading;
  final bool? enableSubtitleManagement;
  final bool? enableSyncTranscoding;
  final bool? enableMediaConversion;
  final List<String>? enabledChannels;
  final bool? enableAllChannels;
  final List<String>? enabledFolders;
  final bool? enableAllFolders;
  final int? invalidLoginAttemptCount;
  final bool? enablePublicSharing;
  final int? remoteClientBitrateLimit;
  final String? authenticationProviderId;
  final List<String>? excludedSubFolders;
  final int? simultaneousStreamLimit;
  final List<String>? enabledDevices;
  final bool? enableAllDevices;
  final bool? allowCameraUpload;
  final bool? allowSharingPersonalItems;

  const UserPolicyModel({
    this.isAdministrator,
    this.isHidden,
    this.isHiddenRemotely,
    this.isHiddenFromUnusedDevices,
    this.isDisabled,
    this.lockedOutDate,
    this.maxParentalRating,
    this.allowTagOrRating,
    this.blockedTags,
    this.isTagBlockingModeInclusive,
    this.includeTags,
    this.enableUserPreferenceAccess,
    this.accessSchedules,
    this.blockUnratedItems,
    this.enableRemoteControlOfOtherUsers,
    this.enableSharedDeviceControl,
    this.enableRemoteAccess,
    this.enableLiveTvManagement,
    this.enableLiveTvAccess,
    this.enableMediaPlayback,
    this.enableAudioPlaybackTranscoding,
    this.enableVideoPlaybackTranscoding,
    this.autoRemoteQuality,
    this.enablePlaybackRemuxing,
    this.enableContentDeletion,
    this.restrictedFeatures,
    this.enableContentDeletionFromFolders,
    this.enableContentDownloading,
    this.enableSubtitleDownloading,
    this.enableSubtitleManagement,
    this.enableSyncTranscoding,
    this.enableMediaConversion,
    this.enabledChannels,
    this.enableAllChannels,
    this.enabledFolders,
    this.enableAllFolders,
    this.invalidLoginAttemptCount,
    this.enablePublicSharing,
    this.remoteClientBitrateLimit,
    this.authenticationProviderId,
    this.excludedSubFolders,
    this.simultaneousStreamLimit,
    this.enabledDevices,
    this.enableAllDevices,
    this.allowCameraUpload,
    this.allowSharingPersonalItems,
  });

  factory UserPolicyModel.fromEntity(UserPolicy entity) {
    return UserPolicyModel(
      isAdministrator: entity.isAdministrator,
      isHidden: entity.isHidden,
      isHiddenRemotely: entity.isHiddenRemotely,
      isHiddenFromUnusedDevices: entity.isHiddenFromUnusedDevices,
      isDisabled: entity.isDisabled,
      lockedOutDate: entity.lockedOutDate,
      maxParentalRating: entity.maxParentalRating,
      allowTagOrRating: entity.allowTagOrRating,
      blockedTags: entity.blockedTags,
      isTagBlockingModeInclusive: entity.isTagBlockingModeInclusive,
      includeTags: entity.includeTags,
      enableUserPreferenceAccess: entity.enableUserPreferenceAccess,
      accessSchedules: entity.accessSchedules
          ?.map((e) => AccessScheduleModel.fromEntity(e))
          .toList(),
      blockUnratedItems: entity.blockUnratedItems
          ?.map((e) => UnratedItemModel.fromEntity(e))
          .toList(),
      enableRemoteControlOfOtherUsers: entity.enableRemoteControlOfOtherUsers,
      enableSharedDeviceControl: entity.enableSharedDeviceControl,
      enableRemoteAccess: entity.enableRemoteAccess,
      enableLiveTvManagement: entity.enableLiveTvManagement,
      enableLiveTvAccess: entity.enableLiveTvAccess,
      enableMediaPlayback: entity.enableMediaPlayback,
      enableAudioPlaybackTranscoding: entity.enableAudioPlaybackTranscoding,
      enableVideoPlaybackTranscoding: entity.enableVideoPlaybackTranscoding,
      autoRemoteQuality: entity.autoRemoteQuality,
      enablePlaybackRemuxing: entity.enablePlaybackRemuxing,
      enableContentDeletion: entity.enableContentDeletion,
      restrictedFeatures: entity.restrictedFeatures,
      enableContentDeletionFromFolders: entity.enableContentDeletionFromFolders,
      enableContentDownloading: entity.enableContentDownloading,
      enableSubtitleDownloading: entity.enableSubtitleDownloading,
      enableSubtitleManagement: entity.enableSubtitleManagement,
      enableSyncTranscoding: entity.enableSyncTranscoding,
      enableMediaConversion: entity.enableMediaConversion,
      enabledChannels: entity.enabledChannels,
      enableAllChannels: entity.enableAllChannels,
      enabledFolders: entity.enabledFolders,
      enableAllFolders: entity.enableAllFolders,
      invalidLoginAttemptCount: entity.invalidLoginAttemptCount,
      enablePublicSharing: entity.enablePublicSharing,
      remoteClientBitrateLimit: entity.remoteClientBitrateLimit,
      authenticationProviderId: entity.authenticationProviderId,
      excludedSubFolders: entity.excludedSubFolders,
      simultaneousStreamLimit: entity.simultaneousStreamLimit,
      enabledDevices: entity.enabledDevices,
      enableAllDevices: entity.enableAllDevices,
      allowCameraUpload: entity.allowCameraUpload,
      allowSharingPersonalItems: entity.allowSharingPersonalItems,
    );
  }

  UserPolicy toEntity() {
    return UserPolicy(
      isAdministrator: isAdministrator,
      isHidden: isHidden,
      isHiddenRemotely: isHiddenRemotely,
      isHiddenFromUnusedDevices: isHiddenFromUnusedDevices,
      isDisabled: isDisabled,
      lockedOutDate: lockedOutDate,
      maxParentalRating: maxParentalRating,
      allowTagOrRating: allowTagOrRating,
      blockedTags: blockedTags,
      isTagBlockingModeInclusive: isTagBlockingModeInclusive,
      includeTags: includeTags,
      enableUserPreferenceAccess: enableUserPreferenceAccess,
      accessSchedules: accessSchedules?.map((e) => e.toEntity()).toList(),
      blockUnratedItems: blockUnratedItems?.map((e) => e.toEntity()).toList(),
      enableRemoteControlOfOtherUsers: enableRemoteControlOfOtherUsers,
      enableSharedDeviceControl: enableSharedDeviceControl,
      enableRemoteAccess: enableRemoteAccess,
      enableLiveTvManagement: enableLiveTvManagement,
      enableLiveTvAccess: enableLiveTvAccess,
      enableMediaPlayback: enableMediaPlayback,
      enableAudioPlaybackTranscoding: enableAudioPlaybackTranscoding,
      enableVideoPlaybackTranscoding: enableVideoPlaybackTranscoding,
      autoRemoteQuality: autoRemoteQuality,
      enablePlaybackRemuxing: enablePlaybackRemuxing,
      enableContentDeletion: enableContentDeletion,
      restrictedFeatures: restrictedFeatures,
      enableContentDeletionFromFolders: enableContentDeletionFromFolders,
      enableContentDownloading: enableContentDownloading,
      enableSubtitleDownloading: enableSubtitleDownloading,
      enableSubtitleManagement: enableSubtitleManagement,
      enableSyncTranscoding: enableSyncTranscoding,
      enableMediaConversion: enableMediaConversion,
      enabledChannels: enabledChannels,
      enableAllChannels: enableAllChannels,
      enabledFolders: enabledFolders,
      enableAllFolders: enableAllFolders,
      invalidLoginAttemptCount: invalidLoginAttemptCount,
      enablePublicSharing: enablePublicSharing,
      remoteClientBitrateLimit: remoteClientBitrateLimit,
      authenticationProviderId: authenticationProviderId,
      excludedSubFolders: excludedSubFolders,
      simultaneousStreamLimit: simultaneousStreamLimit,
      enabledDevices: enabledDevices,
      enableAllDevices: enableAllDevices,
      allowCameraUpload: allowCameraUpload,
      allowSharingPersonalItems: allowSharingPersonalItems,
    );
  }

  factory UserPolicyModel.fromJson(Map<String, dynamic> json) =>
      _$UserPolicyModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPolicyModelToJson(this);
}
