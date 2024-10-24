import 'package:dust_wallet/receive.dart';
import 'package:dust_wallet/send.dart';
import 'package:dust_wallet/transact.dart';
import 'package:flutter/material.dart';
import 'abstracted_components/wallet_appbar.dart';

void main() async {
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
            SizedBox(height: 25.0),
            // First large piece of text
            Text(
              'your dust:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0), // Spacing between the texts
            // Second large piece of text
            Text(
              //TODO: load their balance from their wallet
              'ẟ158.79',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 46.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SendPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), // Full-width, large button
              ),
              child: Text(
                'send',
                style: TextStyle(fontSize: 20.0),
                  ),
                ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReceivePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), // Full-width, large button
              ),
              child: Text(
                'receive',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), // Full-width, large button
              ),
              child: Text(
                'buy dust',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TransactPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), // Full-width, large button
              ),
              child: Text(
                'transact',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), // Full-width, large button
              ),
              child: Text(
                'donate',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

