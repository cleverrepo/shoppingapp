import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/credentials/signup.dart';

import '../categories/products.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
bool isOpen=false;
TextEditingController _controller=TextEditingController();
TextEditingController controller=TextEditingController();
GlobalKey<FormState> _key=GlobalKey<FormState>();
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        autovalidateMode: AutovalidateMode.always,
        key: _key,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                width: 400,
                child: TextFormField(
                  validator: (mailvalue){
                    if(mailvalue!.isEmpty){
                      return "the field is empty";
                    }
                    else if(mailvalue.contains('@')&&mailvalue.endsWith('com')){
                      return null;
                    }
                    return "please enter a valid email";

                  },
                  controller: controller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.mail_outline_outlined,size: 30,),
                      label: Text("Email",style: GoogleFonts.arima(
                        fontSize: 23,
                      ),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  validator: (passdValue){
                    if(passdValue!.isEmpty){
                      return "the field is empty";

                    }
                    else if(passdValue.length<5){
                      return "more than 4 characters are required";
                    }
                    return null;
                  },
                  controller: _controller,
                  obscureText: isOpen,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            setState(() {
                              isOpen=!isOpen;
                            });
                          });
                        },
                        child: isOpen?const Icon(Icons.visibility_off_outlined):
                        const   Icon(Icons.visibility),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,size: 30,),
                      label: Text("Password",style: GoogleFonts.arima(
                        fontSize: 23,
                      ),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),
              OutlinedButton(onPressed: (){
                if(_key.currentState!.validate()){
                  Get.to(const Pruducts(),
                      duration: const Duration(seconds: 1),
                      transition: Transition.rightToLeftWithFade);
                }
              },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26)
                  ),
                  backgroundColor: Colors.deepOrangeAccent[700],
                ),
                child: Text("Login",style: GoogleFonts.arima(
                    fontSize: 26,
                    color: Colors.black
                ),),
              ),
              Row(
                children: [
                  Text("Don't have an account?",
                    style: GoogleFonts.arima(
                      fontSize: 24,
                    ),),
                  TextButton(onPressed: (){
                    Get.to(const Signup(),transition: Transition.rightToLeftWithFade,
                        duration:const Duration(seconds:1 )
                    );
                  },
                    child: Text("Sign up",style: GoogleFonts.arima(
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5

                    )

                    ),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
