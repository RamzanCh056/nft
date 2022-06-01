import 'package:flutter/material.dart';
import 'package:nft_app/views/screens/drawer.dart';
import 'package:hexcolor/hexcolor.dart';

class MyInventoryPage extends StatefulWidget {
  MyInventoryPage({Key? key}) : super(key: key);

  @override
  State<MyInventoryPage> createState() => _MyInventoryPageState();
}

class _MyInventoryPageState extends State<MyInventoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKe2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: HexColor("#D4F1F4"),
     
      appBar: AppBar(
        title: Text("My Inventory"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 19, 224),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black54,
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
                      'Each NFT needs to be claimed every 24 hours to get your reward, by clicking the claim button after fully charging. The loading bar resets after each claim. Unclaimed NFT rewards will not show in your balance.',
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
            SizedBox(
              height: 15,
            ),
            Container(
                decoration: BoxDecoration(
                 
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 224,
                      width: double.infinity,
                      child: Column(
                        children: [
                          // SizedBox(
                          //   height: 100,
                          // ),
                          Image.asset("images/nftpic.jpg", fit: BoxFit.fill,)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 98, 247),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Buy NFT from NFT Market',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
                ),
          ],
        ),
      ),
    ),
    );
  }
}
