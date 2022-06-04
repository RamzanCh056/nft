import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:nft_app/views/navigation_bar/navigation.dart';
import 'package:nft_app/views/oct.dart';

import '../../controller/constraints.dart';
import 'package:shimmer/shimmer.dart';
import 'package:rainbow_color/rainbow_color.dart';
// import 'package:neon/neon.dart';


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
   bool _enabled = true;
    late Animation<double> animation;
  late AnimationController controller;

  final Rainbow _rb = Rainbow(spectrum: const [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.red,
  ], rangeStart: 0.0, rangeEnd: 300.0);

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
       SingleChildScrollView(
        physics: ScrollPhysics(),
        child:  
       Container(
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
                return Center(child: Container(
          height: 600,

		width: double.infinity,
		padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
		child: Column(
		mainAxisSize: MainAxisSize.max,
		children: <Widget>[
			Expanded(
			child: Shimmer.fromColors(
				baseColor: Colors.grey,
				highlightColor: Colors.grey,
				enabled: _enabled,
				child: ListView.builder(
				itemBuilder: (_, __) => Padding(
					padding: const EdgeInsets.only(bottom: 8.0),
					child: Row(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Container(
						width: 48.0,
						height: 48.0,
						color: Colors.white,
						),
						const Padding(
						padding: EdgeInsets.symmetric(horizontal: 8.0),
						),
						Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
							Container(
								width: double.infinity,
								height: 8.0,
								color: Colors.white,
							),
							const Padding(
								padding: EdgeInsets.symmetric(vertical: 2.0),
							),
							Container(
								width: double.infinity,
								height: 8.0,
								color: Colors.white,
							),
							const Padding(
								padding: EdgeInsets.symmetric(vertical: 2.0),
							),
							Container(
								width: 40.0,
								height: 8.0,
								color: Colors.white,
							),
							],
						),
						)
					],
					),
				),
				itemCount: 6,
				),
			),
			),
		
		],
		),
	)
  );
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
                            Container(
          width: 320,
          height: 320,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                     Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.red,
                  ])
                  ),
          child: Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
             // color: Colors.white,
            ),
            alignment: Alignment.center,
            child:  Image.network('https://mining-nfts.com/uploads/${marketData[index]['img']}'),
          ),
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
                    //  return Container(child: Text('mazhar',style: TextStyle(color: Colors.white),));

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

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height; // for convenient shortage
    double sw = size.width; // for convenient shortage
    double th = sh * 0.6; // total frame thickness
    double side = sw * 0.18; 

    Paint outerPaint = Paint()
      ..color = Color(0xFF9600FC)
      ..strokeWidth = th
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint lightTopPaint = Paint()
      ..color = Color(0XFFD197F9)
      ..style = PaintingStyle.fill;

    Paint lightSmallPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = th*0.06
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint arcPaint = Paint()
      ..color = Color(0xFF3D0066)
      ..style = PaintingStyle.fill;

    Paint minilinePaint = Paint()
      ..color = Color(0xFF180029)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = th*0.06;
      
    Path outerPath = Path()
      ..moveTo(side, 0)
      ..lineTo(sw - side, 0)
      ..quadraticBezierTo(sw, 0, sw, sh/2)
      ..quadraticBezierTo(sw, sh, sw - side, sh)
      ..lineTo(side, sh)
      ..quadraticBezierTo(0, sh, 0, sh/2)
      ..quadraticBezierTo(0, 0, side, 0);
      
      
    Path lightTop = Path()
      ..moveTo(-th, sh/2)
      ..quadraticBezierTo(0, 0, side, -th/3)
      ..lineTo(sw-side, -th/3)
      ..quadraticBezierTo(sw, 0, sw+th, sh/2)
      ..quadraticBezierTo(sw, 0, sw-side, th/20)
      ..lineTo(side, th/20)
      ..quadraticBezierTo(0, 0, -th, sh/2);

        Path lightBottom = Path()
      ..moveTo(-th, sh/2)
      ..quadraticBezierTo(0, sh, side, sh+th/3)
      ..lineTo(sw-side, sh+th/3)
      ..quadraticBezierTo(sw, sh, sw+th, sh/2)
      ..quadraticBezierTo(sw, sh, sw-side, sh - th/20)
      ..lineTo(side, sh - th/20)
      ..quadraticBezierTo(0, sh, -th, sh/2);

    Path lightSmallTop = Path()
      ..moveTo(side*0.8, th*0.3)
      ..lineTo(sw-side*0.8, th*0.3);

    Path miniLineTop = Path()
      ..moveTo(side*0.8, th/3)
      ..lineTo(sw - side*0.8, th/3);

    Path miniLineBottom = Path()
      ..moveTo(side*0.8, sh+th/3)
      ..lineTo(sw - side*0.8, sh+th/3);

    Path lightSmallBottom = Path()
      ..moveTo(side*0.8, sh -th*0.3)
      ..lineTo(sw-side*0.8, sh -th*0.3);



    Path leftArc = Path()
      ..moveTo(side, -th/2)
      ..quadraticBezierTo(0, 0, -th/2, sh/2)
      ..quadraticBezierTo(0, sh, side, sh)
      ..quadraticBezierTo(0, sh, 0, sh/2)
      ..quadraticBezierTo(0, 0, side, -th/2);

    Path rightArc = Path()
      ..moveTo(sw - side, th/2)
      ..quadraticBezierTo(sw, 0, sw + th/2, sh/2)
      ..quadraticBezierTo(sw, sh, sw-side, sh)
      ..quadraticBezierTo(sw, sh, sw, sh/2)
      ..quadraticBezierTo(sw, 0, sw-side, th/2);


    Float64List matrix4 = Float64List.fromList([1,0,0,0,
                              0,0.3,0,0,
                              0,0,1,0,
                              0,0,0,1,]);


    canvas.drawShadow(outerPath.transform(matrix4).shift(Offset(0,-sh)), Color(0xFF9600FC), sh, true);
    canvas.drawShadow(outerPath.transform(matrix4).shift(Offset(0,0)), Color(0xFF9600FC), sh, true);

    canvas.drawPath(outerPath, outerPaint);
    canvas.drawPath(lightTop, lightTopPaint);
    canvas.drawPath(miniLineTop, minilinePaint);
    canvas.drawPath(miniLineBottom, minilinePaint);
    canvas.drawPath(lightBottom, lightTopPaint);
    canvas.drawPath(lightSmallTop, lightSmallPaint);
    canvas.drawPath(lightSmallBottom, lightSmallPaint);
    canvas.drawPath(leftArc, arcPaint);
    canvas.drawPath(rightArc, arcPaint);

  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}