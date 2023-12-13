import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }



  bool vpn = true;


  static const methodChannel = MethodChannel("method.com/vpn");


  Future getVPNconnection() async {
    final bool checkVPN =
    await methodChannel.invokeMethod("isVpnConnected");

    setState(() {
      vpn = checkVPN;
      Fluttertoast.showToast(
          msg: "VPN is connected==$vpn",

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('VPN Detection'),
        ),
        body: Center(
            child: TextButton(onPressed: () {
             getVPNconnection();


            }, child: const Text("Click"))));
  }
}
