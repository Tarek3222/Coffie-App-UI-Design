// ignore_for_file: deprecated_member_use

import 'package:coffie_app/drink_model.dart';
import 'package:flutter/material.dart';

class DrinkCard extends StatelessWidget {
  const DrinkCard({super.key, required this.drink});
  final DrinkModel drink;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white,
          child: Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.only(bottom: 8, left: 80, right: 16),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 30,
                  spreadRadius: 4,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  drink.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  drink.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 22,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 4,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      blurRadius: 30,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              Image.asset(drink.image, height: 130, fit: BoxFit.cover),
            ],
          ),
        ),
      ],
    );
  }
}
