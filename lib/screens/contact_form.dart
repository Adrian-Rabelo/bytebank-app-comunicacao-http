import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full name',
                ),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            TextField(
              controller: _accountNumberController,
              decoration: const InputDecoration(
                labelText: 'Account number',
              ),
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? accountNumber = int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(name, accountNumber!);

                    Navigator.pop(context, newContact);
                  },
                  child: const Text('Create'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}