import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HawkDes());
}

class HawkDes extends StatelessWidget {
  const HawkDes({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Description',
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
      home: const HawkDesScreen(),
    );
  }
}

class HawkDesScreen extends StatefulWidget {
  const HawkDesScreen({super.key});
  @override
  _HawkDesScreenState createState() => _HawkDesScreenState();
}

class _HawkDesScreenState extends State<HawkDesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Project Description"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
                child: Text(
                  "Hawk, an inspiring student-led initiative, is dedicated to reigniting enthusiasm for coding among students. In an era where the impact of AI has discouraged many, we emerge as a beacon of hope, offering free coding courses and invaluable assistance. Our core mission revolves around crafting cutting-edge academic projects brimming with the latest features, all at incredibly affordable prices accessible to everyone. Hawk's commitment to empowering students through education and innovation not only revitalizes their passion for coding but also fosters a community where learning thrives, opening doors to limitless possibilities.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'serif',
                    height: 2, // eda eth line height
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      // width: 40,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.redAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              _groupAdd();
                            },
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          const Text(
                            "Contact us",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_groupAdd() async {
  const url = 'https://chat.whatsapp.com/E6mcgmm3COn5YHsdtaimeW';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'You are not Eligible to join the official Whatsapp group ,Please contact us directly on 9645281221';
  }
}
