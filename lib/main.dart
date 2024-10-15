import 'package:flutter/material.dart';
import 'login.dart'; // Import the login page
import 'productviewpage.dart';

void main() {
  runApp(PhoneStoreApp());
}

class PhoneStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Store',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoggedIn = false;

  void _login() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return _isLoggedIn
        ? ProductViewPage(logoutCallback: _logout) // Pass the logout callback
        : LoginPage(loginCallback: _login); // Pass the login callback
  }
}
