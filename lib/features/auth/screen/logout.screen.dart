import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: LogoutContent(),
    );
  }
}

class LogoutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('LogoutScreen'),
      ),
    );
  }
}
