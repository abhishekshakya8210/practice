import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/detaile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List scroll = [
    {'image': 'assets/image.png', 'Text': 'Sneakers'},
    {'image': 'assets/p-6.png', 'Text': 'T-shirt'},
    {'image': 'assets/p-7.png', 'Text': 'Watch'},
    {'image': 'assets/p-9.png', 'Text': 'Shirt'},
  ];
     List name = [
      {
        'image': 'assets/image.png',
        'title': 'Nike ',
        'tranding': 'Trending Now ',
        'price': '240',
      },
         {
        'image': 'assets/2.png',
        'title': 'Jara Shirt',
        'tranding': 'Trending Now ',
        'price': '390',
      },
         {
        'image': 'assets/3.png',
        'title': 'Stark',
        'tranding': 'Trending Now ',
        'price': '820',
      }
     ];
     List<bool> isSelected = [false,true,false,false];
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: 
        Container(
          height: screenheight*0.08,
          width: double.maxFinite,
color: Colors.white,
child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Icon(Icons.home,size: 30,color: Colors.deepOrangeAccent,),
     Icon(Icons.search,size: 30,color: Colors.grey,),
      Icon(Icons.shopping_bag_sharp,size: 30,color: Colors.grey,),
       Icon(Icons.favorite,size: 30,color: Colors.grey,),
  ],
),
        ),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenheight * 0.07,
                          width: screenwidth * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(Icons.menu, size: 30, color: Colors.grey),
                          ),
                        ),
                        Container(
                          height: screenheight * 0.07,
                          width: screenwidth * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/tony.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
          
                    SizedBox(height: screenheight * 0.04),
          
                    
                    Text(
                      'Our',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black26),
                    ),
                    Text(
                      'Products',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
                    ),
          
                    SizedBox(height: screenheight * 0.04),
          
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: screenheight * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, size: 25, color: Colors.grey),
                                hintText: 'Search Product',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: screenheight * 0.06,
                          width: screenwidth * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(Icons.menu_book_rounded, size: 30, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: screenheight * 0.04),
          
              
              Container(
                height: screenheight * 0.07,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = false;
                          }
                          isSelected[index] = true;
                        });
                      },
                      child: Container(
                        width: screenwidth * 0.4,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected[index] ? Colors.deepOrangeAccent : Colors.grey,
                            width: isSelected[index] ? 3.0 : 1.5, 
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: screenheight * 0.07,
                              width: screenwidth * 0.10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: AssetImage(scroll[index]['image']!)),
                              ),
                            ),
                            Text(
                              scroll[index]['Text']!,
                              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          
              SizedBox(height: screenheight * 0.04),
          
              
              Container(
                height: screenheight * 0.4,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(Detaile(
                          image:    name[index]['image']!, 
                          title:   name[index]['title']!,
                           price:    name[index]['price']!
                           ));
                      },
                      child: Container(
                        height: screenheight * 0.4,
                        width: screenwidth * 0.6,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 160),
                                  child: Icon(Icons.favorite_rounded, size: 40, color: Colors.grey),
                                ),
                                SizedBox(height: screenheight * 0.02),
                                
                          
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: screenheight * 0.10,
                                      width: screenwidth * 0.24,
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrangeAccent.shade100,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    Positioned(
                                      top: -30,
                                      left: -20,
                                      right: -20,
                                      child: Image.asset(
                                        name[index]['image']!,
                                        height: screenheight * 0.15,
                                        width: screenwidth * 0.4,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                    SizedBox(height: screenheight * 0.04),
                                Text(name[index]['title']!,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Colors.black),),
                                Text(name[index]['tranding']!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.red),),
                                Text(name[index]['price']!,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Colors.black),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
