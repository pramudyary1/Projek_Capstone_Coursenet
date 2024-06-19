import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/fruit_provider.dart';
import 'package:provider/provider.dart';

class EditfruitPage extends StatefulWidget {
  final int productId;

  const EditfruitPage({super.key, required this.productId});

  @override
  _EditfruitPageState createState() => _EditfruitPageState();
}

class _EditfruitPageState extends State<EditfruitPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController qtyController;
  late TextEditingController categoryIdController;
  late TextEditingController urlController;

  @override
  void initState() {
    super.initState();
    final fruitProvider = Provider.of<FruitProvider>(context, listen: false);
    final fruit =
        fruitProvider.products.firstWhere((p) => p.id == widget.productId);

    nameController = TextEditingController(text: fruit.name);
    priceController = TextEditingController(text: fruit.price.toString());
    qtyController = TextEditingController(text: fruit.qty.toString());
    categoryIdController =
        TextEditingController(text: fruit.categoryId.toString());
    urlController = TextEditingController(text: fruit.url ?? '');
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    qtyController.dispose();
    categoryIdController.dispose();
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
        title: Text(
          "Fruit House",
          style: TextStyle(
              color: Color.fromARGB(255, 3, 123, 49),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "name",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 24, top: 16, bottom: 16),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: priceController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "Price",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 24, top: 16, bottom: 16),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: qtyController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "Quantity",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 24, top: 16, bottom: 16),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a quantity';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: categoryIdController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "category id",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 24, top: 16, bottom: 16),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a category ID';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: urlController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "image url",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 24, top: 16, bottom: 16),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 3, 123, 49),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            final fruitProvider = Provider.of<FruitProvider>(
                                context,
                                listen: false);
                            fruitProvider.updateProduct(widget.productId, {
                              'name': nameController.text,
                              'price': double.parse(priceController.text),
                              'qty': int.parse(qtyController.text),
                              'categoryId':
                                  int.parse(categoryIdController.text),
                              'url': urlController.text,
                            }).then((_) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Success"),
                                    content: Text("Fruit updated successfully"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Continue"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }).catchError((error) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content:
                                        Text("Failed to update fruit: $error"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Continue"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          }
                        },
                        child: Text('Update Fruit',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
