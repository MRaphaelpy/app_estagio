import 'package:app_estagio/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class Result_Recovery extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var infos;
  Result_Recovery(this.infos, {Key? key}) : super(key: key);
  @override
  State<Result_Recovery> createState() => _Result_RecoveryState();
}

// ignore: camel_case_types
class _Result_RecoveryState extends State<Result_Recovery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201A30),
      appBar: AppBar(
        backgroundColor: const Color(0xFF201A30),
        elevation: 1000,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  widget.infos['\$success']['msg'].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0DF5E3),
                ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const Login_Page()),
                ),
              );
            },
            child: const Text("Voltar", style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class Result_RecoveryError extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var infos;
  Result_RecoveryError(this.infos, {Key? key}) : super(key: key);

  @override
  State<Result_RecoveryError> createState() => _Result_RecoveryErrorState();
}

// ignore: camel_case_types
class _Result_RecoveryErrorState extends State<Result_RecoveryError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201A30),
      appBar: AppBar(
        backgroundColor: const Color(0xFF201A30),
        elevation: 1000,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              widget.infos['\$error']['msg'].toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0DF5E3),
                ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Voltar", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),),
          ),
        ],
      ),
    );
  }
}
