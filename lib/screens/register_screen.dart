import 'package:dine/utils/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final Auth _auth = Auth();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late bool _success = false;
  late bool _passwordVisible = true;
  late bool _confirmPasswordVisible = true;
  late bool _errorOccured = false;
  late bool _isLoading = false;

  String _errorMessage = 'Error occured, try again';

  Future<void> _register() async {
    try {
      await _auth.signupWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message!;
      });
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                      color: Color(0xFF122E40),
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Full name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.none,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter name',
                  ),
                  validator: (value) {
                    if (value is String) {
                      if (value.isEmpty) {
                        return 'Please enter your name';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.none,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value is String) {
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _passwordVisible,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        icon: _passwordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      )),
                  validator: (value) {
                    if (value is String) {
                      if (value.isEmpty) {
                        return 'Please enter a password';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Confirm password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _confirmPasswordVisible,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      hintText: 'Re-enter your password',
                      suffixIcon: IconButton(
                        icon: _confirmPasswordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                      )),
                  validator: (value) {
                    if (value is String) {
                      if (value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Text(_isLoading ? "Loading..." : ""),
                _errorOccured
                    ? Text(
                        _errorMessage,
                        style: const TextStyle(color: Colors.red),
                      )
                    : Text(''),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)))),
                    child: const Text('Register'),
                    onPressed: () {
                      // It returns true if the form is valid, otherwise returns false
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a Snackbar.
                        setState(() {
                          _isLoading = true;
                          _errorOccured = false;
                        });
                        _register().then((value) {
                          setState(() {
                            _isLoading = false;
                            _success = true;
                          });
                          if (_auth.currentUser != null) {
                            Navigator.of(context).pushReplacementNamed('/');
                          } else {
                            Navigator.of(context).pushReplacementNamed('/login');
                          }
                        }).catchError((e) {
                          setState(() {
                            _isLoading = false;
                            _success = false;
                            _errorOccured = true;
                          });
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed('/login');
                        },
                        child: Text('Login'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
