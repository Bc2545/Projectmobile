import 'package:flutter/material.dart';

class ConfirmPurchasePage extends StatefulWidget {
  final String productName;
  final String productPrice;

  ConfirmPurchasePage({required this.productName, required this.productPrice});

  @override
  _ConfirmPurchasePageState createState() => _ConfirmPurchasePageState();
}

class _ConfirmPurchasePageState extends State<ConfirmPurchasePage> {
  String? _selectedPaymentMethod;

  void _onPaymentMethodChanged(String? value) {
    setState(() {
      _selectedPaymentMethod = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Purchase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You are about to purchase ${widget.productName} for ${widget.productPrice}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Select your payment method:'),
            SizedBox(height: 20),
            ListTile(
              title: Text('Credit Card'),
              leading: Radio<String>(
                value: 'credit_card',
                groupValue: _selectedPaymentMethod,
                onChanged: _onPaymentMethodChanged,
              ),
            ),
            ListTile(
              title: Text('Bank Transfer'),
              leading: Radio<String>(
                value: 'bank_transfer',
                groupValue: _selectedPaymentMethod,
                onChanged: _onPaymentMethodChanged,
              ),
            ),
            ListTile(
              title: Text('Cash'),
              leading: Radio<String>(
                value: 'cash',
                groupValue: _selectedPaymentMethod,
                onChanged: _onPaymentMethodChanged,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedPaymentMethod != null) {
                  // Handle confirmation logic
                  Navigator.pop(context); // Navigate back after confirmation
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Purchase confirmed with $_selectedPaymentMethod!')),
                  );
                } else {
                  // Show an error message if no payment method is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a payment method.')),
                  );
                }
              },
              child: Text('Confirm Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}
