
import 'package:flutter/material.dart';

import 'package:e_doctor/tabs/ChatsTab.dart';

import 'package:e_doctor/constants/colors.dart';

import 'package:e_doctor/screens/PatientHomeScreen.dart';
import 'package:e_doctor/screens/ChatListScreen.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.userType});
  final String userType;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  // final Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  // Color color;

  // Future<void> getData() async {
  //   print('called');
  //   final SharedPreferences prefs = await _sprefs;
  //   Color color = prefs.getString('user-type') == 'patient' ? LIGHT_GREEN : PALE_ORANGE;
  //   setState(() {
  //     color = color;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // length specifies the number of tabs 
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'E-Doctor',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          backgroundColor: widget.userType == 'patient' ? DARK_GREEN : PALE_ORANGE,
          // bottom: TabBar(
          //   indicatorColor: LIGHT_GREY_COLOR,
          //   tabs: <Widget>[
          //     Tab(
          //       text: 'CHATS',
          //     ),
          //     Tab(
          //       text: 'CALLS',
          //     ),
          //   ],
          // ),
          actions: <Widget>[
            Visibility(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => ChatListScreen(userType: widget.userType)));
                  },
                  icon: Icon(Icons.chat_bubble_outline),
                ),
                visible: widget.userType == 'patient' ,
            )

          ],
        ),
        body: widget.userType == 'patient' ?  PatientHomeScreen(userType: widget.userType) : ChatsTab(userType: widget.userType),
        // body: TabBarView(
        //   children: <Widget>[
        //     ChatsTab(),
        //     CallsTab(),
        //   ],
        // ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(
        //     Icons.chat
        //   ),
        //   onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => UserListScreen()));
        //     },
        //   backgroundColor: PALE_ORANGE,
        // ),
      ),
    );
  }
}
