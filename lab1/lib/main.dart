import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Reducere',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DiscountCalculatorPage(),
    );
  }
}

class DiscountCalculatorPage extends StatefulWidget {
  const DiscountCalculatorPage({super.key});

  @override
  State<DiscountCalculatorPage> createState() => _DiscountCalculatorPageState();
}

class _DiscountCalculatorPageState extends State<DiscountCalculatorPage> {
  // Controller pentru prețul inițial
  final TextEditingController _priceController = TextEditingController();

  // Controller pentru procentul de reducere introdus manual
  final TextEditingController _customDiscountController = TextEditingController();

  // Opțiune predefinită selectată în Dropdown
  double _selectedDiscount = 10.0;

  // Modul de reducere: false = Dropdown (preset), true = Manual (TextField)
  bool _useCustomDiscount = false;

  // Valori de ieșire (Output)
  double _discountAmount = 0.0;
  double _finalPrice = 0.0;
  bool _calculated = false;

  void _calculateDiscount() {
    // Preluăm prețul din TextField
    double price = double.tryParse(_priceController.text) ?? 0.0;

    // Determinăm procentul de reducere folosit
    double discountPercent = 0.0;
    if (_useCustomDiscount) {
      discountPercent = double.tryParse(_customDiscountController.text) ?? 0.0;
    } else {
      discountPercent = _selectedDiscount;
    }

    // Calculăm valoarea reducerii și prețul final
    setState(() {
      _discountAmount = (price * discountPercent) / 100;
      _finalPrice = price - _discountAmount;
      _calculated = true;
    });
  }

  @override
  void dispose() {
    _priceController.dispose();
    _customDiscountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator de Reducere'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAlignment.stretch,
          children: [
            // Input 1: Preț inițial (TextField)
            TextField(
              controller: _priceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Preț inițial (MDL)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 20),

            // UI Control: RadioButtons
            const Text(
              'Selectează modul de reducere:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Presetat'),
                    value: false,
                    groupValue: _useCustomDiscount,
                    onChanged: (bool? value) {
                      setState(() {
                        _useCustomDiscount = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Manual'),
                    value: true,
                    groupValue: _useCustomDiscount,
                    onChanged: (bool? value) {
                      setState(() {
                        _useCustomDiscount = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Switch între Dropdown și TextField manual în funcție de alegere
            if (!_useCustomDiscount)
            // UI Control: DropdownButton
              DropdownButtonFormField<double>(
                value: _selectedDiscount,
                decoration: const InputDecoration(
                  labelText: 'Procent reducere predefinit',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 5.0, child: Text('5%')),
                  DropdownMenuItem(value: 10.0, child: Text('10%')),
                  DropdownMenuItem(value: 15.0, child: Text('15%')),
                  DropdownMenuItem(value: 20.0, child: Text('20%')),
                  DropdownMenuItem(value: 50.0, child: Text('50%')),
                ],
                onChanged: (double? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedDiscount = newValue;
                    });
                  }
                },
              )
            else
            // Input 2: Procent reducere manual (TextField)
              TextField(
                controller: _customDiscountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Procent reducere manual (%)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.percent),
                ),
              ),

            const SizedBox(height: 24),

            // UI Control: ElevatedButton (Calculează)
            ElevatedButton(
              onPressed: _calculateDiscount,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'CALCULEAZĂ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 30),

            // Output: Afișare rezultate (Text)
            if (_calculated)
              Card(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Valoarea reducerii: ${_discountAmount.toStringAsFixed(2)} MDL',
                        style: const TextStyle(fontSize: 18, color: Colors.redAccent),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Preț final: ${_finalPrice.toStringAsFixed(2)} MDL',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}