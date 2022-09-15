import 'package:flutter/material.dart';

import 'globals.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff239a7e),
        onPressed: () {},
        child: const Icon(Icons.photo_camera),
      ),
      backgroundColor: const Color(0xff121b22),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xff239a7e),
                  ),
                ),
                child: const FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                ),
              ),
              title: const Text(
                "My status",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                "Tap to add status update",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Recent updates",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            ...Global.allcontacts
                .map(
                  (e) => ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xff239a7e),
                        ),
                      ),
                      child: const FlutterLogo(
                        style: FlutterLogoStyle.horizontal,
                      ),
                    ),
                    title: Text(
                      e['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
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
