import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    const Category(
      name: 'T-shirts',
      imageUrl:
          'https://img.freepik.com/premium-psd/black-white-tshirt-folded-mockup-realistic_74058-605.jpg?w=996',
    ),
    const Category(
      name: 'Jeans',
      imageUrl:
          'https://img.freepik.com/premium-photo/jeans-wooden_93675-28345.jpg?w=996',
    ),
    const Category(
      name: 'Shoes',
      imageUrl:
          'https://img.freepik.com/premium-photo/fashion-male-sport-shoes-blue-background-stylish-man-sneakers-fitness-close-up_77190-1693.jpg?w=996',
    ),
  ];
}
