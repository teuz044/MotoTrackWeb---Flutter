import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:moto_tracker_web/core/dio/dio_client.dart';
import 'package:moto_tracker_web/modules/login/models/login_response_model.dart';

class LoginRepository {
  final DioClient dio = DioClient();

  Future<LoginResponseModel> login(
    String usuario,
    String senha,
  ) async {
    try {
      final response = await dio.post(
        'auth/login',
        data: {
          'usuario': usuario,
          'senha': senha,
        },
      );
      return LoginResponseModel.fromMap(response.data);
    } on DioException catch (e, s) {
      log('Erro ao realizar login!', error: e, stackTrace: s);
    }
    return LoginResponseModel(codigo: '');
  }
}
