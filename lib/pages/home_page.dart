import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../utils/routes.dart';
// void main(){
//   runApp(HomePage());
// }

class HomePage extends StatefulWidget {
  HomePage({super.key,this.name});
  String? name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    String treat =(widget.name!=null)?"Welcome Mr. ${widget.name}":"Welcome";

    if(index==2){
      SchedulerBinding.instance.addPostFrameCallback((_) {

        Navigator.pushNamed(context, MyRoutes.loginRoute);
      });
    }


    return WillPopScope(
      onWillPop:() async => false,
      child: Scaffold(
        appBar: AppBar(title: Text("WebArt Technology!"),backgroundColor: Colors.blue,),
        body:  Center(
          child: Text(treat,
          textScaleFactor: 2.0, ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) => setState(() => index = value),
            items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: 'Logout'),

        ],),
      ),
    );
  }
}
