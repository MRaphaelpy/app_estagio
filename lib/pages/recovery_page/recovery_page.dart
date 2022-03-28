import 'package:app_estagio/pages/recovery_page/result_recovery.dart';
import 'package:app_estagio/repository/http_request_and_post.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Recovery_Page extends StatefulWidget {
  const Recovery_Page({Key? key}) : super(key: key);

  @override
  State<Recovery_Page> createState() => _Recovery_PageState();
}

// ignore: camel_case_types
class _Recovery_PageState extends State<Recovery_Page> {
  var recoveryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201A30),
      appBar: AppBar(
        backgroundColor: const Color(0xFF201A30),
        elevation: 1000,
      ),
      body: ListView(
        children: [
          const SizedBox(
            // width: 300,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Informe o e-mail cadastrado na sua conta, voce ira receber uma nova senha Temporaria.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              width: MediaQuery.of(context).size.width / 1.02,
              child: TextFormField(
                controller: recoveryController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Color(0xFF362E4A),
                  filled: true,
                  label: Text(
                    "Digite seu Email",
                    style: TextStyle(color: Colors.white),
                    //  textAlign: TextAlign.center,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              height: 35,
              child: ElevatedButton(
                onPressed: () async {
                  // ignore: prefer_typing_uninitialized_variables
                  var recoveryPass;
                  setState(
                    () async {
                      var init = RecoveryPassword();
                      recoveryPass = await init.recoveryPassword(
                          email: recoveryController.text);
                      if (recoveryPass['\$error'] != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Result_RecoveryError(recoveryPass)));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Result_Recovery(recoveryPass)));
                      }
                    },
                  );
                },
                child: const Text(
                  "Recuperar",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0DF5E3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
