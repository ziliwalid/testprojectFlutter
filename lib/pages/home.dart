import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testproject/Models/category_model.dart';
import 'package:testproject/Models/diet_model.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<CategoryModel>  categs = [];
   List<DietModel> diets = [];

   void _getInfos(){
     categs = CategoryModel.getCategories();
     diets = DietModel.getDiets();
   }
   @override
   void initState() {
     super.initState();
     _getInfos();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("LoveMeSomeBreakfast"),
      body: Column(
        children: [
          searchBar(),
          const SizedBox(height: 40),
          Categories(categs),
          const SizedBox(height: 40),
          dietSection(diets)
        ],
      ),
    );
  }
}




AppBar appBar(String title){
  return AppBar(
    title:  Text(title,
      style: const TextStyle(
          color: Colors.red,
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
    ),
    backgroundColor: Colors.black,
    elevation: 0.0,
    centerTitle: true,
    leading: Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
      ) ,
      child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
    ),
    actions: [
      Container(
          margin: const EdgeInsets.all(10),
          child: const Icon(
            Icons.accessibility,
            color: Colors.red,
            size: 29,
          )
      )
    ],
  );
}
Column searchBar(){
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 40,left: 20, right: 20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: const Color(0xff1D1617).withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0
              )
            ]
        ),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(10),
              hintText: "search for something",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.red,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
              )
          ),
        ),
      )
    ],
  );
}
Column Categories(List<CategoryModel> categs){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Category',
          style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      const SizedBox(height: 15),
      SizedBox(
        height: 120,
        child: ListView.separated(
          itemCount: categs.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 20,right: 20),
          itemBuilder: (BuildContext context, int index)
          {
            return Container(
              width: 100,
              decoration: BoxDecoration(
                  color: categs[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(17)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration:  BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(categs[index].iconPath),
                  ),
                  Text(
                    categs[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 25,),
        ),
      ),
    ],
  );
}
Column dietSection(List<DietModel> diets) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left:20),
        child: Text(
          'Recommendation\nfor Diet',
          style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      const SizedBox(height: 15,),
      SizedBox(
        height: 240,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              width: 210,
              decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(diets[index].iconPath),
                  Column(
                    children: [
                      Text(
                        diets[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                        style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    width: 130,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              diets[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                              diets[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent
                            ]
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Center(
                      child: Text(
                        'View',
                        style: TextStyle(
                            color: diets[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 25,),
          itemCount: diets.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(
              left: 20,
              right: 20
          ),
        ),
      )
    ],
  );
}

