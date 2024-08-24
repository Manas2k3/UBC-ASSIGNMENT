// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoanTypeDropdown extends StatefulWidget {
  @override
  _LoanTypeDropdownState createState() => _LoanTypeDropdownState();
}

class _LoanTypeDropdownState extends State<LoanTypeDropdown> {
  String? selectedLoanType;
  bool isDropdownOpened = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 1.0, right: 10.0, top: 10, bottom: 5),
      child: Container(
        width: double
            .infinity, // Make the DropdownButtonFormField take the full width of the screen
        child: DropdownButtonFormField<String>(
          value: selectedLoanType,
          decoration: InputDecoration(
            label: Text('Select a Loan Type'),
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
              isDropdownOpened ? Icons.arrow_right : Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
          dropdownColor: Colors.grey.shade900,
          iconSize: 0.0, // Remove the default dropdown icon
          items: [
            DropdownMenuItem(
              value: 'Asset Purchasing Loan',
              child: Text(
                'Asset Purchasing Loan',
                style: TextStyle(color: Colors.white),
              ),
            ),
            DropdownMenuItem(
              value: 'Equipment Financing',
              child: Text(
                'Equipment Financing',
                style: TextStyle(color: Colors.white),
              ),
            ),
            DropdownMenuItem(
              value: 'Letter of Credit',
              child: Text(
                'Letter of Credit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedLoanType = value;
            });
          },
          onTap: () {
            setState(() {
              isDropdownOpened = !isDropdownOpened;
            });
          },
        ),
      ),
    );
  }
}
