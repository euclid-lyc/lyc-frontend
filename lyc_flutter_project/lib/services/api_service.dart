import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lyc_flutter_project/model/posting_preview.dart';

class ApiService {
  // 오타 방지 + 자동 완성 기능을 위해 멤버 변수를 정의합니다
  static const String baseUrl = "localhost:8080";
  static const String members = "members";
  static const String postings = "postings";
  static const String savedPostings = "saved-postings";
  static const String reviews = "reviews";
  static const String saves = "saves";
  static const String likes = "likes";
  static const String coordies = "coordies";

  // [MyPage] 유저의 코디 목록 불러오기
  static Future<List<PostingPreview>> getMyCoordiesById(int id) async {
    List<PostingPreview> postingsPreviewInstances = [];
    final url = Uri.parse("$baseUrl/$members/$id/$coordies");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final postingsPreview = jsonDecode(response.body);
      for (var postingPreview in postingsPreview){
        postingsPreviewInstances.add(PostingPreview.fromJson(postingPreview));
      }
      return postingsPreviewInstances;
    }
    throw Error();
  }

  // [MyPage] 저장한 코디 목록 불러오기
  static Future<List<PostingPreview>> getSavedPostingsById(int id) async {
    List<PostingPreview> postingsPreviewInstances = [];
    final url = Uri.parse("$baseUrl/$members/$id/$savedPostings");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final postingsPreview = jsonDecode(response.body);
      for (var postingPreview in postingsPreview){
        postingsPreviewInstances.add(PostingPreview.fromJson(postingPreview));
      }
      return postingsPreviewInstances;
    }
    throw Error();
  }
}