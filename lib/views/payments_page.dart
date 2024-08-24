import 'package:flutter/material.dart';
import 'package:uc_assignment/components/PaymentsPage/payments_page_dropdown.dart';
import 'package:uc_assignment/views/card_details_page.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  String? selectedCard1;
  String? selectedCard2;
  String? selectedCard3;
  String? selectedCard4;

  String? getSelectedCard() {
    return selectedCard1 ?? selectedCard2 ?? selectedCard3 ?? selectedCard4;
  }

  IconData? getSelectedCardIcon() {
    if (selectedCard1 != null) {
      return Icons.account_balance_wallet_outlined; 
    } else if (selectedCard2 != null) {
      return Icons.money; 
    } else if (selectedCard3 != null) {
      return Icons.money_outlined; 
    } else if (selectedCard4 != null) {
      return Icons.money_rounded; 
    }
    return null;
  }

  String? getSelectedCardText() {
    if (selectedCard1 != null) {
      return 'Credit Card'; 
    } else if (selectedCard2 != null) {
      return 'Consumer Durable Loan'; 
    } else if (selectedCard3 != null) {
      return 'Wallets'; 
    } else if (selectedCard4 != null) {
      return 'UPI Payment'; 
    }
    return null;
  }

  bool isDropdownDisabled(String dropdown) {
    return getSelectedCard() != null && dropdown != 'selected';
  }

  void resetSelection() {
    setState(() {
      selectedCard1 = null;
      selectedCard2 = null;
      selectedCard3 = null;
      selectedCard4 = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Payments',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Payment Method',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: resetSelection,
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 18, color: Colors.deepOrange),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: PaymentsPageDropdown(
                items: [
                  buildDropdownMenuItem('HDFC Bank (Rupay)',
                      Icons.account_balance_wallet_outlined, selectedCard1),
                  buildDropdownMenuItem('Axis Bank (Visa)',
                      Icons.credit_card_outlined, selectedCard1),
                  buildDropdownMenuItem('Kotak Mahindra Bank (MasterCard)',
                      Icons.account_balance, selectedCard1),
                  buildDropdownMenuItem(
                      'Add Credit Card', Icons.add, selectedCard1),
                ],
                selectedCard: selectedCard1,
                onChanged: (value) {
                  setState(() {
                    selectedCard1 = value;
                    selectedCard2 =
                        selectedCard2 == value ? null : selectedCard2;
                    selectedCard3 =
                        selectedCard3 == value ? null : selectedCard3;
                    selectedCard4 =
                        selectedCard4 == value ? null : selectedCard4;
                  });
                },
                lText: 'Credit Card',
                enabled: !isDropdownDisabled('creditCard'),
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: PaymentsPageDropdown(
                items: [
                  buildDropdownMenuItem(
                      'Consumer Durable Loan', Icons.money, selectedCard2)
                ],
                selectedCard: selectedCard2,
                onChanged: (value) {
                  setState(() {
                    selectedCard2 = value;
                    selectedCard1 =
                        selectedCard1 == value ? null : selectedCard1;
                    selectedCard3 =
                        selectedCard3 == value ? null : selectedCard3;
                    selectedCard4 =
                        selectedCard4 == value ? null : selectedCard4;
                  });
                },
                lText: 'Consumer Durable Loan',
                enabled: !isDropdownDisabled('consumerLoan'),
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: PaymentsPageDropdown(
                items: [
                  buildDropdownMenuItem(
                      'Paytm Wallet', Icons.money_outlined, selectedCard3),
                  buildDropdownMenuItem(
                      'Amazon Wallet', Icons.shopping_bag, selectedCard3),
                ],
                lText: 'Wallets',
                selectedCard: selectedCard3,
                onChanged: (value) {
                  setState(() {
                    selectedCard3 = value;
                    selectedCard1 =
                        selectedCard1 == value ? null : selectedCard1;
                    selectedCard2 =
                        selectedCard2 == value ? null : selectedCard2;
                    selectedCard4 =
                        selectedCard4 == value ? null : selectedCard4;
                  });
                },
                enabled: !isDropdownDisabled('wallets'),
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: PaymentsPageDropdown(
                items: [
                  buildDropdownMenuItem(
                      'PhonePay', Icons.money_rounded, selectedCard4),
                ],
                lText: 'UPI Payment',
                selectedCard: selectedCard4,
                onChanged: (value) {
                  setState(() {
                    selectedCard4 = value;
                    selectedCard1 =
                        selectedCard1 == value ? null : selectedCard1;
                    selectedCard2 =
                        selectedCard2 == value ? null : selectedCard2;
                    selectedCard3 =
                        selectedCard3 == value ? null : selectedCard3;
                  });
                },
                enabled: !isDropdownDisabled('upiPayment'),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {
            final selectedCard = getSelectedCard();
            final icon = getSelectedCardIcon();
            final lText = getSelectedCardText();

            if (selectedCard != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDetailsPage(
                    selectedCard: selectedCard,
                    icon: icon,
                    lText: lText,
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select a payment method first.'),
                ),
              );
            }
          },
          child: const Text(
            'Pay Now',
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}
