import 'package:shared_preferences/shared_preferences.dart';

enum PushAlarm {
  dm,
  feed,
  calender,
  like,
  event,
  ad,
}

Future<void> initializeAlarmDb () async {
  SharedPreferences prefs  = await SharedPreferences.getInstance();
  final String dmKey = PushAlarm.dm.toString();
  final String feedKey = PushAlarm.feed.toString();
  final String calenderKey = PushAlarm.calender.toString();
  final String likeKey = PushAlarm.like.toString();
  final String eventKey = PushAlarm.event.toString();
  final String adKey = PushAlarm.ad.toString();

  if (!prefs.containsKey(dmKey)) prefs.setBool(dmKey, true);
  if (!prefs.containsKey(feedKey)) prefs.setBool(feedKey, true);
  if (!prefs.containsKey(calenderKey)) prefs.setBool(calenderKey, true);
  if (!prefs.containsKey(likeKey)) prefs.setBool(likeKey, true);
  if (!prefs.containsKey(eventKey)) prefs.setBool(eventKey, true);
  if (!prefs.containsKey(adKey)) prefs.setBool(adKey, true);
}

Future<bool> getAlarm (PushAlarm alarm) async {
  SharedPreferences prefs  = await SharedPreferences.getInstance();
  return prefs.get(alarm.toString()) as bool;
}

Future<void> setAlarm (PushAlarm alarm, bool selected) async {
  SharedPreferences prefs  = await SharedPreferences.getInstance();
  prefs.setBool(alarm.toString(), selected);
}