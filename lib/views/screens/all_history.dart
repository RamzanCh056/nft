import 'package:flutter/material.dart';
import 'package:nft_app/views/screens/drawer.dart';

class AllHistory extends StatefulWidget {
  AllHistory({Key? key}) : super(key: key);

  @override
  State<AllHistory> createState() => _AllHistoryState();
}

class _AllHistoryState extends State<AllHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey5 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey5,
        drawer: Drawer(
          child: newdrawerpage(),
        ),
        appBar: AppBar(
          title: Text("All History"),
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
                  defaultColumnWidth: FixedColumnWidth(140.0),
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
                        Text('Type',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Message',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Date Time',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('17211')]),
                      Column(children: [Text('Signup Bonus')]),
                      Column(children: [Text('ramzan, you received bonus 5')]),
                      Column(children: [
                        Text('2022-05-27 21:12:24'),
                        SizedBox(
                          height: 25,
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
