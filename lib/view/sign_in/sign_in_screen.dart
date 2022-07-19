import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/view/sign_in/bloc/sign_in_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          emailController.text, passwordController.text));
                },
                decoration: InputDecoration(hintText: "Email"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          emailController.text, passwordController.text));
                },
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if(state is SignInLoadingState){
                    return CircularProgressIndicator();
                  }
                  return CupertinoButton(
                    child: Text('Sign In'),
                    onPressed: () {
                      if(state is SignInValidState){
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmittedEvent(
                                emailController.text, passwordController.text));
                      }

                    },
                    color:
                        (state is SignInValidState) ? Colors.blue : Colors.grey,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
