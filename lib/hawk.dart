import 'package:flutter/material.dart';

void main() {
  runApp(const Hawk());
}

class Hawk extends StatelessWidget {
  const Hawk({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hawk Enterprices',
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
      home: const HawkHomeScreen(),
    );
  }
}

class HawkHomeScreen extends StatefulWidget {
  const HawkHomeScreen({super.key});
  @override
  _HawkHomeScreenState createState() => _HawkHomeScreenState();
}

class _HawkHomeScreenState extends State<HawkHomeScreen> {
  String para =
      "Hawk, an inspiring student-led initiative, is dedicated to reigniting enthusiasm for coding among students. In an era where the impact of AI has discouraged many, we emerge as a beacon of hope, offering free coding courses and invaluable assistance. Our core mission revolves around crafting cutting-edge academic projects brimming with the latest features, all at incredibly affordable prices accessible to everyone. Hawk's commitment to empowering students through education and innovation not only revitalizes their passion for coding but also fosters a community where learning thrives, opening doors to limitless possibilities.";
  String msg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Image.network(
          'https://i.ibb.co/C25n8q4/HK.png',
          width: 100,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Hawk",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Text(
                  "                 an inspiring student-led initiative, is dedicated to reigniting enthusiasm for coding among students. In an era where the impact of AI has discouraged many, we emerge as a beacon of hope, offering free coding courses and invaluable assistance. Our core mission revolves around crafting cutting-edge academic projects brimming with the latest features, all at incredibly affordable prices accessible to everyone. Hawk's commitment to empowering students through education and innovation not only revitalizes their passion for coding but also fosters a community where learning thrives, opening doors to limitless possibilities.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                    fontFamily: 'serif',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    msg,
                    style: const TextStyle(
                      // fontFamily: 'serif',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          // width: 40,
                          padding: const EdgeInsets.only(left: 30, right: 30),
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
                                  setState(() {
                                    msg =
                                        'hawk@paytm'; // Update the message here
                                  });
                                },
                                icon: const Icon(
                                  Icons.attach_money_rounded,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              const Text(
                                "Donate",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
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
                              // Icon(
                              //   Icons.call,
                              //   color: Colors.white,
                              //   size: 30.0,
                              // ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    msg =
                                        '+91 1234567890'; // Update the message here
                                  });
                                },
                                icon: const Icon(
                                  Icons.call,
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
            ],
          ),
        ),
      ),
    );
  }
}
