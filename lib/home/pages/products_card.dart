import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final num price;
  final String imageUrl;
  final int index;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: index % 2 != 0
            ? const Color.fromRGBO(245, 247, 249, 1)
            : const Color.fromRGBO(216, 240, 253, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Center(
            child: Image.asset(
              imageUrl,
              height: 175,
            ),
          )
        ],
      ),
    );
  }
}
