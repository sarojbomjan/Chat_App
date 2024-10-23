import "package:flutter/material.dart";

class Chatbox extends StatelessWidget {
  const Chatbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.teal[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'ChatBox',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
