import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../models/registerNewAccount.dart';
import '../../../models/signin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myControllerEmailTextField = TextEditingController();
  final myControllerPasswordTextField = TextEditingController();
  final myControllerConfirmPasswordTextField = TextEditingController();
  var isRegister = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: this.isRegister ? Text('Register') : Text('Login'),
          leading: CloseButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120.0,
                height: 120.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/main_logo.png'),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email'),
                          TextField(
                            controller: myControllerEmailTextField,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password'),
                          TextFormField(
                              controller: myControllerPasswordTextField)
                        ],
                      ),
                    ),
                    isRegister
                        ? AnimatedContainer(
                            duration: Duration(seconds: 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Confirm Password'),
                                TextFormField(
                                    controller:
                                        myControllerConfirmPasswordTextField)
                              ],
                            ),
                          )
                        : Container(),
                    TextButton(
                      onPressed: () {
                        this.isRegister
                            ? register(
                                context,
                                myControllerEmailTextField.value.text.trim(),
                                myControllerPasswordTextField.value.text.trim())
                            : signIn(
                                context,
                                myControllerEmailTextField.value.text.trim(),
                                myControllerPasswordTextField.value.text
                                    .trim());
                        print(FirebaseAuth.instance.currentUser);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white12)),
                      child: Text(isRegister ? 'Register' : 'Login'),
                    ),
                    // AlternativeWay(),
                  ],
                ),
              ),
              isRegister
                  ? RichText(
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(),
                        children: <TextSpan>[
                          const TextSpan(text: "Already have an account? "),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  this.isRegister = false;
                                });
                              },
                            text: 'Login',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    )
                  : RichText(
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(),
                        children: <TextSpan>[
                          TextSpan(text: "Don't have an acoount? "),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  isRegister = true;
                                });
                              },
                            text: 'Register',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ));
  }
}
