import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/loggedpage.dart';
import 'package:untitled/signuppage.dart';

import 'assignment4page1.dart';


class LoginPage extends StatefulWidget{
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordController=TextEditingController();

   final usernameController=TextEditingController();

   void signUserIn() {

   }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:SafeArea(

        child: Center(
          child: ListView(

            children: [
              Column(
                children: [
                  SizedBox(height: 70,),
                  //logo
              Icon(
                Icons.lock,
                size:100,
              ),
                  SizedBox(height: 50,),

                  //welcome back
                Text('Welcome back you\'ve been missed!',
                style: TextStyle(
                  color:Colors.grey[700],
                  fontSize:16,
                ),),
                  SizedBox(height: 25,),
                  //username textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: usernameController,
              obscureText: false,
                  enableSuggestions: true,
                  autocorrect: true,

                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Textfield',
                    hintStyle: TextStyle(color:Colors.grey[500]),
                    enabledBorder: OutlineInputBorder(
                      borderSide:BorderSide(color:Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey),
                    ),
                  ),
                ),
              ),SizedBox(height: 15,),
                  //password textfield
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: passwordController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(color:Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                          borderSide:BorderSide(color:Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  //forget password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forget Password?',
                    style:TextStyle(color:Colors.grey[600]),),
                  ],
                ),
              ), SizedBox(height: 20,),

                  //sign in button

                  GestureDetector(
                    onTap:  (){

                      FirebaseAuth.instance.signInWithEmailAndPassword(email:usernameController.text, password: passwordController.text).then((value){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Assigmfirstpage()));
                      }).onError((error, stackTrace){
                        print("Error ${error.toString()}");
                      });

                    },
                    child: Container(
                      padding: EdgeInsets.all(25),
                      margin:EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(color:Colors.black,
                      borderRadius:BorderRadius.circular(9)),
                      child:Center(child: Text('Sign In',
                      style: TextStyle(color:Colors.white,),),
                      ),
                    ),
                  ),
                  //or continue with
              const SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 5,
                          color: Colors.grey[400],),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Or Continue with'),
                        ),
                        Expanded(
                          child: Divider(thickness: 5,
                            color: Colors.grey[400],),
                        ),
                      ],
                    ),
                  ),
                  //google +apple sign in button
              //google button
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                GestureDetector(
                  onTap: (){
                    void signInwithGoogle() async{
                      GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();
                      GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;
                      AuthCredential credential=GoogleAuthProvider.credential(
                        accessToken: googleAuth?.accessToken,
                        idToken: googleAuth?.idToken,
                      );
                      UserCredential user= await FirebaseAuth.instance.signInWithCredential(credential);
                      print(user.user?.email);
                      if(user.user!=null){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Assigmfirstpage()));
                    }
                    }
                    signInwithGoogle();
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration:BoxDecoration(
                      border:Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                      color:Colors.grey[200],
                    ),
                      child:Image.asset('lib/googlelogo.png',height: 40,width: 40,),


                  ),
                ),
                  //SizedBox(width:30),
                  // Container(
                  //   padding: EdgeInsets.all(20),
                  //   decoration:BoxDecoration(
                  //     border:Border.all(color: Colors.white),
                  //     borderRadius: BorderRadius.circular(16),
                  //     color:Colors.grey[200],
                  //   ),
                  //   child:Image.asset('lib/applelogo.png',height: 40,width: 40,),
                  //
                  //
                  // ),
                  ],),
                  //not a member?register now
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [

                      Text('Not a member?',
                      style:TextStyle(color: Colors.grey[700])),
                      SizedBox(width: 6,),
                      GestureDetector(
                        onTap:  (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=>signup()));
        },
                        child: Text('Register now',
                        style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,),),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}

