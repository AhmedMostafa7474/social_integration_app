import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_integration_app/Screens/UserPage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/29533517.jpg"),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Social Integration",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Login With",
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 28,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      final GoogleSignIn googleSignIn = GoogleSignIn();
                      final GoogleSignInAccount? googleSignInAccount =
                          await googleSignIn.signIn();
                      if (googleSignInAccount != null) {
                        final GoogleSignInAuthentication
                            googleSignInAuthentication =
                            await googleSignInAccount.authentication;
                        final AuthCredential authCredential =
                            GoogleAuthProvider.credential(
                                idToken: googleSignInAuthentication.idToken,
                                accessToken:
                                    googleSignInAuthentication.accessToken);
                        UserCredential result =
                            await auth.signInWithCredential(authCredential);
                        User? user = result.user;
                        if(result.user!=null)
                          {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> userpage(user!)));
                          }

                      }
                    },
                    child: Container(
                      height: 60 ,
                      width: 300,
                      child: Image.asset("assets/google_logo.png"),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  )
                  ,
                  InkWell(
                    onTap: () async {
                      final LoginResult result = await FacebookAuth.instance.login();
                      final AuthCredential facebookCredential =
                      FacebookAuthProvider.credential(result.accessToken!.token);
                      UserCredential result2 =
                        await auth.signInWithCredential(facebookCredential);
                        User? user = result2.user;
                        if(result2.user!=null)
                        {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> userpage(user!)));
                        }

                      },
                    child: Container(
                      height: 60 ,
                      width: 300,
                      child: Image.asset("assets/Sign in with Facebook Button2.png"),
                    ),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
