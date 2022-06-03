import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool isSwitched = true;
  late double height;
  late double width;
  
  bool status6 = true;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
     centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 19, 224),
        title: Text("Notification"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                  leading: Card(
                    color: Colors.grey.shade200,
                    child: Icon(
                      Icons.notifications,
                      size: 35.0,
                      color:  
        Color.fromARGB(255, 177, 19, 224),
                    ),
                  ),
                  title: Text(
                    "Push Notification",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing:  Container(
                                    height: 60,
                                    width: 70,
                                    child: FlutterSwitch(
                                      width: 65,
                                      height: 30,
                                      showOnOff: true,
                                      activeColor: Colors.white,
                                      inactiveColor: Colors.white,
                                      
                                      activeTextColor: Color.fromARGB(255, 177, 19, 224),
                                      inactiveTextColor: Color.fromARGB(255, 177, 19, 224),
                                      toggleColor: Color.fromARGB(255, 177, 19, 224),
                                      value: status6,
                                      onToggle: (val) {
                                        setState(() {
                                          status6 = val;
                                        });
                                      },
                                    ),
                                  
                                ),
                  ),
            ],
          ),
        ),
      ),
  

    );
  }
}
