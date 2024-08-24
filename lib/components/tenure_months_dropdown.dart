// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TenureMonthsDropdown extends StatefulWidget {
  const TenureMonthsDropdown({super.key, String? selectedTenure});

  @override
  State<TenureMonthsDropdown> createState() => _TenureMonthsDropdownState();
}

class _TenureMonthsDropdownState extends State<TenureMonthsDropdown> {
  String? selectedTenureDuration;
  bool isDropDownOpened = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 1.0, right: 10.0, top: 10, bottom: 5),
      child: Container(
        width: double
            .infinity, // Make the DropdownButtonFormField take the full width of the screen
        child: DropdownButtonFormField<String>(
          value: selectedTenureDuration,
          decoration: InputDecoration(
            label: Text('Select a Tenure Duration'),
            floatingLabelStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
            suffixIcon: Icon(
              isDropDownOpened ? Icons.arrow_right : Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
          dropdownColor: Colors.grey.shade900,
          iconSize: 0.0, // Remove the default dropdown icon
          items: [
            DropdownMenuItem(
              value: '12 Months',
              child: Text(
                '12 Months',
                style: TextStyle(color: Colors.white),
              ),
            ),
            DropdownMenuItem(
              value: '11 Months',
              child: Text(
                '11 Months',
                style: TextStyle(color: Colors.white),
              ),
            ),
            DropdownMenuItem(
              value: '10 Months',
              child: Text(
                '10 Months',
                style: TextStyle(color: Colors.white),
              ),
            ),
            DropdownMenuItem(
              value: '9 Months',
              child: Text(
                '9 Months',
                style: TextStyle(color: Colors.white),
              ),
            ),
            DropdownMenuItem(
              value: '9 Months',
              child: Text(
                '9 Months',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedTenureDuration = value;
            });
          },
          onTap: () {
            setState(() {
              isDropDownOpened = !isDropDownOpened;
            });
          },
        ),
      ),
    );
  }
}
