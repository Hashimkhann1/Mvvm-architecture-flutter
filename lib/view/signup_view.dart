import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button_widget.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';


class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  ValueNotifier<bool> _obsurePassword = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusScopeNode();
  FocusNode passwordFocusNode = FocusScopeNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);
    final screenHighth = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign up'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChage(context, emailFocusNode, passwordFocusNode);
                },
                decoration: const InputDecoration(
                    hintText: "Email",
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email)
                ),
              ),
              ValueListenableBuilder(valueListenable: _obsurePassword, builder: (context , value , child) {
                return TextFormField(
                  controller: passwordController,
                  obscuringCharacter: '*',
                  focusNode: passwordFocusNode,
                  obscureText: _obsurePassword.value,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_open_outlined),
                      suffixIcon: InkWell(onTap: () {
                        _obsurePassword.value = !_obsurePassword.value;
                      }, child: Icon(!_obsurePassword.value ? Icons.visibility : Icons.visibility_off))
                  ),
                  onFieldSubmitted: (value){
                    FocusScope.of(context).requestFocus();
                  },
                );
              }),
              SizedBox(height: screenHighth * 0.070,),
              RoundButtonWidget(title: 'Sign Up',loading: authViewModel.signupLoading, onPress: (){
                if(emailController.text.isEmpty){
                  Utils.flutterFlashBarMessage('Please enter Gmail', Colors.black26, context);
                }else if(passwordController.text.isEmpty){
                  Utils.flutterFlashBarMessage('Please enter Password', Colors.black26, context);
                }else if(passwordController.text.length < 6){
                  Utils.flutterFlashBarMessage('Please enter 6 digit password', Colors.black26, context);
                }else{
                  Map data = {
                    'email' : emailController.text.toString(),
                    'password' : passwordController.text.toString(),
                  };
                  authViewModel.signUpApi(data , context);
                }
              },),
              const SizedBox(height: 20.0,),
              InkWell(onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              }, child: const Text("Already have an account? Login")),

            ],
          ),
        )
    );
  }
}
