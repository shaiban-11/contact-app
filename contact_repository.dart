import 'package:provider_2/contact_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactRepository {
  static const String key = "contacts";

  Future<void> saveContacts(List<Contact> contacts) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> contactList = contacts
        .map((contact) => contact.toJson())
        .toList();

    await prefs.setStringList(key, contactList);
  }

  Future<List<Contact>> loadContacts() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? contactList = prefs.getStringList(key);

    if (contactList != null) {
      return contactList.map((contact) => Contact.fromJson(contact)).toList();
    } else {
      return [];
    }
  }
}
