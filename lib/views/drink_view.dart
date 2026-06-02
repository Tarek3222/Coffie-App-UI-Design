import 'package:coffie_app/drink_model.dart';
import 'package:coffie_app/widgets/drink_toggle.dart';
import 'package:coffie_app/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrinkView extends StatefulWidget {
  final int currentPage;
  const DrinkView({super.key, required this.currentPage});

  @override
  State<DrinkView> createState() => _DrinkViewState();
}

class _DrinkViewState extends State<DrinkView> {
  late PageController _pageController;
  late double currentPage;
  final drinks = DrinkModel.drinks;
  int selectedIndex = 0;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: widget.currentPage, viewportFraction: 0.5)
          ..addListener(() {
            setState(() {
              currentPage = _pageController.page ?? 0;
            });
          });
    currentPage = widget.currentPage.toDouble();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinks[currentPage.round()].name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "With ${drinks[currentPage.round()].title}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$${drinks[currentPage.round()].price}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              final scale = 1 - (currentPage - index).abs() * 1;
              final translateX = (currentPage - index).abs() * 290;
              return Transform.translate(
                offset: Offset(translateX, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1),
                  child: Stack(
                    children: [
                      Image.asset(
                        drinks[index].image,
                        height: 900,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 185,
                        child: Container(
                          width: 70,
                          height: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black87,
                                blurRadius: 80,
                                spreadRadius: 9,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedIndex == index
                              ? Colors.orangeAccent
                              : Colors.white,
                          border: Border.all(
                            color: selectedIndex == index
                                ? Colors.orange
                                : Colors.black,
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/Vector.svg",
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(child: DrinkToggle()),
                    SizedBox(width: 40),
                    Expanded(child: QuantitySelector()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
