import 'package:chatapp/pages/chatbox.dart';
import 'package:flutter/material.dart';

class Conversations extends StatelessWidget {
  const Conversations({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final List<Map<String, String>> conversations = [
      {"name": "Aavash", "message": "Hello", "time": "7.00 AM"},
      {"name": "Aryam", "message": "Oi", "time": "8.00 AM"},
      {"name": "Bibek", "message": "Hello", "time": "7.10 AM"},
      {
        "name": "Bijen",
        "message": "Basketball khelna aaija",
        "time": "7.00 AM"
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height / 15), // Setting the height
        child: AppBar(
          backgroundColor: Colors.teal,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.message),
                Icon(Icons.people),
                Icon(Icons.phone),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search), // Icon on the right
              onPressed: () {
                // search action
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications), // Another icon on the right
              onPressed: () {
                // notifications action
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  //msg circle
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Text(
                      conversations[index]['name']![0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  //person Name
                  title: Text(
                    conversations[index]['name']!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    conversations[index]['message']!,
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Text(conversations[index]['time']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Chatbox(
                                name: conversations[index]['name']!,
                                message: conversations[index]['message']!,
                              )),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
