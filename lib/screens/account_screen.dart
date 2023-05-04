//import 'package:dine/utils/Auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show AppBar, AssetImage, BlendMode, BorderRadius, BoxDecoration, BoxFit, BoxShape, BuildContext, Center, Color, ColorFilter, Colors, Column, Container, CrossAxisAlignment, DecorationImage, EdgeInsets, ElevatedButton, FontWeight, Form, FormState, GlobalKey, Icon, IconThemeData, Icons, InputDecoration, MainAxisAlignment, MainAxisSize, OutlineInputBorder, Padding, Radius, RoundedRectangleBorder, Scaffold, SingleChildScrollView, SizedBox, State, StatefulWidget, Text, TextButton, TextEditingController, TextFormField, TextInputAction, TextInputType, TextStyle, Widget;
// final Auth _auth = Auth();

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AccountScreenState();
  }
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subsctiptionController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _subsctiptionController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account details',
          style: TextStyle(
              color: Color(0xFF122E40),
              fontSize: 32.0,
              fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFF3F9FB),
      ),
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
                Center(
                    child: Column(
                      children: [
                        Container(
                          // width: 320.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: const AssetImage('images/Vector.png'),
                              fit: BoxFit.fitHeight,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5), BlendMode.darken),
                            ),
                          ),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Colors.white70,
                            ),
                            label: const Text(
                              'Change photo',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ],
                    )),
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
                  'Subscription type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _subsctiptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter the subscription type',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)))),
                    child: const Text('Save'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}