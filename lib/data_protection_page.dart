import 'package:flutter/material.dart';

class DataProtectionPage extends StatefulWidget {
  const DataProtectionPage({Key? key}) : super(key: key);

  @override
  _DataProtectionPageState createState() => _DataProtectionPageState();
}

class _DataProtectionPageState extends State<DataProtectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("DATENSCHUTZERKLÄRUNG"),
      ),
    );
  }
}
