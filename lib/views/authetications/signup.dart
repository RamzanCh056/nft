import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/instance_manager.dart';
import 'package:nft_app/views/authetications/login.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' ;
 

  class SignUp extends StatefulWidget {
    const SignUp({ Key? key }) : super(key: key);
    
  
    @override
    State<SignUp> createState() => _SignUpState();
  }
  
  class _SignUpState extends State<SignUp> {
  
      final _formKey = GlobalKey<FormState>();
         var email = "";
  var password = "";
  var confirmPassword = "";
  var username = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
   final usernamecontroller = TextEditingController();
  final emailController = TextEditingController();
    final phonenumberController = TextEditingController();
   final telegramController = TextEditingController();
    final whatsappController = TextEditingController();
      final pinController = TextEditingController();
       final uplineController = TextEditingController();
        
   
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernamecontroller.dispose();
    super.dispose();
  }
     
  
     
    @override
 
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.black,
       resizeToAvoidBottomInset: true,
      body: SafeArea(
 
          child: Container(
            
            decoration: BoxDecoration(
               
            ),
            child: Center(
                child: ListView(
              children: [
                SizedBox(height: 40,),
                // Row(
                //   children: [
                //     IconButton(
                //         onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                //     Text(
                //       'Login',
                //       style: TextStyle(
                //           fontSize: 18,
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold),
                //     )
                //   ],
                // ),
                Container(
                   height: 165,
                   width: double.infinity,

                  child: Image.asset('images/logo.png',fit: BoxFit.fill,),
                ),
                SizedBox(height: 60,),
               Form(
                 key: _formKey,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16),
                   child: Column(children: [
                      Container(
                    
                        child:
                         TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                        hintText: "User name",
                        prefixIcon: Icon(Icons.person),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                        //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
                        ),
                      ),
                      controller:usernamecontroller,                     
                          
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            } 
                          },
                        ),
                      ),
                   
                         SizedBox(height: 18,),
                               
                              Container(
                       
                        child:
                         TextFormField(
                       autofocus: false,
                          
                          decoration: InputDecoration(
                      hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                        //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
                        ),
                      ),
                     controller: emailController,
                         validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            } else if (!value.contains('@')) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),
                       SizedBox(height: 18,),
                               
                              Container(
                               
                        child:
                         TextFormField(
                           
                          
                       autofocus: false,
                          
                          decoration: InputDecoration(
                      hintText: "Phone Number",
                        prefixIcon: Icon(Icons.phone),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                         // borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
                        ),
                      ),
                        controller: phonenumberController,
                         validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter phone numer';
                            }
                            return null;
                          },
                        ),
                      ),
                        SizedBox(height: 18,),
                               
                              Container(
                              
                        child:
                         TextFormField(
                          
                       autofocus: false,
                          
                          decoration: InputDecoration(
                      hintText: "Telegram",
                        prefixIcon: Icon(Icons.call_rounded),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                       //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
                        ),
                      ),
                       controller: telegramController,
                         validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Telegram';
                            }
                            return null;
                          },
                        ),
                      ),
                   
                        SizedBox(height: 18,),
                               
                              Container(
                         
                        child:
                         TextFormField(
                          
                       autofocus: false,
                          
                          decoration: InputDecoration(
                      hintText: "Whatsapp",
                        prefixIcon: Icon(Icons.screen_lock_rotation_outlined),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                         // borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
                        ),
                      ),
                        controller: whatsappController,
                         validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter whatsapp number';
                            }
                            return null;
                          },
                        ),
                      ),
                       SizedBox(height: 18,),
                               
                              Container(
                             
                        child:
                         TextFormField(
                          
                       autofocus: false,
                          
                          decoration: InputDecoration(
                      hintText: "Account sequrity/pin Code",
                        prefixIcon: Icon(Icons.remove_red_eye),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                         // borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
                        ),
                      ),
                        controller: pinController,
                         validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Pin';
                            }
                            return null;
                          },
                        ),
                      ),
                         SizedBox(height: 18,),
                               
                              Container(
                      
                        child:
                         TextFormField(
                          
                       autofocus: false,
                          
                          decoration: InputDecoration(
                      hintText: "Upline ID",
                        prefixIcon: Icon(Icons.share),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                         // borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
                        ),
                      ),
                        controller: uplineController,
                         validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Upline id';
                            }
                            return null;
                          },
                        ),
                      ),
                        SizedBox(height: 18,),
                               
                              Container(
                        
                        child:
                         TextFormField(
                          
                       autofocus: false,
                          
                          decoration: InputDecoration(
                      hintText: "Password",
                        prefixIcon: Icon(Icons.remove_red_eye_outlined),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                         // borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
                        ),
                      ),
                        
                        controller: passwordController,
                         validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                        ),
                      ),
                       SizedBox(height: 18,),
                               
                              Container(
                      
                        child:
                         TextFormField(
                          
                       autofocus: false,
                          
                          decoration: InputDecoration(
                      hintText: "Confirm Password",
                        prefixIcon: Icon(Icons.remove_red_eye_outlined),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                         // borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
                        ),
                      ),
                        controller: confirmPasswordController,
                         validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter confirm Password';
                            }
                            return null;
                          },
                        ),
                      ),
                   ],),
                 ),
               ),
              
               SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 130,right: 130),
                  child: MaterialButton(
                      color: Color.fromARGB(255, 177, 19, 224),
                     minWidth: double.infinity,
                        height: 50,
                    shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 177, 19, 224),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                    
                    onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                          //  controller.email = controller.emailController.text;
                          //   controller.password = controller. passwordController.text;
                          //  email = emailController.text;
                          //   password = passwordController.text;
                              });
                             
                              
                              
               
                           
                                
                            }
                                    
                        
                         
                     
                    },
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     
                      
                      children: [
                      Text('Continue', style: TextStyle(color: Colors.white,fontSize: 18),),
                     
                     
                    ],)
                  ),
                ),
                SizedBox(height: 20,),
                Column(children: [
                       AnimatedButton(
              height: 45,
              width: 185,
              text: 'Login',
              isReverse: true,
                selectedBackgroundColor: Color.fromARGB(255, 177, 19, 224),
              selectedTextColor: Colors.black,
              transitionType: TransitionType.TOP_CENTER_ROUNDER,
              
              //  borderColor: Colors.white,
               borderRadius: 50,
               borderWidth: 2,
              onPress: ()async {
                  await Future.delayed(Duration(seconds: 1));
                Get.to(Login(),
                 duration: Duration(seconds: 1), 
                   transition: Transition.leftToRight
                ); },
            ),
            SizedBox(height: 10,),
                ],)
              ],
            )),
          ),
       
      ),
    );
    }
  
  }
