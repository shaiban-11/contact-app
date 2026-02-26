import 'dart:convert';

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});

  Map<String, dynamic> toMap() {
    return {'name': name, 'phone': phone};
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(name: map['name'], phone: map['phone']);
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source));
}
