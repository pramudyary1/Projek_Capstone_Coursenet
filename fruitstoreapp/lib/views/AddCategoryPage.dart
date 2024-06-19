// views/add_fruit_page.dart

import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/category_provider.dart';
import 'package:fruitstoreapp/views/ProfilePage.dart';
import 'package:provider/provider.dart';

class AddcategoryPage extends StatefulWidget {
  @override
  _AddcategoryPageState createState() => _AddcategoryPageState();
}

class _AddcategoryPageState extends State<AddcategoryPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

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
      body: Padding(
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
                      contentPadding:
                          const EdgeInsets.only(left: 24, top: 16, bottom: 16),
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
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          categoryProvider.createCategory({
                            'name': _name,
                          });
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Success"),
                                content: Text("Success Add Category"),
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
                      child: Text('Add Category',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
