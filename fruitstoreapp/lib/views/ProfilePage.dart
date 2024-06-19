import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/authentication_controller.dart';
import 'package:fruitstoreapp/controllers/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? pathFiles;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.fetchUserProfile();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        pathFiles = image.path;
      });
    }
  }

  Future<void> _uploadImage() async {
    if (pathFiles == null) return;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      await userProvider.uploadImage(pathFiles!);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Image uploaded successfully')));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => ProfilePage()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to upload image')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
        title: Text(
          "Fruit House",
          style: TextStyle(
              color: Color.fromARGB(255, 3, 123, 49),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (userProvider.hasError) {
            return Center(child: Text('Error fetching profile'));
          } else {
            final user = userProvider.user;
            return SingleChildScrollView(
              padding: EdgeInsets.only(left: 18, right: 18, top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (user?.image != null)
                    ClipOval(
                      child: Container(
                        width: 160,
                        height: 160,
                        color: Colors.grey,
                        child: Image.network(
                          'http://192.168.1.11:3000/images/${user?.image}',
                          fit: BoxFit
                              .cover, // Adjust the fit as per your requirement
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 32,
                  ),
                  if (pathFiles != null)
                    Column(
                      children: [
                        Text(
                          "Change to this photo: ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Image.file(
                          File(pathFiles!),
                          width: 120,
                          height: 120,
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: _pickImage,
                        child: Text(
                          'Pick Image',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 3, 123, 49)),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 3, 123, 49)),
                        onPressed: _uploadImage,
                        child: Text(
                          'Upload Image',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Information",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        'Username: ${user?.username}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        '${user?.email}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
