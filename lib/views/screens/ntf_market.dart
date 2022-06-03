import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:nft_app/views/navigation_bar/navigation.dart';

import '../../controller/constraints.dart';


class NTFMarket extends StatefulWidget {
  NTFMarket({Key? key}) : super(key: key);

  @override
  State<NTFMarket> createState() => _NTFMarketState();
}

class _NTFMarketState extends State<NTFMarket> {

  var isVisible=true;
  var ind;
  late Future nftMarket;

  getNftMarket() async {
    // var data = {'username': username, 'password': password};
    var auth="HSYE683H38S";
    // var data1 = json.encode(data);
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/',
      ),
      body: {
        'auth': 'HSYE683H38S',
        'logged': '$loginToken',
        'market': ''
      },
    );
    var data2 = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      var status=int.parse(data2['status']);
      if (status== 200) {
        marketData=data2['message'];
        print("api is hit on login");
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
        print("api not hit on login$data2");
        Get.snackbar(
          "${data2['message']}",
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

  purchaseNft(int id) async {
    // var data = {'username': username, 'password': password};
    var auth="HSYE683H38S";
    // var data1 = json.encode(data);
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/?purchaseNFT=&id=${id.toString()}',
      ),
      body: {
        'auth': 'HSYE683H38S',
        'logged': '$loginToken',
        'purchaseNFT': '',
        'market':'',
        'id': '${id.toString()}',
      },
    );
    var data2 = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      var status=int.parse(data2['status']);
      if (status== 200) {
        print("api is hit on login");
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
            "",
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


  @override
  void initState() {
    nftMarket=getNftMarket();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: Column(
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
            height: 55,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey,
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: ,
          //   ),
          // )
            FutureBuilder(
              // future: getNftMarket(),
              future: nftMarket,
              builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              else{
                return Container(
                  child: ListView.builder(
                    itemCount: marketData.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {

                      print(marketData);
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                                Text(
                                  'NFT',
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                  Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                                          SizedBox(width: 3,),
                                Text(
                                  marketData[index]['price'].toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              // child: Container(
                              //   height: 250,
                              //   color: Colors.amber,
                              //   // child: Image.asset(''),
                              // ),
                              child: Image.network('https://mining-nfts.com/uploads/${marketData[index]['img']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  print('Index : $ind');
                                  setState(() {
                                    isVisible = !isVisible;
                                    ind=index;
                                  });
                                },
                                child: Container(
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.purple,
                                        borderRadius: BorderRadius.circular(12)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.monetization_on,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Show profits based on level',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                              ),
                            ),

                            Visibility(
                              visible: (isVisible && ind==index),
                              // maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Container(
                                width: 300,
                                // height: 150,
                                color: Colors.black26,
                                child: Column(children: [
                                  Row(

                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20,),
                                      Text('Level 1 profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                                      Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                                      Text('${marketData[index]['roi']} daily', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Level 2 profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                      Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                                      Text('${marketData[index]['roi2']} daily', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Level 3 profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                      Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                                      Text('${marketData[index]['roi3']} daily', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Level 4 profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                      Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                                      Text('${marketData[index]['roi4']} daily', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Level 5 profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                      Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                                      Text('${marketData[index]['roi5']} daily', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Level 6 profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                      Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                                      Text('${marketData[index]['roi6']} daily', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ],)

                                ],),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 4.0, right: 4, bottom: 4),
                              child: InkWell(
                                onTap: () {
                                  var id=int.parse(marketData[index]['id']);
                                  print('Purchase id = $id : ');

                                  FutureBuilder(
                                    future: purchaseNft(id),
                                    builder: (context, snapshot) {
                                      if(snapshot.connectionState==ConnectionState.waiting){
                                        return CircularProgressIndicator();
                                      }
                                      else{
                                        return Text('');
                                      }

                                  },);
                                },
                                child: Container(
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.price_change,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Purchase',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      );
                      // return Container(child: Text('mazhar',style: TextStyle(color: Colors.white),));

                    },),
                );
              }
            },)

          // Container(
          //   child: FutureBuilder(
          //   future: getNftMarket(),
          //   builder: (context, snapshot) {
          //   if(snapshot.connectionState==ConnectionState.waiting)
          //   {
          //     return CircularProgressIndicator();
          //   }
          //   else{
          //     return Container(
          //       child:,
          //     );
          //
          //   }
          //
          //   },
          //   ),
          // )
          ],
        ),
        ),
      ),
    );
  }
}
