import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/credentials/login.dart';

import '../categories/products.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}
TextEditingController userController=TextEditingController();
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
bool isVisible=false;
class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body:  Form(
autovalidateMode: AutovalidateMode.always,
          key: _globalKey,
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
            SizedBox(
              width: 400,
              child: TextFormField(
                validator:(userValue) {
                  if (userValue!.isEmpty) {
                    return "the field is required";
                  }
                  return null;
                },
                controller: userController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,size: 30,),
                  label: Text("Username",style: GoogleFonts.arima(
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
                   validator: (emailvalue){
                     if(emailvalue!.isEmpty){
                       return "the field is empty";
                     }
                    else if(emailvalue.contains('@')&&emailvalue.endsWith('com')){
                return null;
                  }
                  return "please enter a valid email";

                   },
                   controller: emailController,
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
                   validator: (passwordValue){
                     if(passwordValue!.isEmpty){
                       return "the field is empty";
                     }
                     else if(passwordValue.length<5){
                       return "more than 4 characters are required";
                     }
                     return null;
                   },
                   controller: passwordController,
                   obscureText: isVisible,
                   decoration: InputDecoration(
                     suffixIcon: GestureDetector(
                       onTap: (){
                         setState(() {
                           setState(() {
                             isVisible=!isVisible;
                           });
                         });
                       },
                       child: isVisible?const Icon(Icons.visibility_off_outlined):
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
                 if(_globalKey.currentState!.validate()){
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
                   child: Text("Sign up",style: GoogleFonts.arima(
                     fontSize: 26,
                          color: Colors.black
                   ),),
               ),
               Row(
                 children: [
                   Text("Already have an account?",
                     style: GoogleFonts.arima(
                       fontSize: 24,
                     ),),
                   TextButton(onPressed: (){
                     Get.to(const Login(),transition: Transition.rightToLeftWithFade,
                     duration:const Duration(seconds:1 )
                     );
                   },
                       child: Text("Login",style: GoogleFonts.arima(
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
