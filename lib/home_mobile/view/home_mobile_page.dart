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
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Working...',
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
              SizedBox(height: 30),
              Icon(
                CupertinoIcons.hammer,
                color: Colors.black,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
