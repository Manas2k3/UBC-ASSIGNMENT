import 'package:flutter/material.dart';

class PaymentIntervalRadio extends StatefulWidget {
  const PaymentIntervalRadio({super.key, String? selectedPaymentInterval, required Null Function(dynamic value) onChanged});

  @override
  _PaymentIntervalRadioState createState() => _PaymentIntervalRadioState();
}

class _PaymentIntervalRadioState extends State<PaymentIntervalRadio> {
  int selectedInterval = 15; // Default selection

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 65,
              margin: const EdgeInsets.only(
                  right: 10.0), // Add spacing between items
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: selectedInterval == 15
                    ? Colors.grey.shade900
                    : Colors.transparent,
                border: Border.all(width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Radio<int>(
                    value: 15,
                    groupValue: selectedInterval,
                    onChanged: (value) {
                      setState(() {
                        selectedInterval = value!;
                      });
                    },
                    activeColor: Colors.orange,
                  ),
                  const Text(
                    '15 Days',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 65,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: selectedInterval == 30
                    ? Colors.grey.shade900
                    : Colors.transparent,
                border: Border.all(width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Radio<int>(
                    value: 30,
                    groupValue: selectedInterval,
                    onChanged: (value) {
                      setState(() {
                        selectedInterval = value!;
                      });
                    },
                    activeColor: Colors.orange,
                  ),
                  const Text(
                    '30 Days',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
