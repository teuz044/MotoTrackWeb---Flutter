import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moto_tracker_web/modules/login/login_module.dart';

void main() {
  return runApp(
    ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppModule extends Module {
  @override
  void binds(i) {
    // i.addLazySingleton(AuthStore.new);
  }

  @override
  void routes(r) {
    r.module('/', module: LoginModule());
  }
}
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}