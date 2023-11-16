import 'package:flutter/material.dart';
import 'package:task_manager/screens/home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  FocusNode _emailFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  FocusNode _nameFocus = FocusNode();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _passwordFocus = FocusNode();
  TextEditingController _surnameController = TextEditingController();
  FocusNode _surnameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFB8E1DD),
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              focusNode: _nameFocus,
              decoration: InputDecoration(labelText: 'Ad'),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Name cant be empty";
                }
                return null;
              },
              onEditingComplete: () {
                _fieldFocusChange(context, _nameFocus, _surnameFocus);
              },
            ),
            TextFormField(
              controller: _surnameController,
              focusNode: _surnameFocus,
              decoration: InputDecoration(labelText: 'Surname'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Surname cant be empty';
                }
                return null;
              },
              onEditingComplete: () {
                _fieldFocusChange(context, _surnameFocus, _emailFocus);
              },
            ),
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocus,
              decoration: InputDecoration(labelText: 'E-mail'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'E-mail cant be empty';
                } else if (!value.contains('@')) {
                  return 'Enter a valid email';
                }
                return null;
              },
              onEditingComplete: () {
                _fieldFocusChange(context, _emailFocus, _passwordFocus);
              },
            ),
            TextFormField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password cant be empty';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

void _fieldFocusChange(
  BuildContext context,
  FocusNode currentFocus,
  FocusNode nextFocus,
) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
