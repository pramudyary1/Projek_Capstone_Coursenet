import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/fruit_provider.dart';
import 'package:fruitstoreapp/views/EditFruitPage.dart';
import 'package:fruitstoreapp/views/ProfilePage.dart';
import 'package:provider/provider.dart';

class ItemsFruitPage extends StatefulWidget {
  const ItemsFruitPage({super.key});

  @override
  State<ItemsFruitPage> createState() => _ItemsFruitPageState();
}

class _ItemsFruitPageState extends State<ItemsFruitPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FruitProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final fruitProvider = Provider.of<FruitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfilePage()));
            },
            icon: Icon(Icons.person),
          ),
        ],
        title: Text(
          "Fruit House",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: fruitProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 32),
              child: ListView.builder(
                itemCount: fruitProvider.products.length,
                itemBuilder: (context, index) {
                  final product = fruitProvider.products[index];
                  return Dismissible(
                    key: Key(product.id
                        .toString()), // Ensure each item has a unique key
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      fruitProvider.deleteProduct(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${product.name} deleted"),
                        ),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        side: BorderSide(color: Colors.transparent),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.network(
                                  product.url!,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  '\$${product.price}',
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/editFruitPage',
                                    arguments: product.id);
                              },
                              child: Text(
                                'Edit',
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
