import 'package:flutter/material.dart';

class CardDetailsPage extends StatefulWidget {
  final String selectedCard;
  final IconData? icon;
  final String? lText;

  const CardDetailsPage({
    super.key,
    required this.selectedCard,
    this.icon,
    this.lText,
  });

  @override
  _CardDetailsPageState createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  String? _cardHolderName;
  String? _cardNumber;
  String? _cvv;
  String? _expiryDate;
  bool _saveInfo = false;

  // Method to check if the form is valid
  bool _isFormValid() {
    return _cardHolderName?.isNotEmpty == true &&
        _cardNumber?.isNotEmpty == true &&
        _cvv?.isNotEmpty == true &&
        _expiryDate?.isNotEmpty == true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Card Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Credit/Debit Card Details',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 25),
                Center(
                  child: DropdownButtonFormField<String>(
                    value: widget.selectedCard,
                    onChanged: null, // Disable dropdown interaction
                    decoration: InputDecoration(
                      labelText: 'Selected Card',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    items: [
                      DropdownMenuItem<String>(
                        value: widget.selectedCard,
                        child: Row(
                          children: [
                            if (widget.icon != null)
                              Icon(widget.icon, color: Colors.white),
                            const SizedBox(width: 10),
                            Text(
                              widget.selectedCard,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Card Holder Name',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Full Name',
                  ),
                  onChanged: (value) {
                    _cardHolderName = value;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  'Card Number',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Enter Card Number',
                  ),
                  onChanged: (value) {
                    _cardNumber = value;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CVV',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              label: Text(
                                'CVV',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onChanged: (value) {
                              _cvv = value;
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Expiry Date',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              label: Text(
                                'MM/YY',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onChanged: (value) {
                              _expiryDate = value;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _saveInfo,
                      onChanged: (bool? value) {
                        setState(() {
                          _saveInfo = value ?? false;
                        });
                      },
                      activeColor: Colors.deepOrange,
                    ),
                    const Text(
                      'Save This Information for Future Payments',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _isFormValid()
              ? () {
                  // Handle button press
                }
              : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor:
                _isFormValid() ? Colors.deepOrange : Colors.grey.shade600,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            elevation: 3,
          ),
          child: const Text('Pay Now'),
        ),
      ),
    );
  }
}
