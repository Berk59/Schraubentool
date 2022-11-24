import 'package:flutter/material.dart';

class ImpressumPage extends StatefulWidget {
  const ImpressumPage({Key? key}) : super(key: key);

  @override
  _ImpressumPageState createState() => _ImpressumPageState();
}

class _ImpressumPageState extends State<ImpressumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("IMPRESSUM"),
      ),
    );
  }
}
