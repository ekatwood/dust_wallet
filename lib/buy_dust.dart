import 'package:flutter/material.dart';
import 'abstracted_components/wallet_appbar.dart';

class BuyDustPage extends StatefulWidget {
  const BuyDustPage({super.key});

  @override
  State<BuyDustPage> createState() => _BuyDustPageState();
}

class _BuyDustPageState extends State<BuyDustPage> {

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
            wallet_appbar(),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body:
      const Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 25.0),
            // First large piece of text
            Text(
              'buy dust',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.0),
            SizedBox(
              height: 450,
              child: Image(
                  image: AssetImage('assets/AZERO_onboarding.png')
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your \$AZERO will be automatically converted into \$ẟ',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

