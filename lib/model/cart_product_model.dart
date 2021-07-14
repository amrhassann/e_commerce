
class CartProductModel{
  String name;
  String price;
  int quantity;
  String image;
  String productId;

  CartProductModel({
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.productId
  });

  CartProductModel.formJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    name = map['name'];
    quantity = map['quantity'];
    price = map['price'];
    image = map['image'];
    productId = map['productId'];
  }
  toJson(){
    return{
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productId': productId,
    };
  }

}