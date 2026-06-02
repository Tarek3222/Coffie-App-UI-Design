import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton("-", () {
            if (quantity > 1) {
              setState(() {
                quantity--;
              });
            }
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("$quantity", style: const TextStyle(fontSize: 18)),
          ),
          _buildButton("+", () {
            setState(() {
              quantity++;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      ),
    );
  }
}
