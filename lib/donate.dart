import 'package:flutter/material.dart';
import 'abstracted_components/wallet_appbar.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {

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
              'donate',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const SizedBox(
              width: 400,
              child: Text(
                'If you choose, you can partition a percentage % of each transaction, to be donated to a charity or worthy cause at the end of the month.',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 35.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 70,
                      height: 40,
                      child: TextField(
                          decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                    ),
                    const Text(
                        ' % ',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(70, 40), // Full-width, large button
                      ),
                      child: const Text(
                        'set',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ]
              ),
            const SizedBox(height: 20.0),
            const SizedBox(
              width: 400,
              child: Text(
                'Your donation will be added to the dust_vault, and at the end of each month, 50% of the dust_vault will be donated. This month’s cause:',
                style: TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), // Full-width, large button
              ),
              child: const Text(
                'Hurricane Milton Relief Fund',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

