import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/Product.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children:[ 
                  Hero(        
                  //tạo ra floating stuff (image trong context này), tag dùng để định danh hero này, 
                  //sau có thể dùng để tạo hiệu ứng với hero này
                    tag: "${product.id}",
                    child: Image.asset(product.image),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6464),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Sale!!'),
                  ),
                  
                ]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}