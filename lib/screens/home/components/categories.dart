import 'package:flutter/material.dart';
import 'package:plant_app/models/Product.dart';
import '../../../constants.dart';

// We need satefull widget for our categories
int number =  0;

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Supermoto", "Helmets", "Gloves", "Suits"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(      //box chứa phần menu
        height: 24,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,   // cung cấp length của cái list để flutter tự động hiển thị hết cả list
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          number = index;
          
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),    //padding 4 phía
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,     
                //set chỉ thằng selected có màu đen, mấy thằng còn lại sẽ có màu default là xám 
              ),
            ),
            Container(          //indicator của selected
              margin: EdgeInsets.only(top: kDefaultPaddin / 25), 
              height: 2,
              width: 65,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}