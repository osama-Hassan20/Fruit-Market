

import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;
  static init()
  {
    dio =Dio(
      BaseOptions(
        //https://elwekala.onrender.com/
        baseUrl:'https://elwekala.onrender.com/' ,
        receiveDataWhenStatusError: true,

      ),
    );
  }


  static Future<Response> getData({
    required String url,
    String? token,
  })async
  {
    dio!.options.headers =
    {
      'Content-TypType':'application/json',
      'Accept':'*/*',
      'Connection':'keep-alive',
      'Authorization':token??' ',
    };
    return await dio!.get(
      url,

    );
  }

  static Future<Response?> postData({
    required String url,
    required Map<String,dynamic> data,
  }) async
  {

    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'Accept':'*/*',
      'Connection':'keep-alive',
    };

    return await dio!.post(
      url,
      data: data,
    );
  }


  static Future<Response?> putData({
    required String url,
    required Map<String,dynamic> data,
    String? token,
  }) async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'Accept':'*/*',
      'Connection':'keep-alive',
      'Authorization':token??' ',
    };
    return dio!.put(
      url,
      data: data,

    );
  }


  static Future<Response?> deleteData({
    required String url,
    required Map<String,dynamic> data,
    String? token,
  }) async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'Accept':'*/*',
      'Connection':'keep-alive',
      'Authorization':token??' ',
    };
    return dio!.delete(
      url,
      data: data,

    );
  }

}