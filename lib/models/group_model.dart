import 'package:task_manager_app/models/user_model.dart';
import 'package:task_manager_app/utils/images.dart';

/**
 * GroupModel class
 * name: The name of the group.
 * members: A list of members in the group.
 * id: Unique identifier for the group.
 * image: The image associated with the group.
 * createdAt: The date and time when the group was created.
 
 */
class GroupModel {
  final String name;
  final List<UserModel> members;
  final String id;
  final String image;
  final DateTime createdAt;

  GroupModel({
    required this.name,
    required this.members,
    required this.id,
    required this.image,
    required this.createdAt,
  });

  GroupModel copyWith({
    String? name,
    List<UserModel>? members,
    String? id,
    String? image,
    DateTime? createdAt,
  }) {
    return GroupModel(
      name: name ?? this.name,
      members: members ?? this.members,
      id: id ?? this.id,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

List<GroupModel> groupList = [
  GroupModel(
    name: 'Family',
    members: [
      UserModel(
        name: 'John Doe',
        image: AppImages.profilePlaceholder,
        id: 'U001',
      ),
      UserModel(
        name: 'Jane Smith',
        image: AppImages.profilePlaceholder,
        id: 'U002',
      ),
    ],
    id: 'G001',
    image: AppImages.profilePlaceholder,
    createdAt: DateTime.now(),
  ),
];
