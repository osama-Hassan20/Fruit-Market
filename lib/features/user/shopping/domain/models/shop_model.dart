class ProductModel {
  String? name;
  dynamic price;
  String? image;
  String? description;
  String? category;
  String? subCategory;
  dynamic rate;
  dynamic discount;
  String? nutrition; //يحتوي علي اي (حديد وفسفور و..........)
  String? uId;

  ProductModel({
    this.name,
    this.price,
    this.image,
    this.description,
    this.category,
    this.subCategory,
    this.rate,
    this.discount,
    this.nutrition,
    this.uId,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    category = json['category'];
    subCategory = json['subCategory'];
    rate = json['rate'];
    discount = json['discount'];
    nutrition = json['nutrition'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
      'subCategory': subCategory,
      'rate': rate,
      'discount': discount,
      'nutrition': nutrition,
      'uId': uId,
    };
  }
}
