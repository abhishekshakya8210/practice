import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/note.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Detaile extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const Detaile({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  State<Detaile> createState() => _DetaileState();
}

class _DetaileState extends State<Detaile> {
  List<String> sizes = ['US 6', 'US 7', 'US 8', 'US 9'];
  List<bool> isSelected = [false, true, false, false];
  int selectedColorIndex = -1;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    double height = media.size.height;
    double width = media.size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Get.to(Note());
        },
        child: const Icon(Icons.shopping_bag, size: 30, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconContainer(Icons.arrow_back_ios, () {
                    Navigator.pop(context);
                  }),
                  _buildIconContainer(Icons.favorite, () {}),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.32,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: height * 0.04,
                    child: Text(
                      'AKM',
                      style: TextStyle(
                        fontSize: width * 0.4,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade200,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.1,
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.contain,
                      height: height * 0.22,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return Container(
                    height: height * 0.09,
                    width: width * 0.18,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/p-${11 + index}.png'),
                  );
                }),
              ),
            ),
            Container(
              height: height * 0.55,
              width: double.infinity,
              padding: EdgeInsets.all(width * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text('₹',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red)),
                                Text(
                                  widget.price,
                                  style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildSectionTitle('Available Size'),
                  SizedBox(height: height * 0.012),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(sizes.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = List.generate(sizes.length, (i) => i == index);
                          });
                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.18,
                          decoration: BoxDecoration(
                            color: isSelected[index] ? Colors.deepOrange : Colors.white,
                            border: Border.all(
                                color: isSelected[index] ? Colors.deepOrange : Colors.grey, width: 3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              sizes[index],
                              style: TextStyle(
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.w600,
                                color: isSelected[index] ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  _buildSectionTitle('Available Colors'),
                  SizedBox(height: height * 0.012),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(5, (index) {
                      List<Color> colors = [Colors.yellow, Colors.pinkAccent, Colors.black, Colors.red, Colors.blue];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColorIndex = index;
                          });
                        },
                        child: _buildColorCircle(
                          colors[index],
                          isSelected: selectedColorIndex == index,
                        ),
                      );
                    }),
                  ),
                  _buildSectionTitle('Description'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.012),
                    child: const Text(
                      'A shoe is an item of footwear intended to protect and comfort the human foot. '
                      'Though the human foot can adapt to varied terrains and climate conditions, it is vulnerable.',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: icon == Icons.favorite ? Colors.red : Colors.black),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildColorCircle(Color color, {bool isSelected = false}) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: color.withOpacity(isSelected ? 0.6 : 1.0),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: isSelected ? color : Colors.transparent, width: 3),
      ),
      child: isSelected ? Icon(Icons.check, color: Colors.white, size: 18) : null,
    );
  }
}
