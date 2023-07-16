import 'package:flutter/material.dart';
import 'package:shop_app_flutter/home/pages/product_details.dart';
import 'package:shop_app_flutter/home/pages/products_card.dart';

import '../../global_variable.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  final List<String> filter = const [
    'All',
    'Addidas',
    'Nike',
    'Bata',
    'Puma',
    'Apex'
  ];

  late String selectedFilter = filter[0];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    selectedFilter = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return SafeArea(
      
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (context, index) {
                final filters = filter[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filters;
                      });
                    },
                    child: Chip(
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      backgroundColor: selectedFilter == filters
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      label: Text(filters),
                      labelStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Productdetailspage(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'].toString(),
                    price: product['price'] as num,
                    imageUrl: product['imageUrl'] as String,
                    index: index,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
