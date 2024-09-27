import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../session/session.dart' as session;

class DioClient extends DioForNative {
  DioClient()
      : super(
          BaseOptions(
              baseUrl:
                  'https://frothub.onrender.com/', //TODO: alterar quando for para rota de produção
              connectTimeout: const Duration(seconds: 120),
              receiveTimeout: const Duration(seconds: 120),
              headers: {"Authorization" : "Bearer ${session.Session.token}",}),
        );
}
