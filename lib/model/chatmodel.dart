class ConversationModel {
  final String id;
  final String name1;
  final String name2;
  final String userId1;
  final String userId2;
  final String? datetime;

  ConversationModel({
    required this.id,
    required this.name1,
    required this.name2,
    required this.userId1,
    required this.userId2,
    this.datetime,
  });

  //factory method to create a conversation model from firebase data

  factory ConversationModel.fromFireStore(Map<String, dynamic> data) {
    return ConversationModel(
      id: data['id'] ?? '',
      name1: data['name1'] ?? '',
      name2: data['name2'] ?? '',
      userId1: data['userId1'] ?? '',
      userId2: data['userId2'] ?? '',
      datetime: data['datetime'] ?? '',
    );
  }
}

class ChatModel {
  String? userId1;
  String? userId2;
  String? username1;
  String? username2;
  String? address;
  String? text;
  String? type;
  String? createdAt;

  ChatModel(
      {this.userId1,
      this.userId2,
      this.username1,
      this.username2,
      this.address,
      this.text,
      this.type,
      this.createdAt});

  ChatModel.fromJson(Map<String, dynamic> json) {
    userId1 = json['userId1'];
    userId2 = json['userId2'];
    username1 = json['username1'];
    username2 = json['username2'];
    address = json['address'];
    text = json['text'];
    type = json['type'];
    createdAt = json['createdAt'];
  }
}
