// import 'dart:ui';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Kerala',
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
      home: const HomeScreen(
        title: 'Safe Kerala',
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 100),
                    child: Image.network(
                      'https://i.ibb.co/C25n8q4/HK.png',
                      width: 400,
                      errorBuilder: (context, error, stackTrace) {
                        return const Image(
                          image: AssetImage('assets/Images/hawk.png'),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInScreen()),
                          );
                        },
                        child: const Text(
                          "Fly above it To master it !",
                          style: TextStyle(
                            // fontFamily: 'serif',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      // TextButton(onPressed: (){

                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => LogInScreen()),
                      //     );
                      // }, child:Text(
                      //     "Fly above it To master it !",
                      //     style: TextStyle(
                      //       // fontFamily: 'serif',
                      //       color: Color(0xffd3d2d2),
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w800,
                      //     ),
                      //   ), )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //  trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
