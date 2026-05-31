class BookingModel {
  final String name;
  final String phone;
  final String country;
  final String language;
  final String people;
  final String pickup;
  final String destination;
  final String notes;

  BookingModel({
    required this.name,
    required this.phone,
    required this.country,
    required this.language,
    required this.people,
    required this.pickup,
    required this.destination,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'country': country,
      'language': language,
      'people': people,
      'pickup': pickup,
      'destination': destination,
      'notes': notes,
    };
  }
}