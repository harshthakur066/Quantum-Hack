import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medline/pages/chat_screen.dart';
import 'package:medline/pages/patient/plogin.dart';

class PatientSignupScreen extends StatefulWidget {
  @override
  _PatientSignupScreenState createState() => _PatientSignupScreenState();
}

class _PatientSignupScreenState extends State<PatientSignupScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email, password;
//  Future<void> psignup(email, password) async {
//    const url =
//        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBc4t_OuOyX8DMDi_EEhVq5_4PGhQuS1dM';
//    try {
//      await http.post(
//        url,
//        body: json.encode({
//          'email': email,
//          'password': password,
//          'returnSecureToken': true,
//        }),
//      );
//    } catch (err) {
//      print(err);
//    }
//  }

  var person = Icons.person;
  String pname;
  String pnumber;

  @override
  Widget build(BuildContext context) {
    final phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        //height: phoneHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Align(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Please enter your credentials'),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          //obscureText: obscureText,
                          onChanged: (value) {
                            setState(() {
                              pname = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Username',
                            prefixIcon:
                                Icon(Icons.person, color: Color(0xFF08ffbd)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          //obscureText: obscureText,
                          onChanged: (value) {
                            setState(() {
                              pnumber = value;
                            });
                          },

                          decoration: InputDecoration(
                            hintText: 'Enter Mobile Number',
                            prefixIcon:
                                Icon(Icons.phone, color: Color(0xFF08ffbd)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          //obscureText: obscureText,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },

                          decoration: InputDecoration(
                            hintText: 'Enter Email ID',
                            prefixIcon:
                                Icon(Icons.email, color: Color(0xFF08ffbd)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          //obscureText: obscureText,
                          onChanged: (value) {
                            setState(() {
                              print('value $value');
                              password = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            prefixIcon:
                                Icon(Icons.vpn_key, color: Color(0xFF08ffbd)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          onPressed: () async {
//                            print('$pemail and $ppassword');
//                            psignup(pemail, ppassword);
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ChatScreen()));
                              }
                            } catch (e) {
                              print(e);
                            }
//                            Navigator.of(context).push(MaterialPageRoute(
//                                builder: (context) => HomePage()));
                          },
                          child: Text('SIGN UP',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          height: 50,
                          minWidth: double.infinity,
                          color: Color(0xFF08ffbd),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PatientLoginScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already Registered?'),
                              SizedBox(width: 5),
                              Text(
                                'Login!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
