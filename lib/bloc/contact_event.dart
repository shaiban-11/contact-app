part of 'contact_bloc.dart';

abstract class ContactEvent {}

class LoadContactsEvent extends ContactEvent {}

class AddContactEvent extends ContactEvent {
  final String name;
  final String phone;
  AddContactEvent({required this.name, required this.phone});
}

class DeleteContactEvent extends ContactEvent {
  final int index;
  DeleteContactEvent({required this.index});
}
