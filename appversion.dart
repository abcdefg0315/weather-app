import 'package:flutter/material.dart';

class appVersion extends StatelessWidget {
  const appVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        title: Text('Setting'),
        ),
      body: Padding(padding: EdgeInsets.all(20), child: Text('앱 버전: 1.0.0',style: TextStyle(fontSize: 25)),)
    );
  }
}
