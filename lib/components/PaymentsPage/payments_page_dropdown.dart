import 'package:flutter/material.dart';

class PaymentsPageDropdown extends StatefulWidget {
  final List<DropdownMenuItem<String>> items;
  final String? selectedCard;
  final String? lText;
  final ValueChanged<String?> onChanged;
  final bool enabled;

  const PaymentsPageDropdown({
    super.key,
    required this.items,
    required this.lText,
    required this.selectedCard,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  State<PaymentsPageDropdown> createState() => _PaymentsPageDropdownState();
}

class _PaymentsPageDropdownState extends State<PaymentsPageDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        constraints: BoxConstraints(
          minWidth: 100,
          maxWidth: double.infinity,
        ),
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          value: widget.selectedCard,
          decoration: InputDecoration(
            labelText: widget.lText,
            floatingLabelStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
            suffixIcon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
          dropdownColor: Colors.black,
          iconSize: 0.0, // Remove default dropdown icon
          items: widget.items,
          onChanged: widget.enabled ? (value) {
            setState(() {
              if (value == widget.selectedCard) {
                // Deselect the current item
                widget.onChanged(null);
              } else {
                // Select the new item
                widget.onChanged(value);
              }
            });
          } : null,
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildDropdownMenuItem(
    String value, IconData icon, String? selectedCard) {
  return DropdownMenuItem<String>(
    value: value,
    child: Container(
      color: selectedCard == value ? Colors.black : Colors.transparent,
      child: Row(
        children: [
          Icon(
            icon,
            color: selectedCard == value ? Colors.grey.shade300 : Colors.grey,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: selectedCard == value ? Colors.grey.shade300 : Colors.grey,
              ),
            ),
          ),
          if (value != 'Add Credit Card')
            Radio<String>(
              value: value,
              groupValue: selectedCard,
              onChanged: (newValue) {},
              activeColor: Colors.orange,
            ),
        ],
      ),
    ),
  );
}
  