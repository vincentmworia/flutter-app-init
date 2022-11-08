import 'package:flutter/material.dart';

class TemporaryScreen extends StatelessWidget {
  const TemporaryScreen(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
