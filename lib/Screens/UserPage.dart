import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_integration_app/Screens/Login.dart';

class userpage extends StatefulWidget {
  User user;

  userpage(this.user);

  @override
  _userpageState createState() => _userpageState(user);
}

class _userpageState extends State<userpage> {
  User user;
  final FirebaseAuth auth = FirebaseAuth.instance;

  _userpageState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              children: [
                Center(
                  child: (Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      image: DecorationImage(
                        image: NetworkImage(
                          "${user.photoURL}",
                         ),
                        fit: BoxFit.cover,
                      )
                    ),
                  )),
                ),
                SizedBox(height:12 ,),
                Text("${user.displayName}",style: TextStyle(
                  fontSize: 25,
                ),),
              ],
            ),
          ),

          SizedBox(height: 12,),
          Expanded(
            child: Container(decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
            ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 80,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)
,                        color: Colors.white70
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.supervised_user_circle,color: Colors.blue,size: 32,),
                          SizedBox(width: 4,),
                          Text("${user.displayName}",style: TextStyle(fontSize: 19,color: Colors.grey),)
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)
,
                          color: Colors.white70
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.email,color: Colors.blue,size: 32,),
                          SizedBox(width: 4,),
                          Text("${user.email}",style: TextStyle(fontSize: 19,color: Colors.grey),)
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),

                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)
                          ,
                          color: Colors.red
                      ),
                      child: TextButton(
                       onPressed: () {
                         auth.signOut();
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> loginScreen()));

                       },
                       child: Text("Logout",style: TextStyle(color: Colors.white),) ,
                      ),
                    )

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
