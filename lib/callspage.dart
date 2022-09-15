import 'package:flutter/material.dart';

import 'globals.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff239a7e),
        onPressed: () {},
        child: const Icon(Icons.add_call),
      ),
      backgroundColor: const Color(0xff121b22),
      body: SingleChildScrollView(
        child: Column(
          children: Global.allcontacts
              .map(
                (e) => ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    child: FlutterLogo(),
                  ),
                  title: Text(
                    e['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.call_received,
                        color: Colors.green,
                      ),
                      Text(
                        e['time'],
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.call,
                    color: Color(0xff239a7e),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
