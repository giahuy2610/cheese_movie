import 'package:flutter/material.dart';

class InputFields extends StatefulWidget {
  const InputFields({Key? key}) : super(key: key);

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [Text('Email'), TextField()],
            ),
          ),
          Container(
            child: Column(
              children: [Text('Password'), TextFormField()],
            ),
          )
        ],
      ),
    );
  }
}
