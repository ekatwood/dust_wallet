import 'package:flutter/material.dart';

void main() {
  runApp(const dustwallet());
}

class dustwallet extends StatelessWidget {
  const dustwallet({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dust_wallet',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        //useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: // Logo on the left side
              Image.asset(
                'assets/dust_symbol.png',
                height: 48,
              ),
            ),
            // wallet on the right side
            DropdownWithGesture(),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}

class DropdownWithGesture extends StatefulWidget {
  @override
  _DropdownWithGestureState createState() => _DropdownWithGestureState();
}

class _DropdownWithGestureState extends State<DropdownWithGesture> {
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
          value: 'Aleph_Zero_Vault',
          child: Row(
            children: [
              Text('Aleph Zero Vault'),
            ],
          ),
        ),
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
          value: 'Polkadot',
          child: Row(
            children: [
              Text('Polkadot{.js}'),
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
    ).then((value) {
      if (value != null) {
        // Handle the selection here (navigation or actions)
        print('$value selected');
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
