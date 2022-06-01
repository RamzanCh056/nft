import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:nft_app/views/navigation_bar/navigation.dart';

import 'package:nft_app/views/screens/deposit_money.dart';
import 'package:nft_app/views/screens/drawer.dart';
import 'package:http/http.dart' as http;

import '../../controller/constraints.dart';

class DepositWithdraw extends StatefulWidget {
  DepositWithdraw({Key? key}) : super(key: key);

  @override
  State<DepositWithdraw> createState() => _DepositWithdrawState();
}

class _DepositWithdrawState extends State<DepositWithdraw> {
  final GlobalKey<ScaffoldState> _scaffoldKey4 = GlobalKey<ScaffoldState>();
  var amountController=TextEditingController();
  var addressController=TextEditingController();
  var processingFee=0.obs;
  var receiveAmount=0.obs;


  insertAddress() async {
    // var data = {'username': username, 'password': password};
    var auth="HSYE683H38S";
    // var data1 = json.encode(data);
    var response = await http.post(
      Uri.parse(
        'http://mining-nfts.com/api/',
      ),
      body: {
        'auth': 'HSYE683H38S',
        'logged': '$loginToken',
        'withdraw': '',
        'usdtAddress':'',
      },
    );
    var data2 = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      var status=int.parse(data2['status']);
      if (status== 200) {
        print("api is hit on login");
        previousAddress=data2['message'];
        addressController.text=data2['message'];
        // Get.snackbar(
        //   "${data2['message']}",
        //   "",
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.black,
        //   borderRadius: 20,
        //   margin: EdgeInsets.all(15),
        //   colorText: Colors.red,
        //   messageText: Text(
        //     "Wrong credential",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   duration: Duration(seconds: 4),
        //   isDismissible: true,
        //   forwardAnimationCurve: Curves.easeOutBack,
        // );
        // Get.snackbar(
        //   "",
        //   "",
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.black,
        //   borderRadius: 20,
        //   margin: EdgeInsets.all(15),
        //   colorText: Colors.green,
        //   messageText: Text(
        //     "Login successfully",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   duration: Duration(seconds: 4),
        //   isDismissible: true,
        //   forwardAnimationCurve: Curves.easeOutBack,
        // );

        Get.to(MaterialYou());
      } else {
        print(response.reasonPhrase);
        print("api not hit on login= $data2");
        Get.snackbar(
          "${data2['message']}",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.red,
          messageText: Text(
            "Wrong credential",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    }
    else{
      Get.snackbar(
        "Internal Server Issue",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.red,
        messageText: Text(
          "Wrong credential",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );

    }


    // if (response == 201) {

    //   // print(await response.stream.bytesToString());

    //   print("api is hit on login");
    //   Get.snackbar(
    //     "",
    //     "",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.black,
    //     borderRadius: 20,
    //     margin: EdgeInsets.all(15),
    //     colorText: Colors.green,
    //     messageText: Text(
    //       "Login successfully",
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     duration: Duration(seconds: 4),
    //     isDismissible: true,
    //     forwardAnimationCurve: Curves.easeOutBack,
    //   );

    //   Get.to(MaterialYou());
    // } else {
    //   print(response.reasonPhrase);
    //   print("api not hit on login");
    // Get.snackbar(
    //   "Wrong",
    //   "",
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.black,
    //   borderRadius: 20,
    //   margin: EdgeInsets.all(15),
    //   colorText: Colors.red,
    //   messageText: Text(
    //     "Wrong credential",
    //     style: TextStyle(color: Colors.white),
    //   ),
    //   duration: Duration(seconds: 4),
    //   isDismissible: true,
    //   forwardAnimationCurve: Curves.easeOutBack,
    // );
    // }
  }

  withdrawUSDT(var amount, var number) async {
    // var data = {'username': username, 'password': password};
    var auth="HSYE683H38S";
    // var data1 = json.encode(data);
    var response = await http.post(
      Uri.parse(
        'http://mining-nfts.com/api/',
      ),
      body: {
        'auth': 'HSYE683H38S',
        'logged': '$loginToken',
        'withdraw': '',
        'save_request':'',
        'amount':'${amount}',
        'number':'${number}',
      },
    );
    var data2 = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      var status=int.parse(data2['status']);
      if (status== 200) {
        print("api is hit on login");
        // previousAddress=data2['message'];
        // addressController.text=data2['message'];
        // Get.snackbar(
        //   "${data2['message']}",
        //   "",
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.black,
        //   borderRadius: 20,
        //   margin: EdgeInsets.all(15),
        //   colorText: Colors.red,
        //   messageText: Text(
        //     "Wrong credential",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   duration: Duration(seconds: 4),
        //   isDismissible: true,
        //   forwardAnimationCurve: Curves.easeOutBack,
        // );
        // Get.snackbar(
        //   "",
        //   "",
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.black,
        //   borderRadius: 20,
        //   margin: EdgeInsets.all(15),
        //   colorText: Colors.green,
        //   messageText: Text(
        //     "Login successfully",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   duration: Duration(seconds: 4),
        //   isDismissible: true,
        //   forwardAnimationCurve: Curves.easeOutBack,
        // );

        Get.to(MaterialYou());
      } else {
        print(response.reasonPhrase);
        print("api not hit on login= $data2");
        Get.snackbar(
          "${data2['message']}",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.red,
          messageText: Text(
            "Wrong credential",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    }
    else{
      Get.snackbar(
        "Internal Server Issue",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.red,
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );

    }


    // if (response == 201) {

    //   // print(await response.stream.bytesToString());

    //   print("api is hit on login");
    //   Get.snackbar(
    //     "",
    //     "",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.black,
    //     borderRadius: 20,
    //     margin: EdgeInsets.all(15),
    //     colorText: Colors.green,
    //     messageText: Text(
    //       "Login successfully",
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     duration: Duration(seconds: 4),
    //     isDismissible: true,
    //     forwardAnimationCurve: Curves.easeOutBack,
    //   );

    //   Get.to(MaterialYou());
    // } else {
    //   print(response.reasonPhrase);
    //   print("api not hit on login");
    // Get.snackbar(
    //   "Wrong",
    //   "",
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.black,
    //   borderRadius: 20,
    //   margin: EdgeInsets.all(15),
    //   colorText: Colors.red,
    //   messageText: Text(
    //     "Wrong credential",
    //     style: TextStyle(color: Colors.white),
    //   ),
    //   duration: Duration(seconds: 4),
    //   isDismissible: true,
    //   forwardAnimationCurve: Curves.easeOutBack,
    // );
    // }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
     // backgroundColor: HexColor("#D4F1F4"),
      appBar: AppBar(
        title: Text("Deposit/Withdraw"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 19, 224),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Color.fromARGB(255, 177, 19, 224),
                  onPressed: () {
                    Get.to(Depositmoney());
                  },
                  child: Text(
                    'Deposit Money',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                MaterialButton(
                  color: Color.fromARGB(255, 177, 19, 224),
                  onPressed: () {},
                  child: Text(
                    'Withdraw',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'Withdraw',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Amount',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.grey,
                    // border: Border.all(width: 2,color: Colors.)
                    ),
                child: TextFormField(
                  autofocus: false,
                  controller: amountController,
                  onChanged: (val){
                    if(val.isEmpty){
                      processingFee.value=0;
                    }
                    processingFee.value=int.parse(val);
                    },
                  decoration: InputDecoration(
                    hintText: 'USDT',
                    fillColor: Colors.grey[300],
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                  // controller:controller. emailController,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'USDT Address (TRC20)',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.grey,
                    // border: Border.all(width: 2,color: Colors.)
                    ),
                child: TextFormField(
                  autofocus: false,
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: 'USDT Address (TRC20)',
                    fillColor: Colors.grey[300],
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                  // controller:controller. emailController,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  color: Color.fromARGB(255, 177, 19, 224),
                  onPressed: () {
                    insertAddress();
                  },
                  shape: StadiumBorder(),
                  child: Text(
                    'Insert previous address',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Text(
                  'Processing Fee',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Obx(() =>  Text(
                  (processingFee.value==0 || amountController=="")?'5%':'${processingFee.value*0.05}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),)

              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'You will receive',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Obx(() => Text(
                  '${processingFee.value*0.95}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),)

              ],
            ),
            SizedBox(
              height: 35,
            ),
            MaterialButton(
              color: Color.fromARGB(255, 177, 19, 224),
              onPressed: () {
                if(amountController.text!="" && addressController.text!=""){
                  withdrawUSDT(amountController.text, addressController.text);
                }
                else{
                  Get.snackbar(
                    "Kindly, put your Amount & Address",
                    "",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.black,
                    borderRadius: 20,
                    margin: EdgeInsets.all(15),
                    colorText: Colors.red,
                    duration: Duration(seconds: 4),
                    isDismissible: true,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );

                }

              },
              child: Text(
                'Buy a NFT First',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'All payments are processed every day between 09:00 -13:00 NY time (GMT-4). Make sure that the address you entered is valid and you own it, payments are not reversible.If you have not entered the correct USDT address your payment will be lost.',
                      style: TextStyle(
                          color: Colors.white,
                          // fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
