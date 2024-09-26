import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:retrofit/retrofit.dart';

part 'director_repository.g.dart';

class DirectorRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late DirectorRepository repository;

  DirectorRepositoryProvider({required this.dio}) {
    repository = DirectorRepository(
      dio,
      baseUrl: "http://$ip/lyc/socials/directors"
    );
  }
}

@RestApi()
abstract class DirectorRepository {
  factory DirectorRepository(Dio dio, {String baseUrl}) = _DirectorRepository;

  @GET("")
  getDirectorRanking();
}