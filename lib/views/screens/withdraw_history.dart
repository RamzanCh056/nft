import 'package:flutter/material.dart';
import 'package:nft_app/views/screens/drawer.dart';

class WithdrawHistory extends StatefulWidget {
  WithdrawHistory({Key? key}) : super(key: key);

  @override
  State<WithdrawHistory> createState() => _WithdrawHistoryState();
}

class _WithdrawHistoryState extends State<WithdrawHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey1,
        drawer: Drawer(
          child: newdrawerpage(),
        ),
        appBar: AppBar(
          title: Text("Withdraw History"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 177, 19, 224),
        ),
        body: Column(children: [
          // SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  // border: Border.all(width: 2,color: Colors.)
                  ),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  suffixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.white, fontSize: 15),
                  enabledBorder: OutlineInputBorder(
                    //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                // controller:controller. emailController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                // border: Border.all(width: 2,color: Colors.)
              ),
              // margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(120.0),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('ID',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('USDT Address(TRC20)',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Amount',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Recieve',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Processing Fee',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Status',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('1')]),
                      Column(children: [Text('Flutter')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('Flutter')]),
                      Column(children: [
                        Text('5*'),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('2')]),
                      Column(children: [Text('MySQL')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('Flutter')]),
                      Column(children: [
                        Text('5*'),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('3')]),
                      Column(children: [Text('ReactJS')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('Flutter')]),
                      Column(children: [
                        Text('5*'),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
