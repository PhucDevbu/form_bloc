import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/view/sign_in/bloc/sign_in_bloc.dart';
import 'package:form_bloc/view/sign_in/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => SignInBloc(),
                              child: SignInScreen(),
                            )
                        ));
                  },
                  color: Colors.blue,
                  child: Text("Sign In With Email"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text("Sign In With Google"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
