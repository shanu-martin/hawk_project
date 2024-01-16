import 'package:flutter/material.dart';
import 'dashborad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _username = TextEditingController();

  String msg = '';
  @override
  void initState() {
    super.initState();
    // Call getSavedName when the widget is initialized
    getSavedName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text(
          'Personal info ',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Center(
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  msg,
                  style: const TextStyle(
                    fontFamily: 'serif',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 3),
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 3),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "email@123"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 3),
                child: TextField(
                  // controller: password,
                  // obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Password"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  if (_username.text != '') {
                    setState(() {
                      msg = 'Logged In !';
                      // Update the message here
                    });
                    sdts(); //calling fn to save username
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashScreen(),
                      ),
                    );
                  } else {
                    setState(() {
                      msg = 'Please Try again  !'; // Update the message here
                    });
                    // print("not possible");
                    // print(usrnm);
                    // print(pssd);
                  }
                },
                backgroundColor: Colors.redAccent,
                label: const Text("Continue"),
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
              //   child: ElevatedButton(
              //       onPressed: () {
              //         String usrnm = username.text;
              //         String pssd = password.text;
              //         if (usrnm != '' && pssd != '') {
              //           setState(() {
              //             msg = 'Logged In !'; // Update the message here
              //           });
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => DashScreen(usrnm: usrnm),
              //             ),
              //           );
              //         } else {
              //           setState(() {
              //             msg = 'Please Try again  !'; // Update the message here
              //           });
              //           // print("not possible");
              //           // print(usrnm);
              //           // print(pssd);
              //         }
              //       },
              //       style: ButtonStyle(
              //         backgroundColor:
              //             MaterialStateProperty.all<Color>(Colors.red),
              //       ),
              //       child: Text(
              //         "LogIn",
              //       )),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getSavedName() async {
    // Making a Object For shared Preferences
    final sharedPreferencesObj = await SharedPreferences.getInstance();

    //now getting the value;
    final savedUsername = sharedPreferencesObj.getString('username');
    if (savedUsername != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashScreen(),
        ),
      );
    }
  }

  Future<void> sdts() async {
    // Making a Object For shared Preferences
    final sharedPreferencesObj = await SharedPreferences.getInstance();

    //now saving the collected value to this
    await sharedPreferencesObj.setString('username', _username.text);
  }
}
