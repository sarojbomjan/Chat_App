// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../model/chatmodel.dart';
import 'package:chatapp/api/datalayer.dart'; // Your data fetching layer

class Chatbox extends StatefulWidget {
  final String currentUserId; // Current user ID
  final String name;
  final String message;

  const Chatbox({
    super.key,
    required this.name,
    required this.message,
    required this.currentUserId,
  });

  @override
  State<Chatbox> createState() => _ChatboxState();
}

class _ChatboxState extends State<Chatbox> {
  final TextEditingController _textController = TextEditingController();
  late Future<List<ChatModel>?> futureconversationdata;
  final ScrollController _scrollController =
      ScrollController(); // Scroll controller for chat list

  @override
  void initState() {
    super.initState();
    futureconversationdata = Datalayer.readfromdb();
  }

  handleRefresh() async {
    setState(() {
      futureconversationdata = Datalayer.readfromdb();
    });
  }

  void scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  // Function to send message
  void addtodb(String message, int messageType) async {
    if (message.isEmpty) return;

    try {
      String chatId = DateTime.now().microsecondsSinceEpoch.toString();
      DatabaseReference ref = FirebaseDatabase.instance.ref("chat/$chatId");

      await ref.set({
        "userId1": widget.currentUserId,
        "userId2": "18", // Replace with dynamic recipient userId
        "username1": widget.name,
        "text": message,
        "type": "0", // Use messageType
        "createdAt": DateTime.now().microsecondsSinceEpoch.toString()
      });
      _textController.clear(); // Clear input field
      scrollToBottom(); // Scroll to the latest message
      handleRefresh();
    } catch (e) {
      print("Failed to send message: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Chat with ${widget.name}",
            style: const TextStyle(fontSize: 20)),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: futureconversationdata,
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                List<ChatModel>? dataa = snapshot.data;
                return dataa != null && dataa.isNotEmpty
                    ? ListView.builder(
                        controller: _scrollController,
                        itemCount: dataa.length,
                        itemBuilder: (context, index) {
                          return dataa[index].userId1 == widget.currentUserId
                              ? rightsidedataitem(size, dataa[index])
                              : leftsidedataitem(size, dataa[index]);
                        },
                      )
                    : const Center(child: Text("No Messages Available"));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    addtodb(_textController.text, 0);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rightsidedataitem(Size size, ChatModel conversation) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(conversation.text!,
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget leftsidedataitem(Size size, ChatModel conversation) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(conversation.text!,
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
