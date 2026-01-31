import 'package:flemby/domain/entities/media_source_info.dart';
import 'package:flemby/domain/entities/play_method.dart';
import 'package:flemby/domain/entities/repeat_mode.dart';
import 'package:flemby/domain/entities/sleep_timer_mode.dart';

class PlayerStateInfo {
  final int? positionTicks;
  final bool? canSeek;
  final bool? isPaused;
  final bool? isMuted;
  final int? volumeLevel;
  final int? audioStreamIndex;
  final int? subtitleStreamIndex;
  final String? mediaSourceId;
  final MediaSourceInfo? mediaSource;
  final PlayMethod? playMethod;
  final RepeatMode? repeatMode;
  final SleepTimerMode? sleepTimerMode;
  final DateTime? sleepTimerEndTime;
  final int? subtitleOffset;
  final bool? shuffle;
  final double? playbackRate;

  const PlayerStateInfo({
    this.positionTicks,
    this.canSeek,
    this.isPaused,
    this.isMuted,
    this.volumeLevel,
    this.audioStreamIndex,
    this.subtitleStreamIndex,
    this.mediaSourceId,
    this.mediaSource,
    this.playMethod,
    this.repeatMode,
    this.sleepTimerMode,
    this.sleepTimerEndTime,
    this.subtitleOffset,
    this.shuffle,
    this.playbackRate,
  });
}
