
import 'package:flutter/material.dart';
import 'package:nft_app/views/screens/drawer.dart';
class dashboard extends StatefulWidget {
  const dashboard({ Key? key }) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
      final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,
      drawer: Drawer(
        child: newdrawerpage(),
      ),
      appBar: AppBar(title: Text("Dashboard"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 177, 19, 224),
      
      ),
    );
  }
}