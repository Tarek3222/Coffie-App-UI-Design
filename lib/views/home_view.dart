// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:coffie_app/drink_model.dart';
import 'package:coffie_app/views/drink_view.dart';
import 'package:coffie_app/widgets/drink_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Menu',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        actions: [
          Image.asset("assets/cart.png", width: 24, height: 24),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.separated(
          controller: _scrollController,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) => AnimatedBuilder(
            animation: _scrollController,
            builder: (context, child) {
              double offset = 0;
              if (_scrollController.hasClients) {
                offset = _scrollController.offset / 130 - index;
                log(
                  "Scroll Offset: ${_scrollController.offset}, Item Index: $index, Calculated Offset: $offset",
                );
              }
              offset = offset.clamp(0, 1);
              log("Clamped Offset for Item $index: $offset");
              return Transform.scale(scale: 1 - offset * 0.2, child: child);
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrinkView(currentPage: index),
                  ),
                );
              },
              child: DrinkCard(drink: DrinkModel.drinks[index]),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 30),
          itemCount: DrinkModel.drinks.length,
        ),
      ),
    );
  }
}
