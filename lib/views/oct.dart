// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_switch/flutter_switch.dart';

// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:octbs_ui/controller/api/apiservices.dart';
// import 'package:octbs_ui/screens/users/Octoboss/Issues_market_screen.dart';
// import 'package:octbs_ui/screens/users/Octoboss/octoboss_chatlist_screen.dart';
// import 'package:octbs_ui/screens/users/Octoboss/octoboss_issues_list_screen.dart';
// import 'package:octbs_ui/screens/users/Octoboss/octoboss_membership_screen.dart';
// import 'package:octbs_ui/screens/users/Octoboss/octoboss_notification_screen.dart';
// import 'package:octbs_ui/screens/users/Octoboss/octoboss_profile_scrn.dart';
// import 'package:octbs_ui/screens/users/Octoboss/octoboss_reports_screen.dart';
// import 'package:octbs_ui/screens/users/Octoboss/services_offered_screen.dart';
// import 'package:octbs_ui/screens/users/Octoboss/settings_screen.dart';

// class OctoBossHomeScreen extends StatefulWidget {
//   const OctoBossHomeScreen({Key? key}) : super(key: key);

//   @override
//   State<OctoBossHomeScreen> createState() => _OctoBossHomeScreenState();
// }

// class _OctoBossHomeScreenState extends State<OctoBossHomeScreen> {
//   // final stats = FirebaseFirestore.instance;
//    var status=true;
//   var public_issue='public';

//   bool isSwitch = false;
//   bool? dynamicSwitch;
//   bool isSwitched = false;
//   var textValue = 'Status is OFF';

//   String? announcment;
//   int count = 0;

//   @override
//   Widget build(BuildContext context) {
//     handleSwitch(bool value) {
//       setState(() {
//         isSwitch = value;
//         dynamicSwitch = value;
//       });
//     }

