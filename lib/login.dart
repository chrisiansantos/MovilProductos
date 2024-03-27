import 'package:flutter/material.dart';
import 'main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static String id = 'login_view';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
                vertical: size.height * 0.05,
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'email',
                  labelStyle: TextStyle(
                    color: Color(0xFFBEBCBC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onChanged: (value) {},
              ),
            ),

            // contraseña
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * .1,
                  right: size.width * 0.1,
                  bottom: size.height * 0.05),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color(0xFFBEBCBC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a MyHomePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Productos')),
                );
              },
              
              child: const Text(
                'Iniciar sesión',
              ),
            )
          ],
        ),
      ),
    );
  }
}
