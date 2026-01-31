// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserConfigurationModel _$UserConfigurationModelFromJson(
  Map<String, dynamic> json,
) => UserConfigurationModel(
  audioLanguagePreference: json['AudioLanguagePreference'] as String?,
  playDefaultAudioTrack: json['PlayDefaultAudioTrack'] as bool?,
  subtitleLanguagePreference: $enumDecodeNullable(
    _$SubtitlePlaybackModeModelEnumMap,
    json['SubtitleLanguagePreference'],
  ),
  profilePin: json['ProfilePin'] as String?,
  displayMissingEpisodes: json['DisplayMissingEpisodes'] as bool?,
  subtitleMode: json['SubtitleMode'] as String?,
  orderedViews: (json['OrderedViews'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  latestItemsExcludes: (json['LatestItemsExcludes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  myMediaExcludes: (json['MyMediaExcludes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  hidePlayedInLatest: json['HidePlayedInLatest'] as bool?,
  hidePlayedInMoreLikeThis: json['HidePlayedInMoreLikeThis'] as bool?,
  hidePlayedInSuggestions: json['HidePlayedInSuggestions'] as bool?,
  rememberAudioSelections: json['RememberAudioSelections'] as bool?,
  rememberSubtitleSelections: json['RememberSubtitleSelections'] as bool?,
  enableNextEpisodeAutoPlay: json['EnableNextEpisodeAutoPlay'] as bool?,
  resumeRewindSeconds: (json['ResumeRewindSeconds'] as num?)?.toInt(),
  introSkipMode: $enumDecodeNullable(
    _$SegmentSkipModeModelEnumMap,
    json['IntroSkipMode'],
  ),
  enableLocalPassword: json['EnableLocalPassword'] as bool?,
);

Map<String, dynamic> _$UserConfigurationModelToJson(
  UserConfigurationModel instance,
) => <String, dynamic>{
  'AudioLanguagePreference': instance.audioLanguagePreference,
  'PlayDefaultAudioTrack': instance.playDefaultAudioTrack,
  'SubtitleLanguagePreference':
      _$SubtitlePlaybackModeModelEnumMap[instance.subtitleLanguagePreference],
  'ProfilePin': instance.profilePin,
  'DisplayMissingEpisodes': instance.displayMissingEpisodes,
  'SubtitleMode': instance.subtitleMode,
  'OrderedViews': instance.orderedViews,
  'LatestItemsExcludes': instance.latestItemsExcludes,
  'MyMediaExcludes': instance.myMediaExcludes,
  'HidePlayedInLatest': instance.hidePlayedInLatest,
  'HidePlayedInMoreLikeThis': instance.hidePlayedInMoreLikeThis,
  'HidePlayedInSuggestions': instance.hidePlayedInSuggestions,
  'RememberAudioSelections': instance.rememberAudioSelections,
  'RememberSubtitleSelections': instance.rememberSubtitleSelections,
  'EnableNextEpisodeAutoPlay': instance.enableNextEpisodeAutoPlay,
  'ResumeRewindSeconds': instance.resumeRewindSeconds,
  'IntroSkipMode': _$SegmentSkipModeModelEnumMap[instance.introSkipMode],
  'EnableLocalPassword': instance.enableLocalPassword,
};

const _$SubtitlePlaybackModeModelEnumMap = {
  SubtitlePlaybackModeModel.defaultMode: 'DefaultMode',
  SubtitlePlaybackModeModel.always: 'Always',
  SubtitlePlaybackModeModel.onlyForced: 'OnlyForced',
  SubtitlePlaybackModeModel.none: 'None',
  SubtitlePlaybackModeModel.smart: 'Smart',
  SubtitlePlaybackModeModel.hearingImpaired: 'HearingImpaired',
};

const _$SegmentSkipModeModelEnumMap = {
  SegmentSkipModeModel.showButton: 'ShowButton',
  SegmentSkipModeModel.autoSkip: 'AutoSkip',
  SegmentSkipModeModel.none: 'None',
};
