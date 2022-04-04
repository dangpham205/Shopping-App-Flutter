import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/counter.dart';

import '../models/Product.dart';
import 'details/components/color_and_size.dart';

class BuyNow extends StatelessWidget {

  final Product product;


  const BuyNow({ Key key, this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),      // pop màn này trên stack để quay về màn trước
        ),
        title: Text('Buy Now'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Stack(
              children: [
                Container(color: product.color, height: 250,),
                Hero(
                tag: "${product.id}",
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(     //tạo ra floating image
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ]
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product :'),
                    Text('Size :'),
                    Text('Color :'),
                    Text('Quantity :'),
                    Text('Total price :'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Hero(tag: 'name',child: Padding( padding: EdgeInsets.only(top: 3),child: Text(product.title))),
                    Hero(tag: 'size',child: Padding( padding: EdgeInsets.only(top: 0),child: Text(product.size.toString()+' cm'))),
                    Hero(
                      tag: 'color',
                      child: ColorDot(
                        color: product.color,
                        isSelected: true,
                      ),
                    ),
                    Text(count.toString()),
                    Text((product.price*count).toString()),
                  ],
                ),
              ],
            ),
          ),
          //nút Buy
          Padding(
            padding: const EdgeInsets.only(top: 180,left: 10, right: 10),
            child: Hero(
              tag: 'button',
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  color: product.color,
                  onPressed: () {},
                  child: Text(
                    "Buy".toUpperCase(),
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