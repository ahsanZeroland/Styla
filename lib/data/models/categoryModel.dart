class CategoryModel {
  final String picture;
  final String name;

  CategoryModel({this.picture, this.name});
}

List<CategoryModel> categoryList = [
  CategoryModel(
      picture:
          'https://i.pinimg.com/originals/64/a7/04/64a704038ddde05a027917d988efb67b.jpg',
      name: 'Men'),
  CategoryModel(
      picture:
          'https://image.made-in-china.com/2f0j00ujTQKgLlYMpy/Women-Formal-Suit-Office-Coats-Women-Clothes-Apparel-Wind-Coat.jpg',
      name: 'Women'),
  CategoryModel(
      picture:
          'https://i.pinimg.com/originals/cd/b1/ba/cdb1ba0c27ee410ab95c130eee3fd357.jpg',
      name: 'Kids'),
];
