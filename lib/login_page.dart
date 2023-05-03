import 'package:flutter/material.dart';
import 'package:flutter_begin/util/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      //   color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "asserts/images/login_undraw.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $name",
              style: const TextStyle(
                  fontSize: 28, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  /* ElevatedButton(onPressed: (){
                   Navigator.pushNamed(context, MyRoutes.homeRoute);
                   print("Hello World");
                 },
                   style: TextButton.styleFrom(
                     backgroundColor: Colors.red,
                     padding: const EdgeInsets.symmetric(horizontal: 16),
                     minimumSize: const Size(180, 40)
                   ),
                     child: const Text("Login"),
                 )*/
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          //shape: changeButton?BoxShape.circle : BoxShape.rectangle,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8.0)),
                      duration: const Duration(seconds: 1),
                      child: changeButton
                          ? const Icon(Icons.done)
                          : const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
