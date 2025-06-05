import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';
import 'package:flutter/material.dart';
final List<ProductModel> riceProducts = [
  ProductModel(
    name: "Ponni Rice",
    price: 140,
    oldPrice: 160,
    unit: "1kg",
    image: "assets/images/rice.png",
  ),
  ProductModel(
    name: "Red Rice",
    price: 105,
    oldPrice: 120,
    unit: "1kg",
    image: "assets/images/rice.png",
  ),
  ProductModel(
    name: "Sticky Rice",
    price: 125,
    oldPrice: 140,
    unit: "1kg",
    image: "assets/images/rice.png",
  ),
  ProductModel(
    name: "Basmati Rice",
    price: 180,
    oldPrice: 210,
    unit: "1kg",
    image: "assets/images/rice.png",
  ),
  ProductModel(
    name: "Brown Rice",
    price: 135,
    oldPrice: 155,
    unit: "1kg",
    image: "assets/images/rice.png",
  ),
  ProductModel(
    name: "Jeera Samba Rice",
    price: 160,
    oldPrice: 190,
    unit: "1kg",
    image: "assets/images/rice.png",
  ),
  ProductModel(
    name: "Matta Rice",
    price: 100,
    oldPrice: 115,
    unit: "1kg",
    image: "assets/images/rice.png",
  ),
  ProductModel(
    name: "Sona Masoori Rice",
    price: 130,
    oldPrice: 150,
    unit: "1kg",
    image: "assets/images/rice.png",
  ),
  ProductModel(
    name: "Black Rice",
    price: 150,
    oldPrice: 175,
    unit: "1kg",
    image: "assets/images/rice.png",
  ),
];

final List<ProductModel> drinkProducts = [
  ProductModel(name: 'Orange Juice', price: 50, oldPrice: 60, unit: '500ml', image: 'assets/images/drinks.png'),
  ProductModel(name: 'Apple Juice', price: 55, oldPrice: 65, unit: '500ml', image: 'assets/images/drinks.png'),
  ProductModel(name: 'Mango Juice', price: 60, oldPrice: 70, unit: '1L', image: 'assets/images/drinks.png'),
  ProductModel(name: 'Lemonade', price: 45, oldPrice: 55, unit: '200ml', image: 'assets/images/drinks.png'),
  ProductModel(name: 'Coconut Water', price: 70, oldPrice: 80, unit: '750ml', image: 'assets/images/drinks.png'),
  ProductModel(name: 'Grape Juice', price: 65, oldPrice: 75, unit: '1L', image: 'assets/images/drinks.png'),
  ProductModel(name: 'Pineapple Juice', price: 52, oldPrice: 60, unit: '500ml', image: 'assets/images/drinks.png'),
  ProductModel(name: 'Pomegranate Juice', price: 58, oldPrice: 68, unit: '1L', image: 'assets/images/drinks.png'),
];

final List<ProductModel> dryfruitProducts = [
  ProductModel(name: 'Almonds', price: 200, oldPrice: 220, unit: '250g', image: 'assets/images/Dry Fruits.png'),
  ProductModel(name: 'Cashews', price: 250, oldPrice: 280, unit: '250g', image: 'assets/images/Dry Fruits.png'),
  ProductModel(name: 'Raisins', price: 180, oldPrice: 200, unit: '500g', image: 'assets/images/Dry Fruits.png'),
  ProductModel(name: 'Walnuts', price: 270, oldPrice: 300, unit: '250g', image: 'assets/images/Dry Fruits.png'),
  ProductModel(name: 'Pistachios', price: 260, oldPrice: 290, unit: '250g', image: 'assets/images/Dry Fruits.png'),
  ProductModel(name: 'Dates', price: 220, oldPrice: 240, unit: '250g', image: 'assets/images/Dry Fruits.png'),
  ProductModel(name: 'Figs', price: 230, oldPrice: 250, unit: '500g', image: 'assets/images/Dry Fruits.png'),
  ProductModel(name: 'Hazelnuts', price: 240, oldPrice: 260, unit: '250g', image: 'assets/images/Dry Fruits.png'),
];


final List<ProductModel> eggProducts = [
  ProductModel(name: 'Country Eggs', price: 70, oldPrice: 80, unit: '6 pcs', image: 'assets/images/eggs.png'),
  ProductModel(name: 'Brown Eggs', price: 75, oldPrice: 85, unit: '6 pcs', image: 'assets/images/eggs.png'),
  ProductModel(name: 'White Eggs', price: 60, oldPrice: 70, unit: '12 pcs', image: 'assets/images/eggs.png'),
  ProductModel(name: 'Quail Eggs', price: 65, oldPrice: 75, unit: '12 pcs', image: 'assets/images/eggs.png'),
  ProductModel(name: 'Duck Eggs', price: 68, oldPrice: 78, unit: '6 pcs', image: 'assets/images/eggs.png'),
  ProductModel(name: 'Omega Eggs', price: 80, oldPrice: 90, unit: '6 pcs', image: 'assets/images/eggs.png'),
  ProductModel(name: 'Organic Eggs', price: 72, oldPrice: 82, unit: '12 pcs', image: 'assets/images/eggs.png'),
  ProductModel(name: 'Free-range Eggs', price: 78, oldPrice: 88, unit: '6 pcs', image: 'assets/images/eggs.png'),
];

