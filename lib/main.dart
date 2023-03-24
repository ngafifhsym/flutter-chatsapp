
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: Color(0xFF111E27),
        body:
        Column(
          children: [
            Image(image: AssetImage("images/walet.png")),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 41),
              child: TextField(
              enableInteractiveSelection: true,
              autofocus: true,
              showCursor: true,
              cursorColor: Color(0xFF6D493A),
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF6D493A)
                  )
                ),
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 253, 253, 253)
                  )
                ),
              hintText: "Masukan Email Anda",
              hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              labelText: "Email",
              labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              prefixIcon: Icon(Icons.person),
              prefixIconColor: Color.fromARGB(255, 255, 255, 255)
              ),
              style: TextStyle(
                color: Color(0xFF6D493A)
              ),
                    ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(vertical: 10, horizontal: 41),
              child: TextField(
              obscureText: true,
              
              decoration: new InputDecoration(
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF6D493A)
                  )
                ),
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 253, 253, 253)
                  )
                ),
                border: OutlineInputBorder(),
              hintText: "Masukan Password Anda",
              hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              labelText: "Password",
              labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              prefixIcon: Icon(Icons.key),
              prefixIconColor: Color.fromARGB(255, 255, 255, 255)),
              
              
              style: TextStyle(
                color: Color(0xFF6D493A)
              ),

            
              
                    ),
            ),
          Container(
            width: 200,
            height: 45,
            margin: EdgeInsets.symmetric(vertical: 60),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              backgroundColor: Color(0xFF6D493A)
              ),
              onPressed: () {},
             child: Text("Masuk",
             style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255)
             ),)),
          ),
          Text("Belum Punya Akun ?", style: GoogleFonts.poppins(fontSize: 16,color: Colors.white)),
          TextButton(onPressed: (){},
           child: Text("Register",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),))
          ],
        
        )
        
       
        
        
      ),
    );
  }
}