import 'package:flutter/cupertino.dart';

class ValidatorPass{
  ValidatorPass._();
  static FormFieldValidator compare(TextEditingController? valueC, String message){
    return (value){
      final valueCompare = valueC?.text ?? '';
      if(value== null || (value != null && value != valueCompare)){
        return message;
      }
      return null;
    };
  }
}