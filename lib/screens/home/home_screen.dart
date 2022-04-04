
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/models/Product.dart';
import '../../constants.dart';
import '../details/details_screen.dart';
import 'components/body.dart';
import 'components/item_card.dart';
class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text('Wheelie Shop',
          style: TextStyle(color: Color(0xFF535353))),
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            showSearch (
              context: this.context,
              delegate: CustomSearchDelegate(),);
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ]; // IconButton
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    ); // IconButton
  }
  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];
    for (var p in all) {
      if (p.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(p);
      }
    }
    return GridView.builder(
      itemCount: matchQuery.length, //giống trong categories, cung cấp length của cái list trc để flutter tự loop và hiện lên
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, //số cột hiển thị product
        mainAxisSpacing: kDefaultPaddin, //spacing chiều dọc
        crossAxisSpacing: kDefaultPaddin, //spacing chiều ngang
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return ItemCard(
          product: matchQuery[index],       //tạo 1 obj product (item_card)
          press: () {},
        );
      });
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchQuery = [];
    for (var p in all) {
      if (p.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(p);
      }
    }
    return GridView.builder(
      itemCount: matchQuery.length, //giống trong categories, cung cấp length của cái list trc để flutter tự loop và hiện lên
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, //số cột hiển thị product
        mainAxisSpacing: kDefaultPaddin, //spacing chiều dọc
        crossAxisSpacing: kDefaultPaddin, //spacing chiều ngang
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return ItemCard(
          product: matchQuery[index],       //tạo 1 obj product (item_card)
          press: () {},
        );
      });
  }
}