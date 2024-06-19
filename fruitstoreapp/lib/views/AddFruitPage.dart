// views/add_fruit_page.dart

import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/fruit_provider.dart';
import 'package:fruitstoreapp/views/AddCategoryPage.dart';
import 'package:fruitstoreapp/views/ProfilePage.dart';
import 'package:provider/provider.dart';

class AddFruitPage extends StatefulWidget {
  @override
  _AddFruitPageState createState() => _AddFruitPageState();
}

class _AddFruitPageState extends State<AddFruitPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _price = 0.0;
  int _qty = 0;
  int _categoryId = 0;
  String? _url;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
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
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
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
                      onSaved: (value) {
                        _price = double.parse(value!);
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
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
                      onSaved: (value) {
                        _qty = int.parse(value!);
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
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
                      onSaved: (value) {
                        _categoryId = int.parse(value!);
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
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
                      onSaved: (value) {
                        _url = value;
                      },
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.red)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            fruitProvider.createProduct({
                              'name': _name,
                              'price': _price,
                              'qty': _qty,
                              'categoryId': _categoryId,
                              'url': _url,
                            });
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Success"),
                                  content: Text("Success Add Fruit"),
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
                          }
                        },
                        child: Text('Add Fruit',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create new",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => AddcategoryPage()));
                    },
                    child: Text(
                      "Category",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 3, 123, 49)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
