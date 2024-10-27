import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load the stored name when the widget initializes
  }

  // Method to save the name to SharedPreferences
  void _saveName() async {
    if (_nameController.text.isEmpty) {
      //error msg
    } else {
      String userId = DateTime.timestamp().toIso8601String();

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('userid', userId);
      await prefs.setString("username", _nameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: size.width,
                height: size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: ClipRRect(
                  child: Image.network(
                    "https://d26a57ydsghvgx.cloudfront.net/content/blog/BlogImage_Chat.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: size.width / 2,
              child: TextField(
                controller:
                    _nameController, // Connect the controller to the TextField
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _saveName(); // Save the name before navigating
                Navigator.pushNamed(context, "/conversation");
              },
              child: Text(
                "Let's get started",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
