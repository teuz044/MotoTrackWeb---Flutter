import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:moto_tracker_web/core/loader/loader.dart';
import 'package:moto_tracker_web/core/ui/custom_text_field_login.dart';
import 'package:moto_tracker_web/modules/login/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader {
  final controller = Modular.get<LoginController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case LoginStateStatus.initial:
            break;
          case LoginStateStatus.loading:
            showLoader();
            break;
          case LoginStateStatus.success:
            hideLoader();
            setState(() {});
            break;
          case LoginStateStatus.successResetPassword:
            hideLoader();
            setState(() {});
            break;
          case LoginStateStatus.error:
            hideLoader();
            break;
        }
      });

      setState(() {});
    });
    super.initState();
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset(
          'assets/images/logo.png',
          height: 120,
        ),
        backgroundColor: const Color(0xFFeeb001),
      ),
      backgroundColor: const Color(0xFFeeb001),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinhamento para a esquerda
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Bem vindo, Chefe!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Texto preto
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Logue em sua conta',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextFieldLogin(
                  labelText: 'Usuário',
                  controller: controller.usuarioEC,
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: Colors.black), // Ícone preto
                ),
                const SizedBox(height: 20),
                CustomTextFieldLogin(
                  labelText: 'Senha',
                  controller: controller.senhaEC,
                  isObscure: _isObscure,
                  prefixIcon: const Icon(Icons.lock_outline,
                      color: Colors.black), // Ícone preto
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black, // Ícone de visibilidade preto
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(color: Colors.black), // Texto preto
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      Modular.to.pushNamed('');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: const Color(0xFF000000), // Botão preto
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Texto do botão branco
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
