import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';
import 'categories.dart';
import 'item_card.dart';
import '../../details/details_screen.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,   //giống trong categories, cung cấp length của cái list trc để flutter tự loop và hiện lên
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,    //số cột hiển thị product
                  mainAxisSpacing: kDefaultPaddin,    //spacing chiều dọc
                  crossAxisSpacing: kDefaultPaddin,   //spacing chiều ngang
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) => loadProducts(index, context)),
          ),
        ),
      ],
    );
  }

  ItemCard loadProducts(int index, BuildContext context) {
    if (number == 0 ){
      return ItemCard(
                    product: products[index],
                    press: () => Navigator.push(
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