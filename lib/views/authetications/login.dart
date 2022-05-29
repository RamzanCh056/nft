
import 'package:flutter/material.dart';

import 'package:nft_app/views/authetications/signup.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:nft_app/views/navigation_bar/navigation.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);
  

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

    final _formKey = GlobalKey<FormState>();
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
                SizedBox(height: 70,),
               Form(
                 key: _formKey,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16),
                   child: Column(children: [
                      Container(
                        height: 50,
                        child:
                         TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
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
                     // controller:controller. emailController,
                     
                          
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
                        height: 50,
                        child:
                         TextFormField(
                       autofocus: false,
                           obscureText: true,
                          decoration: InputDecoration(
                      hintText: "Password",
                        prefixIcon: Icon(Icons.visibility),
                        hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(),
                         errorStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
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
                        // controller:controller. passwordController,
                       // controller: passwordController,
                         validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
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
                  padding: const EdgeInsets.only(left: 120,right: 120),
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
                  Get.to(MaterialYou());

                //             if (_formKey.currentState!.validate()) {
                //               setState(() {
                //            controller.email = controller.emailController.text;
                //             controller.password = controller. passwordController.text;
                //           //  email = emailController.text;
                //           //   password = passwordController.text;
                //               });
                             
                              
                              
                //  controller.userLogin(context);
                           
                                
                //             }
                                    
                          //   controller.emailController.clear();
                          //  controller.passwordController.clear();
                         
                     
                    },
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     
                      
                      children: [
                      Text('Login', style: TextStyle(color: Colors.white,fontSize: 18),),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward, color: Colors.white,)
                    ],)
                  ),
                ),
                SizedBox(height: 20,),
                Column(children: [
                       AnimatedButton(
              height: 45,
              width: 185,
              text: 'Register',
              isReverse: true,
              selectedBackgroundColor: Color.fromARGB(255, 177, 19, 224),
              selectedTextColor: Colors.black,
              transitionType: TransitionType.TOP_CENTER_ROUNDER,
              
              //  borderColor: Colors.white,
               borderRadius: 50,
               borderWidth: 2,
              onPress: () async{ 
                await Future.delayed(Duration(seconds: 1));
                  Get.to(SignUp(),
                   duration: Duration(seconds: 1),
                   transition: Transition.zoom 
                  );
                  
                },
            ),
                ],)
              ],
            )),
          ),
       
      ),
    );
  }
}