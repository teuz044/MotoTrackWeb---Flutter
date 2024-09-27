import 'package:flutter/material.dart';

import 'class_estilos_texto.dart';

class CustomAppbarPadrao extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbarPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        children: [
          const ImageIcon(
            AssetImage(
              'assets/images/logo.png',
            ),
            size: 45,
            color: Color(0xffEEFF84),
          ),
          Text(
            'Gestão de Frotas',
            style: ClassEstilosTextos.branccoSize24w600Montserrat,
          ),
        ],
      ),
      centerTitle: true,
      elevation: 4,
      backgroundColor: Colors.red.shade400,
    );
  }

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


