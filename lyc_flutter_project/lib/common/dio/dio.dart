import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioProvider extends ChangeNotifier {
  final _dio = Dio();
  Dio get dio => _dio;
}