import 'package:flutter/material.dart';

class Productdetailspage extends StatelessWidget {
  final Map<String, Object> product;
  const Productdetailspage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Text(
                  "\$${product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                ListView.builder(
                  itemCount: (product['sizes'] as List<int>).length,
                  itemBuilder: (context, index) {
                    final Size = (product['sizes']! as List<int>)[index];

                    return Chip(
                      label: Text(
                        Size.toString(),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
