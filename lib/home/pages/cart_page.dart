import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/home/extra/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context).cart;
    final cart = context.watch<CartProvider>().cart;

    if (cart.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cart"),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartitem = cart[index];

            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  cartitem['imageUrl'].toString(),
                ),
              ),
              title: Text(
                cartitem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text("Size: ${cartitem['size']}"),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Delete Product",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: Text(
                            "Are you sure?",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeProduct(cartitem);
                                // Provider.of<CartProvider>(context, listen: false)
                                //     .removeProduct(cartitem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          },
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text(
            "Cart is empty",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                ),
          ),
        ),
      );
    }
  }
}
