import 'package:app_estagio/pages/login_page/result_login.dart';
import 'package:app_estagio/pages/recovery_page/recovery_page.dart';
import 'package:app_estagio/pages/register_page/register_page.dart';
import 'package:app_estagio/repository/http_request_and_post.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

// ignore: camel_case_types
class _Login_PageState extends State<Login_Page> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _showPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          color: const Color(0xFF201A30),
          child: ListView(
            children: [
              Center(
                child: Image.asset(
                  "images/person.png",
                  scale: 10,
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required("Email requerido"),
                    Validatorless.email("Digite Um email valido"),
                  ]),
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: Color(0xFF362E4A),
                    filled: true,
                    label: Text(
                      "Email",
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: MediaQuery.of(context).size.width / 1.02,
                child: TextFormField(
                  obscureText: _showPass == false ? true : false,
                  validator: Validatorless.multiple([
                    Validatorless.required("Digite sua senha"),
                    Validatorless.min(8, "Minimo de caracteres é 8"),
                  ]),
                  controller: senhaController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: const Color(0xFF362E4A),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPass == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPass = !_showPass;
                        });
                      },
                    ),
                    label: const Text(
                      "Senha",
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    onPressed: () {
                      var formvalid = formKey.currentState?.validate() ?? false;
                      if (formvalid) {
                        setState(() async {
                          var init = LoginRepository();
                          var requisicao = await init.accountLogin(
                              emailController.text, senhaController.text);
                          if (requisicao['\$error'] != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        Result_ScreenError(requisicao))));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const Result_ScreenSuccess())));
                          }
                        });
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF0DF5E3),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Recovery_Page())));
                },
                child: const Text(
                  "Esqueci Minha senha",
                  style: TextStyle(
                    color: Color(0xFF0DF5E3),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Register_Page())));
                },
                child: const Text(
                  "Cadastrar-se",
                  style: TextStyle(
                    color: Color(0xFF0DF5E3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
