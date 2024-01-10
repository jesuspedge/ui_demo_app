import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        elevation: 2.0,
        title: const Text('UI Demos App'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Working...',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 40),
            Icon(CupertinoIcons.hammer, size: 40)
          ],
        ),
      ),
    );
  }
}
