
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moto_tracker_web/core/dio/dio_client.dart';
import 'package:moto_tracker_web/modules/login/controllers/login_controller.dart';
import 'package:moto_tracker_web/modules/login/login_page.dart';
import 'package:moto_tracker_web/modules/login/repositories/login_repository.dart';

class LoginModule extends Module{
   @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
    i.addLazySingleton(LoginController.new);
    i.addLazySingleton(LoginRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
  }
}