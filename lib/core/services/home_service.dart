import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final categoryCollection = FirebaseFirestore.instance.collection('categories');
  final productsCollection = FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategoryByServiceClass()async{
    var value = await categoryCollection.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProductsByServiceClass()async{
    var value = await productsCollection.get();
    return value.docs;
  }
}