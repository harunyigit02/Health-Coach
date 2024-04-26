import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';


class SignUpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage>{

  final email_controller=TextEditingController();
  final password_controller=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 100,
                ),
                Text(
                  "Welcome",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Create your account ",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 20,),


                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: email_controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: password_controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: password_controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confirm password",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondPage()));
                  },
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurple[700],
                      ),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are you a member? "
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SecondPage()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],



                ),



              ],
            ),
          ),
        ),
      ),
    );

  }
}