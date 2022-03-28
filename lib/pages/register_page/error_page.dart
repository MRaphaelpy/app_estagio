import 'package:app_estagio/pages/recovery_page/recovery_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ErrorPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var infos;
  ErrorPage(this.infos, {Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            widget.infos['\$error']['msg'].toString(),
            style: const TextStyle(color: Colors.white),
          )),
          Center(
              child: Text(
            widget.infos['\$error']['info'].toString(),
            style: const TextStyle(color: Colors.white),
          )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const Recovery_Page())));
            },
            child: const Text("Recuperar"),
          ),
        ],
      ),
    );
  }
}

class SuccessPageRegister extends StatelessWidget {
  const SuccessPageRegister({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text("Cadastro Efetuado com Sucesso", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

// ssssss@gmail.com