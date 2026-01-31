import 'package:flemby/domain/entities/segment_skip_mode.dart';
import 'package:flemby/domain/entities/subtitle_playback_mode.dart';

class UserConfiguration {
  final String? audioLanguagePreference;
  final bool? playDefaultAudioTrack;
  final SubtitlePlaybackMode? subtitleLanguagePreference;
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
  final SegmentSkipMode? introSkipMode;
  final bool? enableLocalPassword;

  UserConfiguration({
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
}
