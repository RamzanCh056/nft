import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nft_app/controller/constraints.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final openingController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final telegramController = TextEditingController();
  final whatsappController = TextEditingController();
  final phonenoController = TextEditingController();
  final newpasswordController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  ProfileUpdated(
    String username,
    String password,
    String account_opening_setting,
    String email,
    String telegram,
    String whatsapp,
    String phone_number,
  ) async {
    var auth = "HSYE683H38S";
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/',
      ),
      body: {
        'name': username,
        'password': password,
        'email': email,
        'telegram': telegram,
        'whatsapp': whatsapp,
        'phone': phone_number,
        'logged': '$loginToken',
        "auth": "$auth",
        "profile": '',
        "update": ""
      },
    );
    var data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var status = int.parse(data2['status']);
      if (status == 200) {
        loginToken = data2['message'];
        print("api is hit on profile$data2");
        Get.snackbar(
          "",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.green,
          messageText: Text(
            "Updated successfully",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );

        // Get.to(MaterialYou());
      } else {
        print(response.reasonPhrase);
        print("api not hit on profile$data2");
        Get.snackbar(
          "${data2['message']}",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.red,
          messageText: Text(
            "Wrong Data",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    } else {
      Get.snackbar(
        "Internal Server Issue",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.red,
        messageText: Text(
          "",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  ProfileSeting() async {
    var auth = "HSYE683H38S";
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/',
      ),
      body: {
        "logged": "$loginToken",
        "auth": "$auth",
        "profile": '',
      },
    );
    var data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var status = int.parse(data2['status']);
      if (status == 200) {
        ProfileSetting = data2['message'];
        print("api is hit on dashboard");
      } else {
        print(response.reasonPhrase);
        print("api not hit on login$data2");
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: HexColor("#D4F1F4"),
     appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 19, 224),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Container(
              height: 140,
              width: double.infinity,
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Change Profile Information',
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Row(children: [
                      Text(
                        'Account Opening Date',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: ProfileSeting(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            // height: 50,/
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText:
                                    "${ProfileSetting["account_opening_date"]}",
                                // prefixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              controller: openingController,

                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please Enter Email';
                              //   } else if (!value.contains('@')) {
                              //     return 'Please Enter Valid Email';
                              //   }
                              //   return null;
                              // },
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Username',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: ProfileSeting(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            // height: 50,/
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "${ProfileSetting["username"]}",
                                // prefixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              controller: nameController,

                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please Enter Email';
                              //   } else if (!value.contains('@')) {
                              //     return 'Please Enter Valid Email';
                              //   }
                              //   return null;
                              // },
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Email Address',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: ProfileSeting(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            // height: 50,/
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "${ProfileSetting["email"]}",
                                // prefixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              controller: emailController,

                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please Enter Email';
                              //   } else if (!value.contains('@')) {
                              //     return 'Please Enter Valid Email';
                              //   }
                              //   return null;
                              // },
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Telegram',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: ProfileSeting(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            // height: 50,/
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "${ProfileSetting["telegram"]}",
                                // prefixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              controller: telegramController,

                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please Enter Email';
                              //   } else if (!value.contains('@')) {
                              //     return 'Please Enter Valid Email';
                              //   }
                              //   return null;
                              // },
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Whatsapp',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: ProfileSeting(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            // height: 50,/
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "${ProfileSetting["whatsapp"]}",
                                // prefixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              controller: whatsappController,

                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please Enter Email';
                              //   } else if (!value.contains('@')) {
                              //     return 'Please Enter Valid Email';
                              //   }
                              //   return null;
                              // },
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Phone Number',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: ProfileSeting(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            // height: 50,/
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "${ProfileSetting["phone"]}",
                                // prefixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              controller: phonenoController,

                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please Enter Email';
                              //   } else if (!value.contains('@')) {
                              //     return 'Please Enter Valid Email';
                              //   }
                              //   return null;
                              // },
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'New Password',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // height: 50,/
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "New Password",
                          // prefixIcon: Icon(Icons.email),
                          hintStyle: TextStyle(),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                        controller: newpasswordController,

                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please Enter Email';
                        //   } else if (!value.contains('@')) {
                        //     return 'Please Enter Valid Email';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(children: [
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                color:     Color.fromARGB(255, 177, 19, 224),
                onPressed: () {
                  ProfileUpdated(
                      nameController.text.toString(),
                      openingController.text.toString(),
                      emailController.text,
                      telegramController.toString(),
                      whatsappController.text,
                      phonenoController.text.toString(),
                      newpasswordController.text.toString());
                  // _showMyDialog();
                  showInformationDialogtwo(context);
                },
                child: Text(
                  'Change',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
            SizedBox(
              height: 18,
            ),
            Row(children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Forgot Security code?',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  color:     Color.fromARGB(255, 177, 19, 224),
                  onPressed: () {},
                  child: Text(
                    'Send security code to my email',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        )),
      ),
    );
  }

  Future<void> showInformationDialogtwo(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xff17181A),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.clear,
                                color: Colors.grey.shade200,
                                size: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Security Code',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            // height: 50,/
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "Security Code",
                                // prefixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              // controller:controller. emailController,

                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please Enter Email';
                              //   } else if (!value.contains('@')) {
                              //     return 'Please Enter Valid Email';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      color: Colors.blue[300],
                      onPressed: () {
                        // _showMyDialog();
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Verify',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black54,
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Security Code',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // height: 50,/
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "Security Code",
                            // prefixIcon: Icon(Icons.email),
                            hintStyle: TextStyle(),
                            border: OutlineInputBorder(),
                            errorStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          // controller:controller. emailController,

                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please Enter Email';
                          //   } else if (!value.contains('@')) {
                          //     return 'Please Enter Valid Email';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  color: Colors.blue[300],
                  onPressed: () {
                    // _showMyDialog();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}