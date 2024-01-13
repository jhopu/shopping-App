import'package:flutter/material.dart';
import 'package:untitled/pop_page.dart';
import 'package:untitled/secondpage.dart';

import 'assignment2page2.dart';
import 'login_page.dart';
import 'main.dart';
class AssignsecondPages extends StatefulWidget {
  final String data;
  final int data1;
   String data2;

  AssignsecondPages({super.key, required this.data,required this.data1,required this.data2,});

  @override
  _ClickableIconButtonState createState() => _ClickableIconButtonState();
}

class _ClickableIconButtonState extends State<AssignsecondPages> {



  @override
  Widget build(BuildContext context){
    return Scaffold(
    //  backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('',style: TextStyle(fontSize: 30),),
        centerTitle: true,
       // backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){

            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back),
        ),
      ),

      body: Builder(builder: (context) {
        var data1;
        data1=widget.data1;

        return Center(

          child: Column(
            children: <Widget>[

              const SizedBox(height: 50,),

              const SizedBox(height: 30,),
              ListTile(

                title: Center(child: Text(widget.data,style: TextStyle(fontSize: 40),)),
                //trailing: Text('Prices/KG',style: TextStyle(fontSize: 40),),

              ),
              const SizedBox(height: 30,),

              ListTile(
                title:  Text('Product id',style: TextStyle(fontSize: 20),),
                trailing: Text(widget.data2,style: TextStyle(fontSize: 15),),

              ),
              SizedBox(height: 20,),
              ListTile(
                title:  Text('Price',style: TextStyle(fontSize: 20),),
                trailing: Text('$data1',style: TextStyle(fontSize: 15),),

              ),
              SizedBox(height: 20,),


              SizedBox(height:200),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children:[


                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Action to perform when the Container is tapped
                        Navigator.popUntil(context,ModalRoute.withName('/'),);
                        // Add your logic here
                      },
                      child:Container(
                        alignment: Alignment(0,0),
                        height: 60,
                        width: 150,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),

                          border: Border.all(),
                          color: Colors.deepPurpleAccent,

                        ),

                        child: Text('Done',
                          style: TextStyle(fontSize: 30),),
                      ),

                    ),
                  ),],),
            ],
          ),
        );
      },
      ),

    );}}
