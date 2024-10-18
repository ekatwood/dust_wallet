import 'package:flutter/material.dart';
import 'dart:js' as js;

class wallet_appbar extends StatefulWidget {
  @override
  _wallet_appbarState createState() => _wallet_appbarState();
}

class _wallet_appbarState extends State<wallet_appbar> {
  GlobalKey _gestureKey = GlobalKey();

  void _showDropdownMenu() {
    final RenderBox renderBox = _gestureKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);  // Gets the position of the GestureDetector
    final size = renderBox.size;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + size.height, // Positioning the dropdown just below the GestureDetector
        position.dx + size.width,
        position.dy,
      ),
      items: [
        PopupMenuItem<String>(
          value: 'SubWallet',
          child: Row(
            children: [
              Text('SubWallet'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'Talisman',
          child: Row(
            children: [
              Text('Talisman'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          //TODO: only display this option on mobile app version, not web app
          value: 'Nova_Wallet',
          child: Row(
            children: [
              Text('Nova Wallet (app only)'),
            ],
          ),
        ),
      ],
    ).then((value) async {
      if (value != null) {
        // Handle the selection here (navigation or actions)
        print('$value selected');

        if(value == 'SubWallet')
          await connectToSubWallet();

        if(value == 'Talisman')
          await connectToTalisman();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _gestureKey,
      onTap: _showDropdownMenu,
      child: Container(
        padding: EdgeInsets.all(8),
        //color: Colors.blue,
        child: Image.asset(
          'assets/wallet_icon.png',
          height: 48,
        ),
      ),
    );
  }
}

Future<void> connectToSubWallet() async {
  try {
    var result = js.context.callMethod('connectToSubWallet');
    print("Connected to SubWallet: $result");
  } catch (e) {
    print("Error connecting to SubWallet: $e");
  }
}

Future<void> connectToTalisman() async {
  try {
    var result = js.context.callMethod('connectToTalisman');
    print("Connected to Talisman: $result");
  } catch (e) {
    print("Error connecting to Talisman: $e");
  }
}