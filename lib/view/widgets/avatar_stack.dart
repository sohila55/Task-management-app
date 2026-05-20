import 'package:flutter/material.dart';

/// AvatarStack Widget
///
/// This widget displays a horizontal stack of circular avatar images,
/// where each image slightly overlaps the previous one, creating a "group" effect.
///
/// It is used inside task/project cards to show multiple team members visually.
///
/// Example usage:
/// AvatarStack(images: [AppImages.profile1, AppImages.profile2, AppImages.profile3]);
///
/// Logic explanation:
/// 1. `SizedBox(width: 50, height: 32)`
///    - Sets the fixed size of the avatar stack container.
///    - Ensures that the stack doesn't expand unexpectedly in the parent layout.
///
/// 2. `Stack`
///    - Allows multiple avatar images to be positioned on top of each other horizontally.
///
/// 3. `List.generate(images.length, ...)`
///    - Dynamically creates a widget for each avatar image in the `images` list.
///
/// 4. `Positioned(left: index * 14.0)`
///    - Offsets each avatar horizontally by 14 pixels from the previous one.
///    - This creates the overlapping effect.
///
/// 5. `Container` inside `Positioned`
///    - Width & Height: 20px (size of each avatar).
///    - `BoxDecoration`:
///        - `shape: BoxShape.circle` makes the container circular.
///        - `DecorationImage` sets the image of the avatar.
///        - `Border` adds a thin border around each avatar to distinguish overlapping edges.
class AvatarStack extends StatelessWidget {
  final List<String> images;

  const AvatarStack({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50, // fixed width of the avatar stack
      height: 32, // fixed height
      child: Stack(
        children: List.generate(images.length, (index) {
          return Positioned(
            left: index * 14.0, // horizontal overlap offset
            child: Container(
              width: 20, // avatar width
              height: 20, // avatar height
              decoration: BoxDecoration(
                shape: BoxShape.circle, // make avatar circular
                image: DecorationImage(
                  image: AssetImage(images[index]), // avatar image
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: const Color(0xFF2C3E50), // thin border around avatar
                  width: 2,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
