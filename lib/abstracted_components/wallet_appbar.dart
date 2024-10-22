import 'package:dust_wallet/abstracted_components/wallet_interactions.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

class wallet_appbar extends StatefulWidget {
  @override
  _wallet_appbarState createState() => _wallet_appbarState();
}

class _wallet_appbarState extends State<wallet_appbar> {
  GlobalKey _gestureKey = GlobalKey();
  String wallet_icon = 'assets/wallet_icon.png';

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
              Image.asset(
                'assets/subwallet_logo.png',
                height: 32,
              ),
              Text('  SubWallet'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'Talisman',
          child: Row(
            children: [
              Image.asset(
                'assets/talisman_logo.png',
                height: 32,
              ),
              Text('  Talisman'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          //TODO: only display this option on mobile app version, not web app
          value: 'Nova_Wallet',
          child: Row(
            children: [
              Image.asset(
                'assets/nova_wallet_logo.png',
                height: 32,
              ),
              Text('  Nova Wallet (app only)'),
            ],
          ),
        ),
      ],
    ).then((value) async {
      if (value != null) {

        bool result = false;

        // Handle the selection here (navigation or actions)
        print('$value selected');

        if(value == 'SubWallet')
          result = await connectToSubWallet();

        if(value == 'Talisman')
          result = await connectToTalisman();

        //if(value == 'Nova_Wallet')
        //  result = await connectToTalisman();

        if(result){

          //TODO: wait until connection is complete, and get balance and
          // account hash
          switch(value) {
            case 'SubWallet':
              print('get info');
            case 'Talisman':
              print('get info');
            case 'Nova_Wallet':
              print('get info');
          }

          setState(() {
            wallet_icon = 'assets/wallet_green.png';
            }
          );
        }
        else{
          setState(() {
            wallet_icon = 'assets/wallet_icon.png';
            // TODO: test and handle error connecting to wallet
            print('error connecting to wallet');
          });
        }
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
          wallet_icon,
          height: 48,
        ),
      ),
    );
  }
}

Future<bool> connectToSubWallet() async {
  try {
    var result = js.context.callMethod('connectToSubWallet');
    print("Connected to SubWallet: $result");

    return true;
  } catch (e) {
    print("Error connecting to SubWallet: $e");

    return false;
  }
}

Future<bool> connectToTalisman() async {
  try {
    var result = js.context.callMethod('connectToTalisman');
    print("Connected to Talisman: $result");

    return true;
  } catch (e) {
    print("Error connecting to Talisman: $e");

    return false;
  }
}