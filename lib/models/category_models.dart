import 'package:flutter/material.dart';

class CategoryModels {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModels({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModels> getCategoryModals() {
    List<CategoryModels> categories = [];

    categories.add(CategoryModels(
        name: "Salad",
        iconPath: 'assets/icons/plate.svg',
        boxColor: Color(0xff92A3FD)));

    categories.add(CategoryModels(
        name: "Cake",
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Color(0xffC588F2)));

    categories.add(CategoryModels(
        name: "Pie",
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color(0xff92A3FD)));

    categories.add(CategoryModels(
        name: "Smoothies",
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: Color(0xffC588F2)));

    return categories;
  }
}
