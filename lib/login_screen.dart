import 'package:flutter/material.dart';
import 'package:kedai_angkringan/main_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Card(
            color: Colors.white,
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukan akun disini...',
                    labelText: 'Akun',
                  ),
                ),
                SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukan kata sandi disini...',
                    labelText: 'Kata sandi',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const MainScreen();
                    },));
                  },
                child: Text('Masuk'),
                )
              ],
            ),         
          ), 
        ),
      ) 
    );
  }
}


