import 'dart:convert';

import 'package:http/http.dart' as http;
class CadastroRepository{
  accountRegister({ required String name,required String email, required String phone,required String registry,required  String password}) async{
    String token = "00000000-0000-0000-0000-000000000001";
    var url = Uri.parse("https://api.remote.net.br/user/app");
    var response = await http.post(url, headers: {
      "security-token":token,
    },
    body: {
      "name": name,
      "email":email,
      "phone":phone,
      "registry":registry,
      "password":password
    }
    );
    var jsonFinal = jsonDecode(response.body);
    return jsonFinal;
  }
}

class LoginRepository{
  accountLogin(String name, String password) async{
  String token = "00000000-0000-0000-0000-000000000001";
  var url = Uri.parse("https://api.remote.net.br/user/app/login");
  var response = await http.post(url, headers: {
     "security-token":token,
  }, body: {
     
    "email":name,
    "password":password,
  
  },);
  var jsonFinal = jsonDecode(response.body);
  return jsonFinal;
  }
}

class RecoveryPassword{
  recoveryPassword({required String email})async{
    String token = "";
    var url = Uri.parse("https://api.remote.net.br/user/reset");
    var response = await http.post(url, headers: {
      "security-token":token
    },
    body: {
      "email":email
    },
    );
    var  jsonFinal = jsonDecode(response.body);
    return jsonFinal;
  }
}