//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     final fontSize = MediaQuery.of(context).textScaleFactor;
//     var toggleSwitch;
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
             
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   OctobossNotificationScreen()));
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //     builder: (ctx) => CustomerNotificationScreen()));
//                     },
//                     icon: Icon(
//                       Icons.notifications,
//                       color: Colors.grey,
//                       size: 30,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Flexible(
//                 flex: 1,
//                 fit: FlexFit.loose,
//                 child: Container(
//                   height: screenHeight * 0.23,
//                   width: double.infinity,
//                   child: Image.asset(
//                     'assets/images/home_logo_new.jpg',
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     SizedBox(height: screenHeight * 0.02),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (ctx) => EditProfilePage()));
//                           },
//                           child: Column(
//                             children: [
//                               OctobossHomeWidget(
//                                 screenHeight: screenHeight,
//                                 icon: Icons.person,
//                                 isToggle: false,
//                               ),
//                               Text(
//                                 'profile'.tr,
//                                 style: TextStyle(
//                                   fontSize: fontSize * 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (ctx) => OctoBossMembershipScreen()));
//                           },
//                           child: Column(
//                             children: [
//                               OctobossHomeWidget(
//                                 icon: Icons.monetization_on,
//                                 screenHeight: screenHeight,
//                                 isToggle: false,
//                               ),
//                               Text(
//                                 'membership'.tr,
//                                 style: TextStyle(
//                                   fontSize: fontSize * 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (ctx) => OctobossSettingsScreen()));
//                           },
//                           child: Column(
//                             children: [
//                               OctobossHomeWidget(
//                                 screenHeight: screenHeight,
//                                 icon: Icons.settings,
//                                 isToggle: false,
//                               ),
//                               Text(
//                                 'settings'.tr,
//                                 style: TextStyle(
//                                   fontSize: fontSize * 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     //
//                     SizedBox(height: screenHeight * 0.02),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (ctx) => OctobossIssuesListScreen()));
//                           },
//                           child: Column(
//                             children: [
//                               OctobossHomeWidget(
//                                 screenHeight: screenHeight,
//                                 icon: Icons.format_list_bulleted_outlined,
//                                 isToggle: false,
//                               ),
//                               Text(
//                                 'job'.tr,
//                                 style: TextStyle(
//                                   fontSize: fontSize * 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (ctx) => OctoBossChatListScreen()));
//                           },
//                           child: Column(
//                             children: [
//                               OctobossHomeWidget(
//                                 screenHeight: screenHeight,
//                                 icon: Icons.message,
//                                 isToggle: false,
//                               ),
//                               Text(
//                                 'chats'.tr,
//                                 style: TextStyle(
//                                   fontSize: fontSize * 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 // ServicesOfferedScreen
//                                 builder: (ctx) => ServicesOfferedScreen()));
//                           },
//                           child: Column(
//                             children: [
//                               Container(
//                                 alignment: Alignment.center,
//                                 height: screenHeight * 0.12,
//                                 width: screenHeight * 0.12,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   // color: Colors.white,
//                                   color: Color(0xffff6e01),
//                                   // borderRadius: BorderRadius.circular(15),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       spreadRadius: 2,
//                                       blurRadius: 5,
//                                       offset: Offset(
//                                           0, 3), // changes position of shadow
//                                     ),
//                                   ],
//                                 ),
//                                 // child: Text(txt),
//                                 child: SvgPicture.asset(
//                                   'assets/svg/business_service.svg',
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Text(
//                                 'services_offered'.tr,
//                                 style: TextStyle(
//                                   fontSize: fontSize * 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     //
//                     SizedBox(height: screenHeight * 0.02),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (ctx) => OctobossReportsScreen()));
//                           },
//                           child: Column(
//                             children: [
//                               OctobossHomeWidget(
//                                 screenHeight: screenHeight,
//                                 icon: Icons.signal_cellular_alt,
//                                 isToggle: false,
//                               ),
//                               Text(
//                                 'report'.tr,
//                                 style: TextStyle(
//                                   fontSize: fontSize * 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (ctx) => IssuesMarket()));
//                           },
//                           child: Column(
//                             children: [
//                               OctobossHomeWidget(
//                                 screenHeight: screenHeight,
//                                 icon: Icons.search,
//                                 isToggle: false,
//                               ),
//                               Text(
//                                 'issues'.tr,
//                                 style: TextStyle(
//                                   fontSize: fontSize * 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             // FutureBuilder(
//                             //     future: checkLEDStatus(),
//                             //     builder: (context, snapshot) {
//                             //       if (snapshot.connectionState ==
//                             //           ConnectionState.done) {
//                             //         bool result = snapshot.data as bool;
//                             //         return Switch(
//                             //             value: result,
//                             //             onChanged: (bool newVal) {
//                             //               setState(() => result = newVal);
//                             //               updateLED(newVal);
//                             //             });
//                             //       } else {
//                             //         return Center(
//                             //             child: CircularProgressIndicator());
//                             //       }
//                             //     }),
//                             Container(
//                               alignment: Alignment.center,
//                               height: screenHeight * 0.12,
//                               width: screenHeight * 0.12,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 // color: Colors.white,
//                                 color: Color(0xffff6e01),
//                                 // borderRadius: BorderRadius.circular(15),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: Offset(
//                                         0, 3), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child:FlutterSwitch(
//                         width: 105.0,
//                         height: 35.0,
//                         valueFontSize: 15.0,
//                         toggleSize: 45.0,
//                         value: status,
//                         inactiveColor: Colors.grey.withOpacity(0.5),
//                         activeColor: Color(0xffff6e01),
//                         borderRadius: 30.0,
//                         padding: 8.0,
//                         showOnOff: true,
//                         onToggle: (val) {
//                           setState(() {
//                             status = val;
//                             if(status){
//                               public_issue='Status On';
//                             }
//                             else{
//                               public_issue='Status Off';
//                             }
//                             ApiServices().statusActive(public_issue.toString());
//                           }); 
//                         },
//                       ),
                    
//                             ),
//                             Text(
//                               '$public_issue',
//                               style: TextStyle(fontSize: 14),
//                             )
//                             // OctobossHomeWidget(
//                             //   screenHeight: screenHeight,
//                             //   icon: Icons.toggle_off,
//                             //   isToggle: true,
//                             // ),
//                             // Text(
//                             //   'status'.tr,
//                             //   style: GoogleFonts.montserrat(
//                             //     fontSize: fontSize * 15,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OctobossHomeWidget extends StatefulWidget {
//   OctobossHomeWidget({
//     Key? key,
//     required this.screenHeight,
//     // required this.txt,
//     required this.icon,
//     required this.isToggle,
//   }) : super(key: key);

//   final double screenHeight;

//   // String txt;
//   IconData icon;
//   bool isToggle = false;

//   @override
//   State<OctobossHomeWidget> createState() => _OctobossHomeWidgetState();
// }

// class _OctobossHomeWidgetState extends State<OctobossHomeWidget> {
//   var _val = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       height: widget.screenHeight * 0.12,
//       width: widget.screenHeight * 0.12,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         // color: Colors.white,
//         color: Color(0xffff6e01),
//         // borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//       ),
//       // child: Text(txt),
//       child: !widget.isToggle
//           ? Icon(
//               widget.icon,
//               color: Colors.white,
//               size: widget.screenHeight * 0.05,
//             )
//           : Switch(
//               //activeColor: Colors.green,
//               value: _val,
//               onChanged: (value) {
//                 _val = value;
//               },
//             ),
//     );
//   }
// }
