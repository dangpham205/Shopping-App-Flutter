import 'package:flutter/material.dart';
class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}
List<Product> helmets = [Product(
      id: 1,
      title: "Helmet 1",
      price: 99,
      size: 0,
      description: descript,
      image: "assets/images/h1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Helmet 2",
      price: 99,
      size: 8,
      description: descript,
      image: "assets/images/h2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Helmet 3",
      price: 99,
      size: 10,
      description: descript,
      image: "assets/images/h3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Helmet 4",
      price: 99,
      size: 11,
      description: descript,
      image: "assets/images/h4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Helmet 5",
      price: 99,
      size: 12,
      description: descript,
      image: "assets/images/h5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Helmet 6",
    price: 99,
    size: 12,
    description: descript,
    image: "assets/images/h6.png",
    color: Color(0xFFAEAEAE),
  ),
];

List<Product> products = [
  Product(
      id: 1,
      title: "Bike 1",
      price: 2340000,
      size: 0,
      description: descript,
      image: "assets/images/bike_1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Bike 2",
      price: 234,
      size: 8,
      description: descript,
      image: "assets/images/bike_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Bike 3",
      price: 234,
      size: 10,
      description: descript,
      image: "assets/images/bike_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Bike 4",
      price: 234,
      size: 11,
      description: descript,
      image: "assets/images/bike_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Bike 5",
      price: 234,
      size: 12,
      description: descript,
      image: "assets/images/bike_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Bike 6",
    price: 234,
    size: 12,
    description: descript,
    image: "assets/images/bike_6.png",
    color: Color(0xFFAEAEAE),
  ),
];

String descript =  "This is a description of the product";