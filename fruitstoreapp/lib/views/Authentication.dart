import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/authentication_controller.dart';
import 'package:provider/provider.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<AuthenticationController>();
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
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: isLogin ? controller.formKeyLogin : controller.formKeyRegister,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isLogin ? "Login Page" : "Register Account",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  isLogin
                      ? SizedBox(
                          height: 0.0,
                        )
                      : TextFormField(
                          controller: controller.usernameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: "username",
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
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: "email",
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
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: controller.obscurePassword,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: "password",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<AuthenticationController>()
                              .actionObscurePassword();
                        },
                        icon: Icon(Icons.visibility),
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
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red)),
                      child: Text(
                        isLogin ? 'Login' : 'Register',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        if (isLogin) {
                          context
                              .read<AuthenticationController>()
                              .login(context);
                        } else {
                          context
                              .read<AuthenticationController>()
                              .register(context);
                        }
                      }
                      // },
                      ),
                  SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLogin ? 'Dont have an account?' : 'Have an account?',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin ? 'Register' : 'Login',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 3, 123, 49),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
