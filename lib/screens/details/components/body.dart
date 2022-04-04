import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'like_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;    //trả về size của màn hình
    return SingleChildScrollView(           
      child: Column(
        children: <Widget>[
          SizedBox(                    
            height: size.height,    //box này sẽ chiếm toàn màn hình
            child: Stack(
              children: <Widget>[
                Container(         //tạo ra phần màu trắng để chứa các tt của product
                  margin: EdgeInsets.only(top: size.height * 0.33),   
                  padding: EdgeInsets.only(
                    top: size.height * 0.1,
                    left: kDefaultPaddin,     //padding 2 bên của phần trắng
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(),      //bao gồm counter và like btn
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),   // phải để này bên dưới để tấm hình float lên thằng container ở trên
              ],
            ),
          )
        ],
      ),
    );
  }
}