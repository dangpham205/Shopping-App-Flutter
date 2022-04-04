// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/screens/buy_now.dart';
import '../../../models/Product.dart';
import '../../../constants.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(      //nút add to cart
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: product.color,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(     //nút buy now
            child: Hero(
              tag: 'button',
              child: SizedBox(
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  color: product.color,
                  onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyNow(
                              product: this.product,
                            ),
                          )),
                  child: Text(
                    "Buy  Now".toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}