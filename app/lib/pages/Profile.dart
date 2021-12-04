import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              profile_block(),
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        height: 150,
        width: 150,
        margin: EdgeInsets.only(top: 150),
        child: InputDecorator(
          decoration: InputDecoration(
          border: OutlineInputBorder( 
            borderSide:  BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(100)), 
             ),   
           ),
            child:  Image.asset('assets/image/Logo.png'),
        )
    );  
  }
}

class profile_info extends StatelessWidget{
  @override

  Widget build (BuildContext context){
    return Container(
      child: Column(
          children:<Widget>[
            Text('Сергей Адамов', 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 30.0,
                  ),
              ), 
                Text('#29542', 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal, 
                        fontSize: 20.0,
                  ), 
                ),
               
          ] 
      )              
    );
  }
}

class profile_block extends StatelessWidget{
  @override

  Widget build (BuildContext context){
    return Container(
      child: Column(
              children: <Widget>[
                  Logo(),
                  profile_info(), 
                  Lsit_typeTrash()                 
                ],
              )
    );
  }
}


class typeTrashProcessing extends StatelessWidget{
  @override

  Widget build (BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                   Text('Утилизированно пластика: 15 ед.', 
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal, 
                        fontSize: 20.0,
                  ), 
                ),   
                Text('Посмотреть больше', 
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal, 
                        fontSize: 18.0,
                      )
                  ),                
                ],
              )
    );
  }
}

class Lsit_typeTrash extends StatelessWidget{
  @override

  Widget build (BuildContext context){
    return Container(
      child: Column(
             
              children: <Widget>[
                  typeTrashProcessing(),
                  typeTrashProcessing()                
                ],
              )
    );
  }
}
