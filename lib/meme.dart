import 'package:flutter/material.dart';

class MemePg extends StatelessWidget {
  const MemePg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.home)),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "As you know This App is Now Under Development ,More features are on it's way💀",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
              child: Image.network(
                'https://i.ibb.co/C25n8q4/HK.png',
                // width: 250,
                // height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
