import 'package:appTemplate/models/login.dart';
import 'package:appTemplate/navigation/routing_constraints.dart';
import 'package:flutter/material.dart';
import '../requests/generic-functions.dart' as functions;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username;
  String _password;
  LoginResponse data;
  // LoginResponse data;

  final snackBar = SnackBar(
    content: Text(
      'Failed to sign in',
      style: TextStyle(color: Colors.red),
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  signIn() async {
    var signInResponse =
        await functions.login(username: _username, password: _password);
    if (signInResponse != 'error') {
      var res = LoginResponse.fromJson(signInResponse);
      data = res;
      // TODO: Add login failiure exceptions
      if (res.token.length > 1) {

        //TODO: Set data in local storage

        var navigationResult =
            await Navigator.pushNamed(context, MainViewRoute, arguments: data);

        if (navigationResult == 'Logged out') {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(title: Text(navigationResult)));
        }
      } else {
        print('failed to login');
      }
    } else {
      // Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: (FloatingActionButton(
          onPressed: () async {
            _username = 'jxchumber';
            _password = 'password';
            signIn();
          },
        )),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(),
                  child: Image.asset('images/logo-transparent.png')),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, bottom: 25),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              )
                            ],
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(1)),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your username'),
                          onChanged: (text) {
                            _username = text;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              )
                            ],
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(1)),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your Password'),
                          onChanged: (text) {
                            _password = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue, Colors.red],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: InkWell(
                          onTap: () {
                            signIn();
                            // signIn();
                          },
                          child: Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontFamily: ('Edo'),
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Forgot password?',
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SignupViewRoute,
                      arguments: data);
                },
                child: Text(
                  'No Account? Sign up',
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
