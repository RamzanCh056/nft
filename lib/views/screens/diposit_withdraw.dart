import 'package:flutter/material.dart';
import 'package:nft_app/views/screens/drawer.dart';

class DepositWithdraw extends StatefulWidget {
  DepositWithdraw({Key? key}) : super(key: key);

  @override
  State<DepositWithdraw> createState() => _DepositWithdrawState();
}

class _DepositWithdrawState extends State<DepositWithdraw> {
  final GlobalKey<ScaffoldState> _scaffoldKey4 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey4,
      drawer: Drawer(
        child: newdrawerpage(),
      ),
      appBar: AppBar(
        title: Text("Deposit/Withdraw:"),
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
                  onPressed: () {},
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
              height: 15,
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
                Text(
                  '5%',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                Text(
                  '0',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            MaterialButton(
              color: Color.fromARGB(255, 177, 19, 224),
              onPressed: () {},
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
    );
  }
}
