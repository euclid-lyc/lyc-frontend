class PushSet {
  final bool dm;
  final bool feed;
  final bool schedule;
  final bool likeMark;
  final bool event;
  final bool ad;

  PushSet({
    required this.dm,
    required this.feed,
    required this.schedule,
    required this.likeMark,
    required this.event,
    required this.ad,
  });

  Map<String, dynamic> toJson() {
    return {
      'dm': dm,
      'feed': feed,
      'schedule': schedule,
      'likeMark': likeMark,
      'event': event,
      'ad': ad,
    };
  }

  static PushSet defaultValue() {
    return PushSet(
      dm: false,
      feed: false,
      schedule: false,
      likeMark: false,
      event: false,
      ad: false,
    );
  }
  PushSet copyWith({
    bool? dm,
    bool? feed,
    bool? schedule,
    bool? likeMark,
    bool? event,
    bool? ad,
  }) {
    return PushSet(
      dm: dm ?? this.dm,
      feed: feed ?? this.feed,
      schedule: schedule ?? this.schedule,
      likeMark: likeMark ?? this.likeMark,
      event: event ?? this.event,
      ad: ad ?? this.ad,
    );
  }
}

