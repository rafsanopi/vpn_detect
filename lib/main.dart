import 'package:check_vpn_connection/check_vpn_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vpn_connection_detector/vpn_connection_detector.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () async {
                if (await CheckVpnConnection.isVpnActive()) {
                  Fluttertoast.showToast(
                    msg: "===========VPN Active",
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "===========VPN NOT Active",
                  );
                }
              },
              child: const Text("check_vpn_connection 0.0.2")),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () async {
                final vpnDetector = VpnConnectionDetector();
                vpnDetector.vpnConnectionStream.listen((state) {
                  if (state == VpnConnectionState.connected) {
                    Fluttertoast.showToast(
                      msg: "===========VPN Active",
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "===========VPN NOT Active",
                    );
                  }
                });
              },
              child: const Text("vpn_connection_detector 1.0.5")),
        ],
      )),
    ));
  }
}
