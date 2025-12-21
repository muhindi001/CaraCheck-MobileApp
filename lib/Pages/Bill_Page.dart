import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  int _methodIndex = 0; // 0: Bank, 1: PayPal, 2: Mobile Money
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController(text: '50.00');
  final _referenceController = TextEditingController();
  bool _processing = false;

  @override
  void dispose() {
    _amountController.dispose();
    _referenceController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _processing = true);
    await Future.delayed(Duration(seconds: 2));
    setState(() => _processing = false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment submitted via ${_methodName()}: ${_amountController.text}')));
  }

  String _methodName() {
    switch (_methodIndex) {
      case 0:
        return 'Bank Transfer';
      case 1:
        return 'PayPal';
      default:
        return 'Mobile Money';
    }
  }

  Widget _methodForm() {
    // Shared amount + method-specific field
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: 'Amount', border: OutlineInputBorder()),
            validator: (v) => (v == null || double.tryParse(v) == null) ? 'Enter valid amount' : null,
          ),
          SizedBox(height: 12),
          if (_methodIndex == 0) ...[
            TextFormField(
              controller: _referenceController,
              decoration: InputDecoration(labelText: 'Bank account / Reference', border: OutlineInputBorder()),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter bank reference' : null,
            ),
            SizedBox(height: 8),
            Text('Make a transfer to account: 0123456789 (CareCheck Bank) and enter your reference above.', style: TextStyle(color: Colors.grey[700])),
          ] else if (_methodIndex == 1) ...[
            TextFormField(
              controller: _referenceController,
              decoration: InputDecoration(labelText: 'PayPal email', border: OutlineInputBorder()),
              validator: (v) => (v == null || !v.contains('@')) ? 'Enter valid PayPal email' : null,
            ),
            SizedBox(height: 8),
            Text('You will be redirected to PayPal in a production app.', style: TextStyle(color: Colors.grey[700])),
          ] else ...[
            TextFormField(
              controller: _referenceController,
              decoration: InputDecoration(labelText: 'Mobile number', border: OutlineInputBorder()),
              validator: (v) => (v == null || v.trim().length < 7) ? 'Enter mobile number' : null,
            ),
            SizedBox(height: 8),
            Text('We support popular mobile money providers. Follow the on-screen instructions.', style: TextStyle(color: Colors.grey[700])),
          ],
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _processing ? null : _submit,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
            child: _processing ? SizedBox(width:18,height:18,child:CircularProgressIndicator(color: Colors.white, strokeWidth:2)) : Text('Pay via ${_methodName()}'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pay Bill', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          ToggleButtons(
            isSelected: [for (int i=0;i<3;i++) i==_methodIndex],
            onPressed: (i) => setState(() => _methodIndex = i),
            borderRadius: BorderRadius.circular(8),
            selectedColor: Colors.white,
            fillColor: Colors.green[400],
            children: [Padding(padding:EdgeInsets.symmetric(horizontal:12,vertical:8),child:Text('Bank')),
                       Padding(padding:EdgeInsets.symmetric(horizontal:12,vertical:8),child:Text('PayPal')),
                       Padding(padding:EdgeInsets.symmetric(horizontal:12,vertical:8),child:Text('Mobile Money'))],
          ),
          SizedBox(height: 16),
          Expanded(child: SingleChildScrollView(child: _methodForm())),
        ],
      ),
    );
  }
}