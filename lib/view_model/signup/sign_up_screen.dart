
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tech_media/res/component/input_text_field.dart';
import 'package:tech_media/res/component/round_button.dart';
import 'package:tech_media/utils/utils.dart';
import 'package:tech_media/view_model/signup/signup_controller.dart';

import '../../utils/routes/route_name.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

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
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height * 1 ;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ChangeNotifierProvider(
            create: (_) => SignUpController() ,
            child: Consumer<SignUpController>(
              builder: (context, provider, child){
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * .01,),
                      Text('Welcome to App' , style: Theme.of(context).textTheme.headline3,),
                      SizedBox(height: height * .01,),
                      Text('Enter your email address\nto register your account' ,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1,),
                      SizedBox(height: height * .01,),
                      Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.only(top: height * .06, bottom: height * 0.01),
                            child: Column(
                              children: [
                                InputTextField(
                                  myController: userNameController,
                                  focusNode: userNameFocusNode,
                                  onFiledSubmittedValue: (value){

                                  },
                                  keyBoardType: TextInputType.emailAddress,
                                  obscureText: false,
                                  hint: 'Username',
                                  onValidator: (value){
                                    return value.isEmpty ? 'enter username' : null;

                                  },

                                ),
                                SizedBox(height: height * 0.01,),
                                InputTextField(
                                  myController: emailController,
                                  focusNode: emailFocusNode,
                                  onFiledSubmittedValue: (value){
                                    Utils.fieldFocus(context, emailFocusNode, passwordFocusNode);

                                  },
                                  keyBoardType: TextInputType.emailAddress,
                                  obscureText: false,
                                  hint: 'Email',
                                  onValidator: (value){
                                    return value.isEmpty ? 'enter email' : null;

                                  },

                                ),
                                SizedBox(height: height * 0.01,),
                                InputTextField(
                                    myController: passwordController,
                                    focusNode: passwordFocusNode,
                                    onFiledSubmittedValue: (value){

                                    },
                                    keyBoardType: TextInputType.emailAddress,
                                    obscureText: true,
                                    hint: 'Password',
                                    onValidator: (value){
                                      return value.isEmpty ? 'enter password' : null;

                                    }

                                ),


                              ],

                            ),
                          )
                      ),


                      const SizedBox(height: 40,),
                      RoundButton(
                          title: 'Sign Up' ,
                          loading: provider.loading,
                          onPress: (){
                            print('tap');
                            if(_formKey.currentState!.validate()){
                            provider.signup(context , userNameController.text, emailController.text, passwordController.text);
                            }
                          }

                      ),
                      SizedBox(height: height * .03,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RouteName.loginView);
                        },
                        child: Text.rich(
                            TextSpan(
                                text: "Already have an account? ",
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15),
                                children: [
                                  TextSpan(
                                      text: 'Login',
                                      style: Theme.of(context).textTheme.headline2!.copyWith(
                                          fontSize: 15 ,
                                          decoration: TextDecoration.underline
                                      )
                                  )
                                ]
                            )

                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );

  }
  }
