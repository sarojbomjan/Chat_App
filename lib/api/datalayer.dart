import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../model/chatmodel.dart';

class Datalayer {
  //  function to read data from Firebase Realtime Database
  static Future<List<ChatModel>?> readfromdb() async {
    List<ChatModel> chatDataList = [];

    final ref = FirebaseDatabase.instance.ref();

    final snapshot = await ref.child('chat').get();

    if (snapshot.exists) {
      //convert snapshot data to a map

      Map<String, dynamic> data =
          Map<String, dynamic>.from(snapshot.value as Map);

      for (var entry in data.values) {
        ChatModel chatModel =
            ChatModel.fromJson(Map<String, dynamic>.from(entry));
        chatDataList.add(chatModel);
      }

      return chatDataList;
    } else {
      return null;
    }
  }

  // function to get conversation and return them as ConversationModel
  static Future<List<ConversationModel>?> getConversations() async {
    CollectionReference conversations =
        FirebaseFirestore.instance.collection('CONVERSATIONS');

    List<ConversationModel> conversationsList = [];

    try {
      QuerySnapshot querySnapshot = await conversations.get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          conversationsList.add(ConversationModel.fromFireStore(
              doc.data() as Map<String, dynamic>));
        }
        return conversationsList;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
