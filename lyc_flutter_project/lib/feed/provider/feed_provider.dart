import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/feed/model/for_member_preview.dart';
import 'package:lyc_flutter_project/feed/model/weather_model.dart';
import 'package:lyc_flutter_project/feed/model/weather_preview.dart';
import 'package:lyc_flutter_project/feed/repository/feed_repository.dart';
import 'package:lyc_flutter_project/feed/repository/weather_repository.dart';

class FeedProvider extends ChangeNotifier {
  final WeatherRepositoryProvider weatherRepositoryProvider;
  final FeedRepositoryProvider feedRepositoryProvider;

  FeedProvider({
    required this.weatherRepositoryProvider,
    required this.feedRepositoryProvider,
  });

  bool _initializeLocate = false;

  int? _minTemp;
  int? _maxTemp;

  bool _initializeTemp = false;

  List<WeatherPreview>? _weatherPreviewList;

  bool _initializeWeatherPreview = false;

  bool _loadingForMember = false;
  bool _hasMore = true;

  List<ForMemberPreview> _forMemberPreviewList = [];

  // double _lat = 37.30;
  // double _lon = 127.01;

  get loading => getLoadingStatus();

  get minTemp => _minTemp ?? 0;

  get maxTemp => _maxTemp ?? 0;

  get initializeTemp => _initializeTemp;

  List<WeatherPreview> get weatherPreviewList => _weatherPreviewList ?? [];

  get initializeWeatherPreview => _initializeWeatherPreview;

  List<ForMemberPreview> get forMemberPreviewList => _forMemberPreviewList;

  Future<void> initFeedScreen() async {
    try {
      await getLocation();
      await Future.wait([
        getTemp(),
        getWeatherPreview(),
        getForMemberPreview()
      ]);
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    } finally {
      notifyListeners();
    }
  }

  bool getLoadingStatus() {
    return (_minTemp != null && _maxTemp != null && _weatherPreviewList != null && !_loadingForMember);
  }

  Future<void> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionStatus;
    LocationData locationData;

    // 권한 요청
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        _initializeLocate = true;
        return;
      }
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        _initializeLocate = true;
        return;
      }
    }
    // 위치 정보
    locationData = await location.getLocation();

    // _lat = locationData.latitude ?? 37.30;
    // _lon = locationData.longitude ?? 127.01;

    _initializeLocate = true;
  }

  Future<void> getTemp() async {
    if (!_initializeLocate) {
      await getLocation();
    }

    try {
      final ApiResponse<WeatherResult> resp = await weatherRepositoryProvider.repository.getWeather(
        lat: 37.5,
        lon: 127.0,
      );
      _minTemp = resp.result.tempMin;
      _maxTemp = resp.result.tempMax;
      _initializeTemp = true;
      notifyListeners();
    } catch (e) {
      Exception(e);
      debugPrint(e.toString());
    }
  }

  Future<void> getWeatherPreview() async {
    try {
      final resp = await feedRepositoryProvider.repository.getWeatherPostings(
        lat: 37.5,
        lon: 127.0,
      );
      _weatherPreviewList = resp.result.posting;
      _initializeWeatherPreview = true;
      notifyListeners();
    } catch (e) {
      Exception(e);
      debugPrint(e.toString());
    }
  }

  Future<void> refreshForMemberPreview() async {
    await getForMemberPreview(refresh: true);
  }

  Future<void> getForMemberPreview({
    bool refresh = false,
    int pageSize = 10,
    int? cursorScore,
    int? cursorId,
  }) async {
    if (_loadingForMember || (!refresh && !_hasMore)) return;

    if (!refresh && _forMemberPreviewList.isNotEmpty) {
      cursorScore = _forMemberPreviewList.last.totalScore;
      cursorId = _forMemberPreviewList.last.postingId;
    }

    try {
      _loadingForMember = true;
      final resp = await feedRepositoryProvider.repository.getForMemberPostings(
        pageSize: pageSize,
        cursorId: cursorId,
        cursorScore: cursorScore,
      );
      final list = resp.result.postings;
      _forMemberPreviewList = refresh
          ? [...list]
          : [
              ..._forMemberPreviewList,
              ...list,
            ];
      _hasMore = list.length >= pageSize;
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    } finally {
      _loadingForMember = false;
      notifyListeners();
    }
  }
}
