import 'package:dio/dio.dart';

class DioController {
  final dio = Dio();

  Future<dynamic> getController(
      {Options? options,
      required String url,
      Map<String, dynamic>? queryParameters}) async {
    try {
      print('in get ');
      final response = await dio.get(url,
          options: options, queryParameters: queryParameters);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('Failed to fetch tracks: ${response.statusCode}');
        return Future.error('Failed to get data');
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<dynamic> postController(
      Options? options, String url, Object data) async {
    try {
      final response = await dio.post(url, data: data, options: options);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
