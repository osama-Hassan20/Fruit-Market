class UserModel{
  String? email;
  String? name;
  String? phone;
  String? uId;
  String? image;
  String? coverImage;
  String? address;
  String? gender;

  UserModel({
    this.email,
    this.name,
    this.phone,
    this.uId,
    this.image,
    this.coverImage,
    this.address,
    this.gender,
  });


  UserModel.fromJson(Map<String,dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    coverImage = json['coverImage'];
    address = json['address'];
    gender = json['gender'];
  }

  Map<String , dynamic> toMap()
  {
    return{
      'email':email,
      'name':name,
      'phone':phone,
      'uId':uId,
      'image':image,
      'coverImage':coverImage,
      'address':address,
      'gender':gender,
    };
  }
}