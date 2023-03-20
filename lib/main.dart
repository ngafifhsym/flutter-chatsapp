

import 'package:flutter/material.dart';

void main(){
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        Center(
          child: Image(image: AssetImage("assetName")),
        )
        
        
      ),
    );
  }
}