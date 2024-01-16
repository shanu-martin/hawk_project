import 'package:flutter/material.dart';
import 'package:hawk/description.dart';
import 'package:hawk/hawk.dart';
import 'package:hawk/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hawk/meme.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  String usrnm = 'user';

  @override
  Widget build(BuildContext context) {
    getSavedName();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Wecome $usrnm,',
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
        ),
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.home)),
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 70,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color(0xfffb7b7b),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Hawk()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: IconButton(
                    icon: const Icon(Icons.mood_sharp),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MemePg()),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    logout();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  itemBuilder: (i, index) {
                    return ListTile(
                      title: TextButton(
                        onPressed: () {
                          // print("order recieved");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HawkDes()),
                          );
                        },
                        child: const Text(
                          'Slot Hunt', //Project Name
                          style: TextStyle(
                              fontFamily: 'serif',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                      subtitle: const Text(
                          'Description of the Project like bla bla bla '),
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                    'https://i.ibb.co/swPbDvW/slot.png')),
                          ),
                        ),
                      ),
                      trailing: const Text(
                        'Dis \n 10%',
                        style: TextStyle(
                            fontFamily: 'serif',
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                  separatorBuilder: (i, index) {
                    return const Divider(
                      height: 40,
                    );
                  },
                  itemCount: 10),
            ),
          ))
        ],
      ),
    );
  }

  Future<void> logout() async {
    // Making a Object For shared Preferences
    final sharedPreferencesObj = await SharedPreferences.getInstance();

    //now getting the value;
    sharedPreferencesObj.remove('username');
  }

  Future<void> getSavedName() async {
    // Making a Object For shared Preferences
    final sharedPreferencesObj = await SharedPreferences.getInstance();

    //now getting the value;
    final savedUsername = sharedPreferencesObj.getString('username');
    if (savedUsername != null) {
      // print(savedUsername);
      setState(() {
        usrnm = savedUsername;
      });
    }
  }
}
