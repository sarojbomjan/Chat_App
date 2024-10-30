import 'package:chatapp/api/datalayer.dart'; // Ensure this file exists and handles Firestore queries
import 'package:chatapp/pages/chatbox.dart'; // Ensure Chatbox exists and can handle conversation data
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/chatmodel.dart'; // Ensure ConversationModel is properly structured

class Conversations extends StatefulWidget {
  const Conversations({super.key});

  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  final CollectionReference conversations =
      FirebaseFirestore.instance.collection('CONVERSATIONS');

  late Future<List<ConversationModel>?> futureConversationData;

  @override
  void initState() {
    super.initState();
    futureConversationData =
        Datalayer.getConversations(); // Fetch conversations from Firestore
  }

  // Function to add a new conversation to Firestore
  Future<void> addConversation() async {
    try {
      await conversations.add({
        'name1': "BOT" + DateTime.now().day.toString(),
        'name2': "BOT" + DateTime.now().day.toString(),
        'userId1': "1", // Replace with actual user IDs
        'userId2': "2",
        'datetime': DateTime.now().toIso8601String(),
      });
      print("Conversation added successfully");

      // Refresh the list after adding a new conversation
      setState(() {
        futureConversationData = Datalayer.getConversations();
      });
    } catch (e) {
      print("Failed to add conversation: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height / 15),
        child: AppBar(
          backgroundColor: Colors.teal,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.message),
                Icon(Icons.people),
                Icon(Icons.phone),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Search action
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Notifications action
              },
            ),
            IconButton(
              icon: const Icon(Icons.add), // Add conversation button
              onPressed: addConversation,
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<ConversationModel>?>(
        future: futureConversationData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No conversations available'));
          } else {
            List<ConversationModel> conversationList = snapshot.data!;

            return Container(
              width: size.width,
              height: size.height / 1.1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: conversationList.length,
                itemBuilder: (context, index) {
                  return conversationItem(size, conversationList[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }

  // Widget for each conversation item
  Widget conversationItem(Size size, ConversationModel conversation) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey,
        child: Text(
          conversation.name1[0], // Initial of name1
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        conversation.name1,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        conversation.name2, // Display name2 as the message
        style: const TextStyle(fontSize: 15),
      ),
      trailing: Text(conversation.datetime ?? "N/A"), // Show the date and time
      onTap: () {
        // Navigate to Chatbox and pass conversation data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chatbox(
              name: conversation.name1, // Pass the conversation name1
              message: conversation.name2, // Pass the conversation name2
              currentUserId:
                  conversation.userId1, // Pass userId for identification
            ),
          ),
        );
      },
    );
  }
}
