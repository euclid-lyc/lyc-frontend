import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/setting/repository/setting_repository.dart';

class SettingProvider extends ChangeNotifier {
  final SettingRepositoryProvider repositoryProvider;

  SettingProvider({
    required this.repositoryProvider,
  });
}