final List<ProductModel> breadProducts = [
  ProductModel(name: 'Whole Wheat Bread', price: 40, oldPrice: 48, unit: '400g', image: 'assets/images/bread.png'),
  ProductModel(name: 'White Sandwich Bread', price: 35, oldPrice: 42, unit: '400g', image: 'assets/images/bread.png'),
  ProductModel(name: 'Multigrain Bread', price: 50, oldPrice: 60, unit: '500g', image: 'assets/images/bread.png'),
  ProductModel(name: 'Brown Bread', price: 45, oldPrice: 52, unit: '450g', image: 'assets/images/bread.png'),
  ProductModel(name: 'Oat Bread', price: 38, oldPrice: 45, unit: '400g', image: 'assets/images/bread.png'),
  ProductModel(name: 'Rye Bread', price: 48, oldPrice: 55, unit: '500g', image: 'assets/images/bread.png'),
  ProductModel(name: 'Garlic Bread', price: 42, oldPrice: 50, unit: '300g', image: 'assets/images/bread.png'),
  ProductModel(name: 'Baguette', price: 55, oldPrice: 65, unit: '1pc', image: 'assets/images/bread.png'),
];


final List<ProductModel> fruitProducts = [
  ProductModel(name: 'Mango', price: 90, oldPrice: 100, unit: '1kg', image: 'assets/images/fruits.png'),
  ProductModel(name: 'Apple', price: 120, oldPrice: 135, unit: '1kg', image: 'assets/images/fruits.png'),
  ProductModel(name: 'Banana', price: 60, oldPrice: 70, unit: '1 dozen', image: 'assets/images/fruits.png'),
  ProductModel(name: 'Grapes', price: 80, oldPrice: 95, unit: '500g', image: 'assets/images/fruits.png'),
  ProductModel(name: 'Orange', price: 70, oldPrice: 85, unit: '1kg', image: 'assets/images/fruits.png'),
  ProductModel(name: 'Papaya', price: 85, oldPrice: 100, unit: '1kg', image: 'assets/images/fruits.png'),
  ProductModel(name: 'Pineapple', price: 95, oldPrice: 110, unit: '1kg', image: 'assets/images/fruits.png'),
  ProductModel(name: 'Watermelon', price: 110, oldPrice: 125, unit: '1pc', image: 'assets/images/fruits.png'),
];


final List<ProductModel> vegetableProducts = [
  ProductModel(name: 'Tomatoes', price: 30, oldPrice: 35, unit: '1kg', image: 'assets/images/vegetable.png'),
  ProductModel(name: 'Onions', price: 25, oldPrice: 30, unit: '1kg', image: 'assets/images/vegetable.png'),
  ProductModel(name: 'Potatoes', price: 20, oldPrice: 25, unit: '1kg', image: 'assets/images/vegetable.png'),
  ProductModel(name: 'Carrots', price: 28, oldPrice: 35, unit: '500g', image: 'assets/images/vegetable.png'),
  ProductModel(name: 'Cabbage', price: 22, oldPrice: 30, unit: '1kg', image: 'assets/images/vegetable.png'),
  ProductModel(name: 'Spinach', price: 24, oldPrice: 28, unit: '1 bunch', image: 'assets/images/vegetable.png'),
  ProductModel(name: 'Cucumber', price: 26, oldPrice: 30, unit: '500g', image: 'assets/images/vegetable.png'),
  ProductModel(name: 'Capsicum', price: 32, oldPrice: 38, unit: '1kg', image: 'assets/images/vegetable.png'),
];


final List<ProductModel> spiceProducts = [
  ProductModel(name: 'Turmeric Powder', price: 60, oldPrice: 70, unit: '200g', image: 'assets/images/spices.png'),
  ProductModel(name: 'Red Chilli Powder', price: 70, oldPrice: 80, unit: '200g', image: 'assets/images/spices.png'),
  ProductModel(name: 'Coriander Powder', price: 65, oldPrice: 75, unit: '100g', image: 'assets/images/spices.png'),
  ProductModel(name: 'Cumin Powder', price: 68, oldPrice: 78, unit: '150g', image: 'assets/images/spices.png'),
  ProductModel(name: 'Garam Masala', price: 75, oldPrice: 90, unit: '200g', image: 'assets/images/spices.png'),
  ProductModel(name: 'Black Pepper', price: 62, oldPrice: 72, unit: '100g', image: 'assets/images/spices.png'),
  ProductModel(name: 'Cardamom', price: 80, oldPrice: 95, unit: '50g', image: 'assets/images/spices.png'),
  ProductModel(name: 'Clove', price: 85, oldPrice: 98, unit: '100g', image: 'assets/images/spices.png'),
];

