import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_2/contact.dart';
import 'package:provider_2/contact_respiratory.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository repository;

  List<Contact> contactList = [];

  ContactBloc(this.repository) : super(ContactLoading()) {
    on<LoadContactsEvent>((event, emit) async {
      emit(ContactLoading());
      contactList = await repository.loadContacts();
      emit(ContactLoaded(contactList));
    });

    on<AddContactEvent>((event, emit) async {
      contactList.add(Contact(name: event.name, phone: event.phone));
      await repository.saveContacts(contactList);
      emit(ContactLoaded(List.from(contactList)));
    });

    on<DeleteContactEvent>((event, emit) async {
      contactList.removeAt(event.index);
      await repository.saveContacts(contactList);
      emit(ContactLoaded(List.from(contactList)));
    });
  }
}
