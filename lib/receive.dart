import 'package:flutter/material.dart';
import 'abstracted_components/wallet_appbar.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({super.key});

  @override
  State<ReceivePage> createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {

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
      Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 25.0),
            // First large piece of text
            const Text(
              'receive',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0), // Spacing between the texts
            // Second large piece of text
            const Text(
              'ẟ5CCjr2DoztkPaEkarEXAMPLEgZqrhoWjmdiZCL3TK16BN5v7',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60), // Full-width, large button
              ),
              child: const Text(
                'copy',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

