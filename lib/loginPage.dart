import 'package:flutter/material.dart';
import 'homePage.dart';



class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<loginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool loginBerhasil = false;
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white, 
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 80),
                  Text(
                    'Hallo👋',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 40),

                  _buildTextField(
                    controller: _username,
                    hint: "Username",
                    icon: Icons.person,
                    obscure: false,
                  ),
                  const SizedBox(height: 20),

                  _buildTextField(
                    controller: _password,
                    hint: "Password",
                    icon: Icons.lock,
                    obscure: _obscure,
                    suffix: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off,
                        color: const Color.fromRGBO(189, 189, 189, 1),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lupa kata sandi?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 83, 83, 83),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),


                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 83, 83, 83),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        _handleLogin(context);
                      },
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        _username.clear();
                        _password.clear();
                      },
                      child: Text(
                        'Clear Username & Password',
                        style: TextStyle(color: Color.fromARGB(255, 83, 83, 83)),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required bool obscure,
    Widget? suffix,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color:Color.fromARGB(255, 83, 83, 83)),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 231, 231, 231),
        prefixIcon: Icon(icon, color:Color.fromARGB(255, 83, 83, 83)),
        suffixIcon: suffix,
        hintText: hint,
        hintStyle: TextStyle(color: const Color.fromRGBO(158, 158, 158, 1)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    String text = "";
    if (_username.text == "Afifah" && _password.text == "004") {
      setState(() {
        text = "Login Berhasil";
        loginBerhasil = true;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => homePage(username: _username.text),
        ),
      );
    } else {
      setState(() {
        text = "Login Gagal";
        loginBerhasil = false;
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: loginBerhasil ? Colors.green : Colors.red,
      ),
    );
  }
}
