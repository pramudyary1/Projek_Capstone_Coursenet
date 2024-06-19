import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/fruit_provider.dart';
import 'package:provider/provider.dart';

class Fruitdetailpage extends StatelessWidget {
  final int productId;

  Fruitdetailpage({required this.productId});

  @override
  Widget build(BuildContext context) {
    final fruitProvider = Provider.of<FruitProvider>(context);
    final fruit = fruitProvider.products.firstWhere((p) => p.id == productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fruit House",
          style: TextStyle(
              color: Color.fromARGB(255, 3, 123, 49),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                    side: BorderSide(
                      color: Color.fromARGB(255, 3, 123, 49),
                      width: 1,
                    )),
                color: Colors.blueAccent[600],
                child: Image.network(fruit.url!)),
            SizedBox(
              height: 24,
            ),
            Text('${fruit.name}',
                style: TextStyle(
                    fontSize: 36,
                    color: Color.fromARGB(255, 3, 123, 49),
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            Text('\$${fruit.price}.00',
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 3, 123, 49),
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            Text('Qty: ${fruit.qty}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
