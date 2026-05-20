import 'package:task_manager_app/utils/images.dart';

/*
 ///////////// User Model //////////////
 /// using static data for now 
 * UserModel class
 * @name: name of user
 * @image: image of user
 * @id: id of user
 */
class UserModel {
  final String name;
  final String image;
  final String id;

  UserModel({required this.name, required this.image, required this.id});

  // ✅ Dart uses this to compare two UserModel objects
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel && other.id == id;
  }

  // ✅ required whenever you override ==
  @override
  int get hashCode => id.hashCode;
}

List<UserModel> userData = [
  UserModel(name: "John Doe", image: AppImages.profilePlaceholder, id: "U001"),
  UserModel(name: "Jane Smith", image: "assets/images/user2.png", id: "U002"),
  UserModel(
    name: "Alice Johnson",
    image: "assets/images/user3.png",
    id: "U003",
  ),
];
