import 'package:task_manager_app/models/group_model.dart';
import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/images.dart';

/*
////////////// MessageModel class //////////////
/// id: Unique identifier for the message.
/// content: The content of the message.
/// timestamp: The date and time when the message was sent.
/// group: The group associated with the message (optional).
/// sender: The user who sent the message.
*/
class MessageModel {
  final String id;
  final String content;
  final DateTime timestamp;
  final GroupModel? group; // optional for private chats
  final List<UserModel> sender;

  MessageModel({
    required this.id,
    required this.content,
    required this.timestamp,
    this.group,
    required this.sender,
  });
}

List<MessageModel> messageList = [
  MessageModel(
    id: 'M001',
    content: 'Hello, how are you?',
    timestamp: DateTime.now(),
    group: GroupModel(
      name: 'Group A',
      members: [],
      id: 'G001',
      image: AppImages.profilePlaceholder,
      createdAt: DateTime.now(),
    ),
    sender: [
      UserModel(
        name: 'John Doe',
        image: AppImages.profilePlaceholder,
        id: 'U001',
      ),
    ],
  ),
];
