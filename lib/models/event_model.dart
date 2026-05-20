class EventsModel {
  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String? image;

  EventsModel({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.location,
    this.image,
  });

  EventsModel copyWith({
    String? id,
    String? title,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
    String? image,
  }) {
    return EventsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      location: location ?? this.location,
      image: image ?? this.image,
    );
  }
}

List<EventsModel> eventList = [
  EventsModel(
    id: "E001",
    title: "Meeting with Client",
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 2)),
    location: "Office",
  ),
  EventsModel(
    id: "E002",
    title: "Lunch with Friends",
    startDate: DateTime.now().add(const Duration(days: 1)),
    endDate: DateTime.now().add(const Duration(days: 1)),
    location: "Restaurant",
  ),
  EventsModel(
    id: "E003",
    title: "Gym Workout",
    startDate: DateTime.now().add(const Duration(days: 2)),
    endDate: DateTime.now().add(const Duration(days: 2)),
    location: "Gym",
  ),
  EventsModel(
    id: "E004",
    title: "Dinner with Family",
    startDate: DateTime.now().add(const Duration(days: 3)),
    endDate: DateTime.now().add(const Duration(days: 3)),
    location: "Home",
  ),
  EventsModel(
    id: "E005",
    title: "Conference Call",
    startDate: DateTime.now().add(const Duration(days: 4)),
    endDate: DateTime.now().add(const Duration(days: 4)),
    location: "Conference Room",
  ),
];
