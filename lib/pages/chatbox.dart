import "package:flutter/material.dart";

class Chatbox extends StatelessWidget {
  final String name;
  final String message;

  const Chatbox({super.key, required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    TextEditingController(text: message);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Container(
            padding: EdgeInsets.only(left: 20),
            // decoration: BoxDecoration(
            //   color: Colors.teal[300],
            //   borderRadius: BorderRadius.circular(8),
            // ),
            child: Text(
              '$name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  //recieved message
                  ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 40, left: 0),
                        decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          message,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  //send message
                  ListTile(
                    title: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 40, left: 0),
                        decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          message,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Reply', border: OutlineInputBorder()),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
