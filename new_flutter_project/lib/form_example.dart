// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final formKey = GlobalKey<FormState>();

  void clearForm() {
    // textEdtController.clear();
    textEdtController.text = 'Hi';
  }

  final TextEditingController textEdtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: textEdtController,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              print(value);
            },
            maxLength: 10,
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide()),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: clearForm,
              ),
              hintText: 'Enter Name',
            ),
            buildCounter: (context,
                {required currentLength,
                required isFocused,
                required maxLength}) {
              return Text(
                '$currentLength/$maxLength',
                style: const TextStyle(decoration: TextDecoration.underline),
              );
            },
            validator: (value) {
              if (value!.length < 4) {
                return 'Min length should be 4';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                print('The form is valid');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
