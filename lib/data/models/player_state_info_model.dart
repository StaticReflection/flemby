import 'package:flemby/domain/entities/player_state_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'media_source_info_model.dart';
import 'play_method_model.dart';
import 'repeat_mode_model.dart';
import 'sleep_timer_mode_model.dart';

part 'player_state_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class PlayerStateInfoModel {
  final int? positionTicks;
  final bool? canSeek;
  final bool? isPaused;
  final bool? isMuted;
  final int? volumeLevel;
  final int? audioStreamIndex;
  final int? subtitleStreamIndex;
  final String? mediaSourceId;
  final MediaSourceInfoModel? mediaSource;
  final PlayMethodModel? playMethod;
  final RepeatModeModel? repeatMode;
  final SleepTimerModeModel? sleepTimerMode;
  final DateTime? sleepTimerEndTime;
  final int? subtitleOffset;
  final bool? shuffle;
  final double? playbackRate;

  const PlayerStateInfoModel({
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

  factory PlayerStateInfoModel.fromEntity(PlayerStateInfo entity) {
    return PlayerStateInfoModel(
      positionTicks: entity.positionTicks,
      canSeek: entity.canSeek,
      isPaused: entity.isPaused,
      isMuted: entity.isMuted,
      volumeLevel: entity.volumeLevel,
      audioStreamIndex: entity.audioStreamIndex,
      subtitleStreamIndex: entity.subtitleStreamIndex,
      mediaSourceId: entity.mediaSourceId,
      mediaSource: entity.mediaSource != null
          ? MediaSourceInfoModel.fromEntity(entity.mediaSource!)
          : null,
      playMethod: entity.playMethod != null
          ? PlayMethodModel.fromEntity(entity.playMethod!)
          : null,
      repeatMode: entity.repeatMode != null
          ? RepeatModeModel.fromEntity(entity.repeatMode!)
          : null,
      sleepTimerMode: entity.sleepTimerMode != null
          ? SleepTimerModeModel.fromEntity(entity.sleepTimerMode!)
          : null,
      sleepTimerEndTime: entity.sleepTimerEndTime,
      subtitleOffset: entity.subtitleOffset,
      shuffle: entity.shuffle,
      playbackRate: entity.playbackRate,
    );
  }

  PlayerStateInfo toEntity() {
    return PlayerStateInfo(
      positionTicks: positionTicks,
      canSeek: canSeek,
      isPaused: isPaused,
      isMuted: isMuted,
      volumeLevel: volumeLevel,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
      mediaSourceId: mediaSourceId,
      mediaSource: mediaSource?.toEntity(),
      playMethod: playMethod?.toEntity(),
      repeatMode: repeatMode?.toEntity(),
      sleepTimerMode: sleepTimerMode?.toEntity(),
      sleepTimerEndTime: sleepTimerEndTime,
      subtitleOffset: subtitleOffset,
      shuffle: shuffle,
      playbackRate: playbackRate,
    );
  }

  factory PlayerStateInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStateInfoModelToJson(this);
}
