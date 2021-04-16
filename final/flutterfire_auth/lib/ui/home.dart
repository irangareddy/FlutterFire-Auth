import 'package:flutter/material.dart';
import 'package:flutterfire_auth/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

// 1
  User user;

  @override
  void initState() {
    setState(() {
      // 2
      user = context.read<AuthenticationService>().getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          'Flutter Firebase Auth',
          style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.w500, 
              color: Colors.white
              ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // 3
                context.read<AuthenticationService>().signOut();
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Hurrah!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )),
          Center(
            child: user != null ? 
            Image.asset('assets/Saly.png') : Container(),
          ),
          Column(
            children: [
              Text(
                "You logged in as",
                style: TextStyle(
                fontSize: 15, 
                fontWeight: FontWeight.w500
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                  // 4
                  user != null ? user.email : "No User Found",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


