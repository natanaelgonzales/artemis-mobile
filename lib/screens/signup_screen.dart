import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proj/core/app_colors.dart';
import 'package:proj/core/app_images.dart';
import '../firebase_options.dart';
import '../login_controllers/fire_auth.dart';
import '../login_controllers/validator.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  }

  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
          body: SingleChildScrollView(
              child:
              Form(
                key: _registerFormKey,
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
                        'Criar uma conta',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Email'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: TextFormField(
                        controller: _nameTextController,
                        focusNode: _focusName,
                        validator: (value) => Validator.validateName(
                          name: value,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Nome completo'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: _passwordTextController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) => Validator.validatePassword(
                          password: value,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Senha'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Confirmar senha'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: double.infinity),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_registerFormKey.currentState.validate()) {
                              User user = await FireAuth.registerUsingEmailPassword(
                                name: _nameTextController.text,
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              );
                              if (user != null) {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(user: user),
                                  ),
                                  ModalRoute.withName('/'),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.blue, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          child: Text('Cadastrar-me'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        ),
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text(
                                'Já tenho uma conta',
                                style: TextStyle(
                                    color: AppColors.pink,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
