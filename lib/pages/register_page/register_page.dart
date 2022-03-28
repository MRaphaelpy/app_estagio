import 'package:app_estagio/pages/register_page/error_page.dart';
import 'package:app_estagio/pages/register_page/validator_pass.dart';
import 'package:app_estagio/repository/http_request_and_post.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

// ignore: camel_case_types
class Register_Page extends StatefulWidget {
  const Register_Page({Key? key}) : super(key: key);

  @override
  State<Register_Page> createState() => _Register_PageState();
}

// ignore: camel_case_types
class _Register_PageState extends State<Register_Page> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confSenhaController = TextEditingController();
  bool _showPass = false;
  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _senhaController.dispose();
    _confSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(mask: '(##) #####-####',filter: {"#": RegExp(r'[0-9]')},type: MaskAutoCompletionType.lazy);
    return Scaffold(
      backgroundColor: const Color(0xFF201A30),
      appBar: AppBar(
        elevation: 1000,
        backgroundColor: const Color(0xFF201A30),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: const Text(
                "Cadastre-se",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width / 1.03,
                child: TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required("Nome requerido"),
                  ]),
                  controller: _nomeController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: Color(0xFF362E4A),
                    filled: true,
                    label: Text(
                      "Nome",
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQuery.of(context).size.width / 1.03,
                child: TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required("Digite seu Email"),
                    Validatorless.email("Email Invalido"),
                  ]),
                  controller: _emailController,
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
            ),
            Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQuery.of(context).size.width / 1.03,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  inputFormatters: [maskFormatter],
                  style: const TextStyle(color: Colors.white),
                  validator: Validatorless.multiple([
                    Validatorless.required("Telefone Obrigatorio"),
                    Validatorless.number('Somente Numeros')
                  ]),
                  controller: _telefoneController,
                  decoration: const InputDecoration(
                    fillColor: Color(0xFF362E4A),
                    filled: true,
                    label: Text(
                      "Telefone",
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQuery.of(context).size.width / 1.03,
                child: TextFormField(
                  obscureText: _showPass == false ? true : false,
                  style: const TextStyle(color: Colors.white),
                  validator: Validatorless.multiple([
                    Validatorless.required("Senha Obrigatoria"),
                    Validatorless.min(8, "Senha muito curta")
                  ]),
                  controller: _senhaController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xFF362E4A),
                    filled: true,
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _showPass == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                      onTap: () {
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
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQuery.of(context).size.width / 1.03,
                child: TextFormField(
                  obscureText: _showPass == false ? true : false,
                  style: const TextStyle(color: Colors.white),
                  validator: Validatorless.multiple([
                    Validatorless.required("Campo obrigatorio"),
                    Validatorless.min(8, "Senha muito curta"),
                    ValidatorPass.compare(
                        _senhaController, "As senhas Divergem")
                  ]),
                  controller: _confSenhaController,
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

                    // ignore: prefer_const_constructors
                    label: Text(
                      "Confirme sua senha",
                      style: const TextStyle(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: ElevatedButton(
                child: const Text(
                  "Cadastrar-se",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () async {
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    var init = CadastroRepository();
                    var register = await init.accountRegister(
                      name: _nomeController.text,
                      email: _emailController.text,
                      phone: _telefoneController.text,
                      registry: '',
                      password: _senhaController.text,
                    );
                    if (register['\$error'] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ErrorPage(register)),
                        ),
                      );
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const SuccessPageRegister())));
                    }
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF0DF5E3),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
