import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    
     void signOut() {
    FirebaseAuth.instance.signOut();
  }
    return  Drawer(
      backgroundColor: Colors.grey[300],
      child:  Column(children: [
        const SizedBox(height: 90,),
        const Icon( Icons.lock_open_rounded,size: 70,),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Divider(color: Colors.grey,),
        ),
        const ListTile(
          title: Text('Home'),
          leading: Icon(Icons.home),
          
        ),
        const ListTile(
          title: Text('Setings'),
          leading: Icon(Icons.settings),
          
        ),
         const ListTile(
          title: Text('Profile'),
          leading: Icon(Icons.person),
          
        ),
        const Spacer(),
        ListTile(
          title: const Text('Logout'),
          leading: IconButton(onPressed: 
          () => signOut(),
           icon: const Icon(Icons.exit_to_app))
          
        ),
        const SizedBox(height: 30,)
      ],),
    );
  }
}