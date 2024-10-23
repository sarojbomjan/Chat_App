import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

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
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(), // border around the TextField
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
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
