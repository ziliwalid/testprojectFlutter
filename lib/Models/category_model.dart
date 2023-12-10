import 'dart:ui';

class CategoryModel{
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name, required this.iconPath, required this.boxColor
});

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];
    categories.add(
      CategoryModel(name: "Salade", iconPath: "assets/icons/plate.svg", boxColor: const Color(0xff9DCEFF))
    );
    categories.add(
        CategoryModel(name: "Cake", iconPath: "assets/icons/pancakes.svg", boxColor: const Color(0xffEEA4CE))
    );
    categories.add(
        CategoryModel(name: "Pie", iconPath: "assets/icons/pie.svg", boxColor: const Color(0xff9DCEFF))
    );
    categories.add(
        CategoryModel(name: "Smoothie", iconPath: "assets/icons/orange-snacks.svg", boxColor: const Color(0xffEEA4CE))
    );

    return categories;
  }

}