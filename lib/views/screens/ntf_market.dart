import 'package:flutter/material.dart';

class NTFMarket extends StatefulWidget {
  NTFMarket({Key? key}) : super(key: key);

  @override
  State<NTFMarket> createState() => _NTFMarketState();
}

class _NTFMarketState extends State<NTFMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: SafeArea(
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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
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
                        width: 1,
                      ),
                      Icon(
                        Icons.device_thermostat_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        '50',
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
                    child: Container(
                      height: 250,
                      color: Colors.amber,
                      // child: Image.asset(''),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0, right: 4, bottom: 4),
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
                ],
              ),
            ),
          )
        ],
      ))),
    );
  }
}
