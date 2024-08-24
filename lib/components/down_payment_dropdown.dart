// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DownPaymentTextFormField extends StatefulWidget {
  const DownPaymentTextFormField({super.key});

  @override
  State<DownPaymentTextFormField> createState() =>
      _DownPaymentTextFormFieldState();
}

class _DownPaymentTextFormFieldState extends State<DownPaymentTextFormField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 1.0, right: 10.0, top: 10, bottom: 5),
      child: TextFormField(
        cursorColor: Colors.grey,
        controller: _controller,
        keyboardType: TextInputType.number,
        style:
            TextStyle(color: Colors.white), // Set the input text color to white
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
