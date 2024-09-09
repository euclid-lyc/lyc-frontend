import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class LoginRepositoryProvider extends ChangeNotifier {
  final Dio dio;

  LoginRepositoryProvider({required this.dio});
}

