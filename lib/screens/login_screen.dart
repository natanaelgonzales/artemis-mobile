import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proj/core/app_colors.dart';
import 'package:proj/core/app_images.dart';
import 'package:proj/screens/home_screen.dart';
import 'package:proj/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';
import '../login_controllers/fire_auth.dart';
import '../login_controllers/validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

    User user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
          body: FutureBuilder(
              future: _initializeFirebase(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    child:
                    Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.logo_login,
                          fit: BoxFit.fitWidth,
                          width: double.maxFinite,
                          // height: 180,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 26),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'E-mail'),
                            controller: _emailTextController,
                            focusNode: _focusEmail,
                            validator: (value) =>
                                Validator.validateEmail(email: value),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Senha'),
                            controller: _passwordTextController,
                            focusNode: _focusPassword,
                            obscureText: true,
                            validator: (value) =>
                                Validator.validatePassword(password: value),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints.tightFor(width: double.infinity),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  User user =
                                      await FireAuth.signInUsingEmailPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text,
                                  );
                                  if (user != null) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.blue, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              child: Text('Entrar'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()),
                                  (route) => false);
                            },
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                  child: Text(
                                'Não tem uma conta?',
                                style: TextStyle(
                                    color: AppColors.pink,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                  child: Text(
                                'Esqueci minha senha',
                                style: TextStyle(
                                    color: AppColors.pink,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
