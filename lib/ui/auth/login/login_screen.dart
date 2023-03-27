import 'package:chatapp/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login-page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF111E27),
        body:
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const Image(image: AssetImage("assets/images/waletlogo.png"), width: 200, height: 200,),
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
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, HomePage.routeName);
                      },
                      child: Text("Masuk",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)
                        ),)),
                ),
                Text("Belum Punya Akun ?", style: GoogleFonts.poppins(fontSize: 16,color: Colors.white)),
                TextButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, HomePage.routeName);
                },
                    child: Text("Register",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),))
              ],

            ),
          ),
        )

    );
  }
}
