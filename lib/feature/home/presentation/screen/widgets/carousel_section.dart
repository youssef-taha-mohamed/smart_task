import 'package:flutter/material.dart';
import '../../../data/model/profit_model.dart';
import 'call_card.dart';
import 'profit_card.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Total number of items (profit cards + call to action card)
    final int totalItems = profitList.length + 1;

    return Column(
      children: [
        // Main card carousel
        SizedBox(
          height: 147,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: totalItems,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              if (index == profitList.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CallToActionCard(),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ProfitCardWidget(
                  profit: profitList[index],
                ),
              );
            },
          ),
        ),

        // Dynamic indicators
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalItems,
              (index) => Container(
                width: _currentIndex == index ? 16 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color:
                      _currentIndex == index ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
