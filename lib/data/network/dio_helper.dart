import 'package:dio/dio.dart';
import 'end_points.dart';

class DioHelper {

  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: BASEURL,
        receiveDataWhenStatusError: true,
         /*headers: {
           'Content-Type':'application/json',
         }*/
      ),
    );
  }
  static Future<Response> getData ({
    required String url,
     Map<String,dynamic>? query,
    String? token ,
  }) async
  {
    dio.options.headers= {
      'Content-Type' : 'application/json',
      // 'Authorization': token,
      'Authorization': 'Bearer $token'
    };
    return await dio.get(url, queryParameters : query ,);
  }

  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String token = '' ,
  }) async{
    return await dio.post(
        url,
        queryParameters: query,
        data: data);
  }

  static Future<Response> postFormData({
    required String url,
    required FormData  data,
    required String token ,
  }) async{
    return await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
    );
  }
  static Future<Response> postDataWithToken({
    required String url,
    required Map<String,dynamic> data,
    required String token  ,
  }) async{
    return await dio.post(
        url,
        data: data,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> putData({
    required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang = 'en',
    String token = '' ,
}) async{
     return await dio.put(
         url,
         queryParameters: query,
         data: data,
         options: Options(
         headers: {
           'Content-Type' : 'application/json',
           'Authorization': 'Bearer $token',
         }
     ));
  }
  static Future<Response> updateData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String token = '' ,
  }) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.patch(
      url,
      data: data,
    );
  }
  static Future<Response> deleteData({
    required String url,
    Map<String,dynamic>? query,
    String token = '' ,
  }) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.delete(
      url,
    );
  }
}