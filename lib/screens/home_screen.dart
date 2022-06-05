import 'dart:async';

import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  status() async {
    calendarStatus = await Permission.calendar.status;
    locationStatus = await Permission.location.status;
    cameraStatus = await Permission.camera.status;
    contactsStatus = await Permission.contacts.status;
    microphoneStatus = await Permission.microphone.status;
  }

  @override
  initState() {
    super.initState();
    status();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: const Text('Runtime Permission'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed('settings_screen');
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap : () async {
                  PermissionStatus status = await Permission.calendar.request();
                  setState(() {
                    calendarStatus = status;
                  });
                },
                child: DropShadow(
                  child: Container(
                    height: 70,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange[900]!,
                          Colors.amberAccent.shade100,
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Calendar Permission',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
                  ),
                ),
              ),
              GestureDetector(
                onTap : () async {
                  PermissionStatus status = await Permission.location.request();
                  setState(() {
                    locationStatus = status;
                  });
                },
                child: DropShadow(
                  child: Container(
                    height: 70,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange[900]!,
                          Colors.amberAccent.shade100,
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Location Permission',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
                  ),
                ),
              ),
              GestureDetector(
                onTap : () async {
                  PermissionStatus status = await Permission.camera.request();
                  setState(() {
                    cameraStatus = status;
                  });
                },
                child: DropShadow(
                  child: Container(
                    height: 70,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange[900]!,
                          Colors.amberAccent.shade100,
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Camera Permission',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
                  ),
                ),
              ),
              GestureDetector(
                onTap : () async {
                  PermissionStatus status = await Permission.contacts.request();
                  setState(() {
                    contactsStatus = status;
                  });
                },
                child: DropShadow(
                  child: Container(
                    height: 70,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange[900]!,
                          Colors.amberAccent.shade100,
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Contacts Permission',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
                  ),
                ),
              ),
              GestureDetector(
                onTap : () async {
                  PermissionStatus status = await Permission.microphone.request();
                  setState(() {
                    microphoneStatus = status;
                  });
                },
                child: DropShadow(
                  child: Container(
                    height: 70,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange[900]!,
                          Colors.amberAccent.shade100,
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Microphone Permission',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
