class Message {

  final String messageID;
  final String senderID;
  final String messageContent;
  final DateTime timeStamp;
  final bool isSent;

  Message({required this.messageID, required this.senderID, required this.messageContent, required this.timeStamp, required this.isSent});
}

class DirectConversation {

  final String conversationID;
  final List<String> participantIDs;
  final List<Message> messages;

  DirectConversation({required this.conversationID, required this.participantIDs, required this.messages});
}

final List<Message> mockMessages = [
  Message(messageID: "0", senderID: "0", messageContent: "test", timeStamp: DateTime(2025, 8, 30, 13, 51), isSent: false),
  Message(messageID: "1", senderID: "0", messageContent: "test", timeStamp: DateTime(2025, 8, 31, 13, 51), isSent: false),
  Message(messageID: "2", senderID: "1", messageContent: "test", timeStamp: DateTime(2025, 8, 31, 13, 51), isSent: true),
  Message(messageID: "3", senderID: "0", messageContent: "test", timeStamp: DateTime(2025, 9, 1, 20, 10), isSent: false),
  Message(messageID: "4", senderID: "1", messageContent: "test", timeStamp: DateTime(2025, 9, 1, 20, 10), isSent: true),
];



Map<DateTime, List<Message>> groupMessagesByDate(List<Message> messages) {
  Map<DateTime, List<Message>> grouped = {};

  for (var message in messages) {
    final date = DateTime(message.timeStamp.year, message.timeStamp.month, message.timeStamp.day);
    grouped.putIfAbsent(date, () => []).add(message);
  }

  return grouped;
}

String getDayLabel(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));

  if (date == today) return "Today";
  if (date == yesterday) return "Yesterday";
  return "${date.month}/${date.day}/${date.year}";
}
