import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class Result_ScreenError extends StatefulWidget {
  //const Result_Screen({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var infos;
  Result_ScreenError(this.infos, {Key? key}) : super(key: key);
  @override
  State<Result_ScreenError> createState() => _Result_ScreenErrorState();
}

// ignore: camel_case_types
class _Result_ScreenErrorState extends State<Result_ScreenError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            widget.infos['\$error']['msg'].toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Result_ScreenSuccess extends StatefulWidget {
  const Result_ScreenSuccess({Key? key}) : super(key: key);

  @override
  State<Result_ScreenSuccess> createState() => _Result_ScreenSuccessState();
}

// ignore: camel_case_types
class _Result_ScreenSuccessState extends State<Result_ScreenSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
      color: Colors.black,
      child:const Center(
        child: Text(
          "Login Efetuado com Sucesso",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    );
  }
}
