

import 'package:flutter/material.dart';
import 'package:webart_technology_assessment/pages/home_page.dart';
import 'package:webart_technology_assessment/utils/api_calls.dart';
import '../utils/routes.dart';

void main(){
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool login=true;
  bool otp=false;
  String email="";
  String password="";
  String name="";
  String otpNumber="";
  final _formKey=GlobalKey<FormState>();
  var api=ConnectionToApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset("assets/images/login.jpg",fit: BoxFit.fill,),
          ),
          Center(child: Text("Welcome",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
          SizedBox(height: 5,),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),




                child:
              login?
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      key: ValueKey('email'),
                      validator: (value){
                        if(value!.isEmpty){
                          return "please enter email!";
                        }else
                          return null;
                      },
                      onSaved: (value){
                        email=value!;
                      },
                      decoration:InputDecoration(
                        hintText: "Enter email",
                        labelText: "email",
                      ),
                    ),
                    TextFormField(
                      key: ValueKey('password'),
                      validator: (value){
                        if(value!.isEmpty){
                          return "please enter password!";
                        }else
                          return null;
                      },
                      onSaved: (value){
                        password=value!;
                      },
                      obscureText: true,
                      decoration:InputDecoration(
                        hintText: "Enter Password",
                        labelText: "password",
                      ),
                    ),
                    SizedBox(height: 20,),
                    ////////////////////////// Login ////////////////////////////////////////////////

                    ElevatedButton(
                        onPressed: () async{
                          if(_formKey.currentState!.validate()) {
                             _formKey.currentState!.save();
                             var response=await api.login(email,password);
                             if(response['success']==1){
                               // ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                               //   content: Text("welcome Mr. "+ response['data']['name']),
                               // ));
                               Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage(name: response['data']['name'])));
                             }else{
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 content: Text(response['message']),
                               ));
                             }
                          }
                          },
                        style: TextButton.styleFrom(minimumSize: Size(60, 40)),
                        child: Text("Login")
                    ),
                  ],
                ),
              )



              :
              otp?
                 Container(
                   child: Column(
                     children: [
                       TextFormField(
                         key: ValueKey('otpNumber'),
                         validator: (value){
                           if(value!.isEmpty){
                             return "please enter otp received on your mail!";
                           }else
                             return null;
                         },
                         onSaved: (value){
                           otpNumber=value!;
                         },
                         decoration: InputDecoration(
                           hintText: "enter otp received in your mail",
                           labelText: 'OTP',
                         ),
                       ),
                       ////////////////////////// O T P ///////////////////////////////////////////////////////

                       ElevatedButton(
                           onPressed: () async {
                             if(_formKey.currentState!.validate()) {
                             _formKey.currentState!.save();
                             var response=await api.otp(email,password,otpNumber);

                             if(response['success']==1){
                               Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage(name: name)));
                             }else{
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 content: Text(response['message']),
                               ));
                             }
                             }
                           },
                           child: Text('Submit'),
                       ),

                     ],
                   ),
                 )
              :
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      key: ValueKey('name'),
                      validator: (value){
                        if(value!.isEmpty){
                          return "please enter name!";
                        }else
                          return null;
                      },
                      onSaved: (value){
                        name=value!;
                      },
                      decoration:InputDecoration(
                        hintText: "Enter name",
                        labelText: "name",
                      ),
                    ),
                    TextFormField(
                      key: ValueKey('email'),
                      validator: (value){
                        if(value!.isEmpty){
                          return "please enter email!";
                        }else
                          return null;
                      },
                      onSaved: (value){
                        email=value!;
                      },
                      decoration:InputDecoration(
                        hintText: "Enter email",
                        labelText: "email",
                      ),
                    ),
                    TextFormField(
                      key: ValueKey('password'),
                      validator: (value){
                        if(value!.isEmpty){
                          return "please enter password!";
                        }else
                          return null;
                      },
                      onSaved: (value){
                        password=value!;
                      },
                      obscureText: true,
                      decoration:InputDecoration(
                        hintText: "Enter Password",
                        labelText: "password",
                      ),
                    ),
                    SizedBox(height: 20,),

                ////////////////////////// SignUp ////////////////////////////////////////////////
                    ElevatedButton(
                        onPressed: () async {
                          if(_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          var response=await api.signup(name,email,password);
                          if(response['success']==1){
                            setState(() {
                              otp=true;
                            });
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(response['message']),
                            ));
                          }
                          }
                        },
                        style: TextButton.styleFrom(minimumSize: Size(60, 40)),
                        child: const Text("Create Account")
                    ),

                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed:(){
              setState(() {
                login? login=false : login=true;
                print(login);
              });
            } ,
              child: Text(
                  login?"Don't have an account? signUp": "Already have an account? Login")
          ),
        ],
      ),
    );
  }
}
