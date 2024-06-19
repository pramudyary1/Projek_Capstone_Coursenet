import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/fruit_provider.dart';
import 'package:fruitstoreapp/views/DetailFruitPage.dart';
import 'package:fruitstoreapp/views/ProfilePage.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
              color: Color.fromARGB(255, 3, 123, 49),
              fontWeight: FontWeight.bold,
              fontSize: 24),
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
                  return Card(
                    elevation: 2,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      side: BorderSide(
                          color: Color.fromARGB(255, 3, 123, 49), width: 2.0),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListTile(
                        leading: product.url!.isEmpty
                            ? Image.asset(
                                "assets/images/profile.png",
                                width: 72,
                                height: 72,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: 72,
                                height: 72,
                                child: Image.network(
                                  product.url!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        title: Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        subtitle: Text(
                          '\$${product.price}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 3, 123, 49),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Fruitdetailpage(productId: product.id),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
