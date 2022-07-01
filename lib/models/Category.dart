// ignore_for_file: file_names, non_constant_identifier_names

class Category {
  final String icon, title;

  Category({required this.icon, required this.title});
}

List<Category> demo_categories = [
  Category(
    icon: "assets/icons/dress.svg",
    title: "Dress",
  ),
  Category(
    icon: "assets/icons/shirt.svg",
    title: "Shirt",
  ),
  Category(
    icon: "assets/icons/pants.svg",
    title: "Pants",
  ),
  Category(
    icon: "assets/icons/Tshirt.svg",
    title: "Tshirt",
  ),
];
