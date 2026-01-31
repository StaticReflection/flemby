// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_state_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerStateInfoModel _$PlayerStateInfoModelFromJson(
  Map<String, dynamic> json,
) => PlayerStateInfoModel(
  positionTicks: (json['PositionTicks'] as num?)?.toInt(),
  canSeek: json['CanSeek'] as bool?,
  isPaused: json['IsPaused'] as bool?,
  isMuted: json['IsMuted'] as bool?,
  volumeLevel: (json['VolumeLevel'] as num?)?.toInt(),
  audioStreamIndex: (json['AudioStreamIndex'] as num?)?.toInt(),
  subtitleStreamIndex: (json['SubtitleStreamIndex'] as num?)?.toInt(),
  mediaSourceId: json['MediaSourceId'] as String?,
  mediaSource: json['MediaSource'] == null
      ? null
      : MediaSourceInfoModel.fromJson(
          json['MediaSource'] as Map<String, dynamic>,
        ),
  playMethod: $enumDecodeNullable(_$PlayMethodModelEnumMap, json['PlayMethod']),
  repeatMode: $enumDecodeNullable(_$RepeatModeModelEnumMap, json['RepeatMode']),
  sleepTimerMode: $enumDecodeNullable(
    _$SleepTimerModeModelEnumMap,
    json['SleepTimerMode'],
  ),
  sleepTimerEndTime: json['SleepTimerEndTime'] == null
      ? null
      : DateTime.parse(json['SleepTimerEndTime'] as String),
  subtitleOffset: (json['SubtitleOffset'] as num?)?.toInt(),
  shuffle: json['Shuffle'] as bool?,
  playbackRate: (json['PlaybackRate'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PlayerStateInfoModelToJson(
  PlayerStateInfoModel instance,
) => <String, dynamic>{
  'PositionTicks': instance.positionTicks,
  'CanSeek': instance.canSeek,
  'IsPaused': instance.isPaused,
  'IsMuted': instance.isMuted,
  'VolumeLevel': instance.volumeLevel,
  'AudioStreamIndex': instance.audioStreamIndex,
  'SubtitleStreamIndex': instance.subtitleStreamIndex,
  'MediaSourceId': instance.mediaSourceId,
  'MediaSource': instance.mediaSource,
  'PlayMethod': _$PlayMethodModelEnumMap[instance.playMethod],
  'RepeatMode': _$RepeatModeModelEnumMap[instance.repeatMode],
  'SleepTimerMode': _$SleepTimerModeModelEnumMap[instance.sleepTimerMode],
  'SleepTimerEndTime': instance.sleepTimerEndTime?.toIso8601String(),
  'SubtitleOffset': instance.subtitleOffset,
  'Shuffle': instance.shuffle,
  'PlaybackRate': instance.playbackRate,
};

const _$PlayMethodModelEnumMap = {
  PlayMethodModel.transcode: 'Transcode',
  PlayMethodModel.directStream: 'DirectStream',
  PlayMethodModel.directPlay: 'DirectPlay',
};

const _$RepeatModeModelEnumMap = {
  RepeatModeModel.repeatNone: 'RepeatNone',
  RepeatModeModel.repeatAll: 'RepeatAll',
  RepeatModeModel.repeatOne: 'RepeatOne',
};

const _$SleepTimerModeModelEnumMap = {
  SleepTimerModeModel.none: 'None',
  SleepTimerModeModel.afterItem: 'AfterItem',
  SleepTimerModeModel.atTime: 'AtTime',
};
