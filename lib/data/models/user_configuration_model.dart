import 'package:flemby/domain/entities/user_configuration.dart';
import 'package:json_annotation/json_annotation.dart';
import 'subtitle_playback_mode_model.dart';
import 'segment_skip_mode_model.dart';

part 'user_configuration_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserConfigurationModel {
  final String? audioLanguagePreference;
  final bool? playDefaultAudioTrack;
  final SubtitlePlaybackModeModel? subtitleLanguagePreference;
  final String? profilePin;
  final bool? displayMissingEpisodes;
  final String? subtitleMode;
  final List<String>? orderedViews;
  final List<String>? latestItemsExcludes;
  final List<String>? myMediaExcludes;
  final bool? hidePlayedInLatest;
  final bool? hidePlayedInMoreLikeThis;
  final bool? hidePlayedInSuggestions;
  final bool? rememberAudioSelections;
  final bool? rememberSubtitleSelections;
  final bool? enableNextEpisodeAutoPlay;
  final int? resumeRewindSeconds;
  final SegmentSkipModeModel? introSkipMode;
  final bool? enableLocalPassword;

  const UserConfigurationModel({
    this.audioLanguagePreference,
    this.playDefaultAudioTrack,
    this.subtitleLanguagePreference,
    this.profilePin,
    this.displayMissingEpisodes,
    this.subtitleMode,
    this.orderedViews,
    this.latestItemsExcludes,
    this.myMediaExcludes,
    this.hidePlayedInLatest,
    this.hidePlayedInMoreLikeThis,
    this.hidePlayedInSuggestions,
    this.rememberAudioSelections,
    this.rememberSubtitleSelections,
    this.enableNextEpisodeAutoPlay,
    this.resumeRewindSeconds,
    this.introSkipMode,
    this.enableLocalPassword,
  });

  factory UserConfigurationModel.fromEntity(UserConfiguration entity) {
    return UserConfigurationModel(
      audioLanguagePreference: entity.audioLanguagePreference,
      playDefaultAudioTrack: entity.playDefaultAudioTrack,
      subtitleLanguagePreference: entity.subtitleLanguagePreference != null
          ? SubtitlePlaybackModeModel.fromEntity(
              entity.subtitleLanguagePreference!,
            )
          : null,
      profilePin: entity.profilePin,
      displayMissingEpisodes: entity.displayMissingEpisodes,
      subtitleMode: entity.subtitleMode,
      orderedViews: entity.orderedViews,
      latestItemsExcludes: entity.latestItemsExcludes,
      myMediaExcludes: entity.myMediaExcludes,
      hidePlayedInLatest: entity.hidePlayedInLatest,
      hidePlayedInMoreLikeThis: entity.hidePlayedInMoreLikeThis,
      hidePlayedInSuggestions: entity.hidePlayedInSuggestions,
      rememberAudioSelections: entity.rememberAudioSelections,
      rememberSubtitleSelections: entity.rememberSubtitleSelections,
      enableNextEpisodeAutoPlay: entity.enableNextEpisodeAutoPlay,
      resumeRewindSeconds: entity.resumeRewindSeconds,
      introSkipMode: entity.introSkipMode != null
          ? SegmentSkipModeModel.fromEntity(entity.introSkipMode!)
          : null,
      enableLocalPassword: entity.enableLocalPassword,
    );
  }

  UserConfiguration toEntity() {
    return UserConfiguration(
      audioLanguagePreference: audioLanguagePreference,
      playDefaultAudioTrack: playDefaultAudioTrack,
      subtitleLanguagePreference: subtitleLanguagePreference?.toEntity(),
      profilePin: profilePin,
      displayMissingEpisodes: displayMissingEpisodes,
      subtitleMode: subtitleMode,
      orderedViews: orderedViews,
      latestItemsExcludes: latestItemsExcludes,
      myMediaExcludes: myMediaExcludes,
      hidePlayedInLatest: hidePlayedInLatest,
      hidePlayedInMoreLikeThis: hidePlayedInMoreLikeThis,
      hidePlayedInSuggestions: hidePlayedInSuggestions,
      rememberAudioSelections: rememberAudioSelections,
      rememberSubtitleSelections: rememberSubtitleSelections,
      enableNextEpisodeAutoPlay: enableNextEpisodeAutoPlay,
      resumeRewindSeconds: resumeRewindSeconds,
      introSkipMode: introSkipMode?.toEntity(),
      enableLocalPassword: enableLocalPassword,
    );
  }

  factory UserConfigurationModel.fromJson(Map<String, dynamic> json) =>
      _$UserConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserConfigurationModelToJson(this);
}
