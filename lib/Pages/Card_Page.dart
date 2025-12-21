import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final ValueChanged<String>? onPayment;

  const CardPage({super.key, this.onPayment});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _nameController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _amountController = TextEditingController(text: '50.00');

  bool _isProcessing = false;
  bool _paid = false;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _nameController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _handlePay() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isProcessing = true);

    // Simulate payment processing delay
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isProcessing = false;
      _paid = true;
    });

    // notify parent that payment completed
    widget.onPayment?.call(_amountController.text);

    // Show confirmation
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment successful — ${_amountController.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _paid
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 72),
                SizedBox(height: 16),
                Text('Payment Completed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Amount: ${_amountController.text}', style: TextStyle(fontSize: 16)),
              ],
            )
          : Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Pay with Card', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _cardNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Card number', border: OutlineInputBorder()),
                    validator: (v) {
                      if (v == null || v.trim().length < 12) return 'Enter a valid card number';
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name on card', border: OutlineInputBorder()),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter name' : null,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _expiryController,
                          decoration: InputDecoration(labelText: 'MM/YY', border: OutlineInputBorder()),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter expiry' : null,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _cvvController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'CVV', border: OutlineInputBorder()),
                          validator: (v) => (v == null || v.trim().length < 3) ? 'Enter CVV' : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(labelText: 'Amount', border: OutlineInputBorder()),
                    validator: (v) => (v == null || double.tryParse(v) == null) ? 'Enter amount' : null,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isProcessing ? null : _handlePay,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
                    child: _isProcessing ? SizedBox(height: 18, width: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : Text('Pay'),
                  ),
                ],
              ),
            ),
    );
  }
}