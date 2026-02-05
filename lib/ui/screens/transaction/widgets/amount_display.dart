import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// "0.00"

class AmountDisplay extends StatefulWidget {
  final double amount;
  final ValueChanged<double> onAmountChanged;

  /// En el caso de finovate será 'S/.'
  final String currencySymbol;

  const AmountDisplay({
    super.key,
    required this.amount,
    required this.onAmountChanged,
    this.currencySymbol = 'S/.',
  });

  @override
  State<AmountDisplay> createState() => _AmountDisplayState();
}

class _AmountDisplayState extends State<AmountDisplay> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.amount == 0.0 ? '' : widget.amount.toStringAsFixed(2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.currencySymbol,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        IntrinsicWidth(
          child: TextField(
            controller: _controller,
            onChanged: (value) {
              final amount = double.tryParse(value) ?? 0.0;
              widget.onAmountChanged(amount);
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.0,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: '0.00',
              hintStyle: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
                height: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
