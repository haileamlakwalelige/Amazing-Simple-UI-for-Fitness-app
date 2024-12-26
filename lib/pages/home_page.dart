import 'package:fitness/models/category_models.dart';
import 'package:fitness/models/diet_modal.dart';
import 'package:fitness/models/popular_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModels> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void getInitialInfo() {
    categories = CategoryModels.getCategoryModals();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          SizedBox(
            height: 15,
          ),
          _categoriesSection(),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    "Recommendation \n for Diet",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                _dietsSection(),
                SizedBox(
                  height: 10,
                ),

                // polular section
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 8.0),
                    child: Column(
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                    itemCount: popularDiets.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    padding: EdgeInsets.only(left: 0, right: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  offset: Offset(0, 10),
                                  blurRadius: 40,
                                  spreadRadius: 0)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 1, right: 1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(popularDiets[index].iconPath),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    popularDiets[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                      '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}')
                                ],
                              ),
                              SvgPicture.asset('assets/icons/button.svg')
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ]),

                SizedBox(
                  height: 40,
                ),

                // ListView.builder(itemBuilder: (context, index))
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _dietsSection() {
    return Container(
      height: 240,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            width: 210,
            decoration: BoxDecoration(
                color: diets[index].boxColor.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(diets[index].iconPath),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        diets[index].name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Text(
                      '${diets[index].level}|${diets[index].duration}|${diets[index].calorie}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xff786F72),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 45,
                  width: 135,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        diets[index].viewIsSelected
                            ? Color(0xff9DCEFF)
                            : Colors.transparent,
                        diets[index].viewIsSelected
                            ? Color(0xff92A3FD)
                            : Colors.transparent,
                      ]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "View",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: diets[index].viewIsSelected
                            ? Colors.white
                            : Colors.grey[700],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 25,
        ),
        itemCount: diets.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 10),
          child: Text(
            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 150,
          // color: Colors.green,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
              itemBuilder: (context, index) {
                return Container(
                  width: 110,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withValues(alpha: .12),
            blurRadius: 40,
            spreadRadius: 0.0,
          )
        ]),
        child: TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Search Pancakes",
              hintStyle: TextStyle(color: Colors.grey[700], fontSize: 14),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              contentPadding: EdgeInsets.all(4),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none)),
        ));
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Breakfast",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 37,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset('assets/icons/dots.svg'),
          ),
        ),
      ],
    );
  }
}
