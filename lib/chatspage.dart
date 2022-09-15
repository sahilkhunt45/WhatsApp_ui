import 'package:flutter/material.dart';

import 'globals.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff239a7e),
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      backgroundColor: const Color(0xff121b22),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              leading: Icon(
                Icons.archive_outlined,
                color: Colors.grey,
              ),
              title: Text(
                "Archived",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                "2",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            ...Global.allcontacts
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
                    subtitle: Text(
                      e['des'],
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Text(
                      e['time'],
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
