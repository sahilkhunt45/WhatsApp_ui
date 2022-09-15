import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

class IosChatsPage extends StatefulWidget {
  const IosChatsPage({Key? key}) : super(key: key);

  @override
  State<IosChatsPage> createState() => _IosChatsPageState();
}

class _IosChatsPageState extends State<IosChatsPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Broadcast Lists",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "New Group",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ...Global.allcontacts
                .map(
                  (e) => Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(6),
                              child: CircleAvatar(
                                radius: 25,
                                child: FlutterLogo(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  e['des'],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(e['time']),
                            const SizedBox(width: 20),
                            const Icon(
                              CupertinoIcons.volume_off,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
