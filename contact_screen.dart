import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_2/bloc/contact_bloc.dart';
import 'package:provider_2/contact_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ContactBloc>().add(LoadContactsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact List")),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ContactLoaded) {
            List<Contact> contacts = state.contacts;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          hintText: "Phone",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ContactBloc>().add(
                            AddContactEvent(
                              name: nameController.text,
                              phone: phoneController.text,
                            ),
                          );
                          nameController.clear();
                          phoneController.clear();
                        },
                        child: const Text("Add Contact"),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(contacts[index].name),
                        subtitle: Text(contacts[index].phone),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<ContactBloc>().add(
                              DeleteContactEvent(index: index),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
