import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/callspage.dart';
import 'package:whatsapp/chatspage.dart';
import 'package:whatsapp/ios_settingspage.dart';
import 'package:whatsapp/ios_statuspage.dart';
import 'package:whatsapp/ioscallspage.dart';
import 'package:whatsapp/ioschatspage.dart';
import 'package:whatsapp/statuspage.dart';

import 'globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  final List<Widget> ios_tabs = [
    const IosStatusPage(),
    const IosCallsPage(),
    const IosChatsPage(),
    const IosSettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return (Platform.isAndroid)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: const Text(
                  "WhatsApp",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: const Color(0xff1f2c34),
                bottom: TabBar(
                  controller: tabController,
                  indicatorColor: const Color(0xff239a7e),
                  indicatorWeight: 3,
                  tabs: const [
                    Tab(text: "CHATS"),
                    Tab(text: "STATUS "),
                    Tab(text: "CALLS"),
                  ],
                ),
                actions: [
                  const Icon(Icons.search),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Switch(
                      activeColor: const Color(0xff239a7e),
                      value: Global.isIos,
                      onChanged: (val) {
                        setState(() {
                          Global.isIos = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              body: TabBarView(
                controller: tabController,
                children: const [
                  ChatsPage(),
                  StatusPage(),
                  CallsPage(),
                ],
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "WhatsApp",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                trailing: CupertinoSwitch(
                  onChanged: (val) {
                    setState(() {
                      Global.isIos = val;
                    });
                  },
                  value: Global.isIos,
                ),
              ),
              child: CupertinoTabScaffold(
                tabBar: CupertinoTabBar(
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.rectangle_stack_person_crop),
                        label: 'Status'),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.phone), label: 'Calls'),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.chat_bubble_2),
                        label: 'Chats'),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.settings), label: 'Settings'),
                  ],
                ),
                tabBuilder: (BuildContext context, index) {
                  return CupertinoTabView(
                    builder: (BuildContext context) {
                      return ios_tabs[index];
                    },
                  );
                },
              ),
            ),
          );
  }
}
