import 'package:get_tugas_ming_10_token/core/model/Result.dart';
import 'package:get_tugas_ming_10_token/core/resp/response.dart';
import 'package:get_tugas_ming_10_token/core/service/ntworok.dart';

class Repository extends Network {
  Repository();
  Repository._privateConstructor();
  static final Repository _instance = Repository._privateConstructor();

  static Repository get instance => _instance;
  Future<List<Movie>> getMovie() async {
    var map = await methodGet();
    return Response.fromJson(map).results;
  }
}
