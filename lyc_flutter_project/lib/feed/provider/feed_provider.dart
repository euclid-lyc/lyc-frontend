import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/config/secret.dart';
import 'package:lyc_flutter_project/feed/model/weather_model.dart';
import 'package:lyc_flutter_project/feed/repository/weather_repository.dart';

class FeedProvider extends ChangeNotifier {
  final WeatherRepositoryProvider weatherRepositoryProvider;

  FeedProvider({required this.weatherRepositoryProvider});

  int? minTemp;
  int? maxTemp;

  get needTemp => (minTemp == null || maxTemp == null);

  Future<String> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionStatus;
    LocationData locationData;

    // 권한 요청
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return "seoul";
      }
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        return "seoul";
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
    dio.interceptors.add(CustomInterceptor());
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
      return resp.data["documents"][0]["region_1depth_name"];
    } catch (e) {
      // 좌표가 잘못된 경우 default로 서울시 반환
      return "seoul";
    }
  }

  Future<void> getTemp() async {
    final String city = await getLocation();

    final WeatherQuery query = WeatherQuery(city: city);
    try {
      final ApiResponse<WeatherResult> resp = await weatherRepositoryProvider
          .repository
          .getWeather(weatherQuery: query);

      minTemp = resp.result.tempMin;
      maxTemp = resp.result.tempMax;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
