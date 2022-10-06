import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        id: snap.id,
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular']);
    return product;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static List<Product> products = [
    const Product(
      id: '0',
      name: 'T-shirt #1',
      category: 'T-shirts',
      imageUrl:
          'https://img.freepik.com/free-psd/mockup-black-t-shirt-light-beige-background_125540-1410.jpg?w=996&t=st=1663821539~exp=1663822139~hmac=7c7e79eaf6e0e20dd5ed3f052695f308cdcb33b2b9c0c0bdb09e95d20e673d0f',
      price: 199,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '1',
      name: 'T-shirt #2',
      category: 'T-shirts',
      imageUrl:
          'https://img.freepik.com/free-psd/polo-shirt-mockup_125540-1417.jpg?w=996&t=st=1663821540~exp=1663822140~hmac=388c50df4499e4a9747164e3f9b786309fdfabb2c4b9a6f53d9ba0649dab9598',
      price: 199,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '2',
      name: 'Jeans #1',
      category: 'Jeans',
      imageUrl:
          'https://img.freepik.com/free-photo/jeans_1203-8094.jpg?w=740&t=st=1663822224~exp=1663822824~hmac=bb0d637affac6f0fad03b9b1c67369195940cc2b207e01829e96d0918e59c2a7',
      price: 299,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      id: '3',
      name: 'Jeans #1',
      category: 'Jeans',
      imageUrl:
          'https://img.freepik.com/free-photo/shopping-textile-black-trousers-white_1203-6504.jpg?w=996&t=st=1663822233~exp=1663822833~hmac=9ec6e260ae695936cc2f4de7742a1e4cc2a8ff9a72ae61c4da92fdcf2ccaca61',
      price: 299,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '4',
      name: 'Shoes #1',
      category: 'Shoes',
      imageUrl:
          'https://img.freepik.com/free-photo/pair-trainers_144627-3800.jpg?w=740&t=st=1663822413~exp=1663823013~hmac=78eb9f3ccda706052f6ab2cc732f678a4b3f459c9ee51452efadc924b7266b5c',
      price: 499,
      isRecommended: false,
      isPopular: false,
    ),
    const Product(
      id: '5',
      name: 'Shoes #2',
      category: 'Shoes',
      imageUrl:
          'https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?w=996&t=st=1663822412~exp=1663823012~hmac=bba4a494bfad88f87ac1bd3916e423db13683203c1439b060b034932a0a81fcb',
      price: 499,
      isRecommended: false,
      isPopular: true,
    ),
  ];
}
