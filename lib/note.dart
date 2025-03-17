// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
class Note extends  StatefulWidget{
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
                            


      backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                                  height: 40,
                                  width: 40,
                                decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 247, 236, 236),
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.menu),
                          ),
                             Container(
                                  height: 40,
                                  width: 40,
                                decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 247, 236, 236),
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image:  AssetImage('assets/tony.png'))
                                ),
                                
                          ),
                          
                        ],
                      ),
                      const SizedBox(height: 30,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 200),
                                      child: Text('Noteping',style: TextStyle(fontSize:
                                      25,color: Colors.black38 ),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 250),
                                      child: Text('Card',style: TextStyle(fontSize:25,
                                      color: Colors.black ),),
                                    ),
                                  ],
                                ),
                                Icon(Icons.delete,size: 40,color:Colors.red,)
                              ],
                            ),
                         ),
                           SizedBox(height: 20,),
                       Container(
                        height: 450,
                        width: double.maxFinite,
                      
                         child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.vertical,   
                          itemBuilder: (context,index){
                          return Container(
                            margin:  EdgeInsets.all(7),
                       
                            height: 100,
                            width: double.maxFinite,
                            child: 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              
                              children: [
                              Container(
                                height: 85,
                                width: 85,
                            decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15)
                            ),
                            child: 
                              //-------------------------------------------------------------------
                            
                                Stack(
                                children: [
                                  Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(image: AssetImage('assets/p-10.png'),
                                          fit: BoxFit.cover)
                                        ),
                                  )
                                ],
                                ),
                             ),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                               children: const [
                                 Text('Nike Air Max 200',
                                 style: TextStyle(fontSize: 20,color: Colors.black),),
                                    Row(
                                      children: [
                                        Text('\$',   style: TextStyle(fontSize: 17,color: Colors.red),),
                                           Text(' 260',
                                 style: TextStyle(fontSize: 17,color: Colors.black),),
                                      ],
                                    ),
                
                               ],
                             ),
                             //--------------------------------------------------------------
                                Text('+1',
                                 style: TextStyle(fontSize: 13,color: Colors.black),),
                            ],),
                          );
                         }),
                       ),
                       SizedBox(height: 20,),
                       Divider(height: sqrt1_2,),
                        SizedBox(height: 20,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('4 Items',style: TextStyle(fontSize: 17,color:Colors.grey),),
                          Text('\$1320',style: TextStyle(fontSize: 26,color:Color.fromARGB(255, 10, 10, 10)),),
                          
                        ],
                        
                       ),
                       SizedBox(height: 30,),
                       Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)
                        ),
                     child:Center(child: Text('Next',style: TextStyle(fontSize: 25,color: Colors.white),)),
                       )
                    ],
                  ),
                ),
              ),
               
    );
  }
}