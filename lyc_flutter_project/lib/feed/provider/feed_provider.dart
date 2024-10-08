import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/config/secret.dart';
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

  String? _city;

  bool _initializeCity = false;

  int? _minTemp;
  int? _maxTemp;

  bool _initializeTemp = false;

  List<WeatherPreview>? _weatherPreviewList;

  bool _initializeWeahterPreview = false;

  bool _loadingForMember = false;
  bool _hasMore = true;

  List<ForMemberPreview> _forMemberPreviewList = [];

  get initializeCity => _initializeCity;

  get loading => getLoadingStatus();

  get minTemp => _minTemp ?? 0;

  get maxTemp => _maxTemp ?? 0;

  get initializeTemp => _initializeTemp;

  List<WeatherPreview> get weatherPreviewList => _weatherPreviewList ?? [];

  get initializeWeatherPreview => _initializeWeahterPreview;

  List<ForMemberPreview> get forMemberPreviewList => _forMemberPreviewList;

  Future<void> initFeedScreen() async {
    try {
      await getLocation();
      // 병렬 수행
      await Future.wait([
        getTemp(),
        getWeatherPreview(),
      ]);
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      }else {Exception(e);}
    } finally {
      notifyListeners();
    }
  }

  bool getLoadingStatus() {
    return (_minTemp != null &&
        _maxTemp != null &&
        _weatherPreviewList != null &&
        !_loadingForMember);
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
        _city = "seoul";
        _initializeCity = true;
        return;
      }
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        _city = "seoul";
        _initializeCity = true;
        return;
      }
    }
    // 위치정보
    locationData = await location.getLocation();

    final double? lat = locationData.latitude;
    final double? long = locationData.longitude;

    // 테스트 좌표
    // const double long = 126;
    // const double lat = 37.67;

    final String x = long.toString();
    final String y = lat.toString();

    final Dio dio = Dio();
    try {
      final resp = await dio.get(
        "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json",
        options: Options(
          headers: {"Authorization": "KakaoAK ${KAKAO_API_KEY}"},
        ),
        queryParameters: {
          "x": x,
          "y": y,
        },
      );
      _city = resp.data["documents"][0]["region_1depth_name"];
      _initializeCity = true;
      return;
    } catch (e) {
      // 좌표가 잘못된 경우 default로 서울시 반환
      _city = "seoul";
      _initializeCity = true;
      return;
    }
  }

  Future<void> getTemp() async {
    if (_city == null) {
      try {
        getLocation();
      } catch (e) {
        _city = "seoul";
      }
    }
    final WeatherQuery query = WeatherQuery(city: _city!);
    try {
      final ApiResponse<WeatherResult> resp = await weatherRepositoryProvider
          .repository
          .getWeather(weatherQuery: query);
      _minTemp = resp.result.tempMin;
      _maxTemp = resp.result.tempMax;
      _initializeTemp = true;
      notifyListeners();
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    }
  }

  Future<void> getWeatherPreview() async {
    if (_city == null) {
      try {
        getLocation();
      } catch (e) {
        _city = "seoul";
      }
    }
    try {
      final resp = await feedRepositoryProvider.repository
          .getWeatherPostings(city: _city!);
      _weatherPreviewList = resp.result.posting;
      _initializeWeahterPreview = true;
      notifyListeners();
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
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
