import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _formKey1 = GlobalKey<FormState>();
    late double height;
  late double width;
  bool checkedValue = true;
  bool checkedValuetwo = true;
   
   Future<void> showInformationDialogtwo(BuildContext context) async {
    return await showDialog(context: context,
    builder: (context){
     
      bool isChecked = false;
      return StatefulBuilder(builder: (context,setState){
        return AlertDialog(
          backgroundColor:  Color(0xff17181A),
          content: SingleChildScrollView(
            child: Column(
              children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   GestureDetector(
                                        onTap: (){ Navigator.of(context).pop();},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
      });
    }
    );
}
  @override
  Widget build(BuildContext context) {
      height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 165,
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
                style: TextStyle(color: Colors.white, fontSize: 28),
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
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                          hintText: "2022-05-27 21:12:24",
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
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Username',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                          hintText: "ramzan",
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
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Email Address',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                          hintText: "ramzanch02@gmail.com",
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
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Telegram',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                          hintText: "Enter Telegram Account",
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
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Whatsapp',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                          hintText: "Enter whatsapp number",
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
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'Phone Number',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                          hintText: "03023323232",
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
                    SizedBox(
                      height: 18,
                    ),
                    Row(children: [
                      Text(
                        'New Password',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                color: Colors.blue[300],
                onPressed: () {
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
                style: TextStyle(color: Colors.white, fontSize: 18),
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
                  color: Colors.blue[800],
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
