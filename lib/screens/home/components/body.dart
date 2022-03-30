import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';
import 'categories.dart';
import 'item_card.dart';
import '../../details/details_screen.dart';
class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int selectedIndex = 0;
  List<String> categories = ["Supermoto", "Helmets", "Gloves", "Suits"];


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


  @override
  Widget build(BuildContext context) {
  // By default our first item will be selected

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
          child: SizedBox(      //box chứa phần menu
            height: 24,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,   // cung cấp length của cái list để flutter tự động hiển thị hết cả list
              itemBuilder: (context, index) => buildCategory(index),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              // padding: EdgeInsets.all(kDefaultPaddin),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
            child: RefreshIndicator(
              onRefresh: () async{
                if (number == 0){
                  setState(() {
                    loadProducts(0, context);
                  });
                }
                else if (number == 1){
                  setState(() {
                    loadProducts(1, context);
                  });
                }
              },
              child: GridView.builder(
                  itemCount: products.length,   //giống trong categories, cung cấp length của cái list trc để flutter tự loop và hiện lên
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,    //số cột hiển thị product
                    mainAxisSpacing: kDefaultPaddin,    //spacing chiều dọc
                    crossAxisSpacing: kDefaultPaddin,   //spacing chiều ngang
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return loadProducts(index, context);
                  }),
            ),
          ),
        ),
        
      ],
    );
  }

  

  ItemCard loadProducts(int index, BuildContext context) {
    if (number == 0 ){
      return ItemCard(
                    product: products[index],       //tạo 1 obj product (item_card)
                    press: () => Navigator.push(    //dùng push và pop để chuyển màn
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        )),
                  );
    }
    if (number == 1){
      return ItemCard(
                    product: helmets[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: helmets[index],
                          ),
                        )),
                  );
    }
  }


}