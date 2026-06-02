import 'package:flutter/material.dart';

class DrinkToggle extends StatefulWidget {
  const DrinkToggle({super.key});

  @override
  State<DrinkToggle> createState() => _DrinkToggleState();
}

class _DrinkToggleState extends State<DrinkToggle> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  color: selectedIndex == 0 ? Colors.white : Colors.grey[400],
                ),
                child: const Center(
                  child: Text(
                    "Hot",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  color: selectedIndex == 1 ? Colors.white : Colors.grey[400],
                ),
                child: const Center(
                  child: Text(
                    "Iced",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
