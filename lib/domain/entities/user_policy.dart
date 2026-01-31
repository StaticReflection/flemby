import 'package:flemby/domain/entities/access_schedule.dart';
import 'package:flemby/domain/entities/unrated_item.dart';

class UserPolicy {
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
  final List<AccessSchedule>? accessSchedules;
  final List<UnratedItem>? blockUnratedItems;
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

  UserPolicy({
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
}
