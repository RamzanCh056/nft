import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:nft_app/controller/constraints.dart';

import 'package:nft_app/views/navigation_bar/navigation.dart';

class Depositmoney extends StatefulWidget {
  const Depositmoney({ Key? key }) : super(key: key);

  @override
  State<Depositmoney> createState() => _DepositmoneyState();
}

class _DepositmoneyState extends State<Depositmoney> {

  var sendMoneyController=TextEditingController();
  var amount=0.obs;
  var gasVisibility=false.obs;
  var minVisibility=false.obs;
  var maxVisibility=false.obs;

  depositMoney(var paisa) async {
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
        'deposit': '',
        'create':'',
        'amount':'${paisa}',
      },
    );
    var data2 = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      var status=int.parse(data2['status']);
      if (status== 200) {
        print("api is hit on login");
        Get.snackbar(
          "Amount Deposit Successfully",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Color.fromARGB(255, 177, 19, 224),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
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
          colorText: Color.fromARGB(255, 177, 19, 224),
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
        colorText: Color.fromARGB(255, 177, 19, 224),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: HexColor("#D4F1F4"),
      appBar: AppBar(
        title: Text("Deposit money"),
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
          
            Center(
              child: Text(
                'Deposit Money',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Send Amount',
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
                  controller: sendMoneyController,
                  onChanged: (val){
                    if(sendMoneyController.text==''){
                      amount.value=0;
                      gasVisibility.value=false;
                      minVisibility.value=false;
                      maxVisibility.value=false;
                    }
                    var money=int.parse(sendMoneyController.text);

                    amount.value=money-1;
                    gasVisibility.value=true;
                    minVisibility.value=true;
                    maxVisibility.value=false;
                    if(money>100){
                      minVisibility.value=false;
                    }
                    if(money>1000000){
                      maxVisibility.value=true;
                    }
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
           Column(children: [
               Row(
              children: [
                  Container(
                height: 22,width: 22,
                 child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                 SizedBox(width: 2,),
                Obx(() => Text(
                  '${amount.obs}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),)

              ],
            ),
               Obx(() => Visibility(
                 visible: gasVisibility.value,
                 child: Row(
                   children: [
                     Text(
                       'Get fee',
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                     ),
                     SizedBox(width: 2,),
                     Container(
                         height: 22,width: 22,
                         child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                     SizedBox(width: 2,),
                     Text(
                       '1',
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                     )
                   ],
                 ),
               )),
               Obx(() => Visibility(
                 visible: minVisibility.value,
                 child: Row(
                   children: [
                     Text(
                       'Min:',
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                     ),
                     SizedBox(width: 2,),
                     Container(
                         height: 22,width: 22,
                         child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                     SizedBox(width: 2,),
                     Text(
                       '100',
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                     )
                   ],
                 ),
               )),
               Obx(() => Visibility(
                 visible: maxVisibility.value,
                 child: Row(
                   children: [
                     Text(
                       'Max:',
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                     ),
                     SizedBox(width: 2,),
                     Container(
                         height: 22,width: 22,
                         child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                     SizedBox(width: 2,),
                     Text(
                       '1000000',
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                     )
                   ],
                 ),
               )),

           ],),
            
            
            SizedBox(
              height: 35,
            ),
            MaterialButton(
              color: Color.fromARGB(255, 177, 19, 224),
              onPressed: () {
                var value=int.parse(sendMoneyController.text);
                if(sendMoneyController.text!='' && value>=100 && value<=1000000)
                  {
                    depositMoney(sendMoneyController.text);
                  }
              },
              child: Text(
                'Generate Deposit',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 15,
            ),
         
          ],
        ),
      ),
    );
  }
}