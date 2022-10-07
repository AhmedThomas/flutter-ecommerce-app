import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String adress;
  final String city;
  final String country;
  final String zipCode;

  const User({
    this.id,
    this.fullName = '',
    this.email = '',
    this.adress = '',
    this.city = '',
    this.country = '',
    this.zipCode = '',
  });

  User copyWith({
    final String? id,
    final String? fullName,
    final String? email,
    final String? adress,
    final String? city,
    final String? country,
    final String? zipCode,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      adress: adress ?? this.adress,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      fullName: snap['fullName'],
      email: snap['email'],
      adress: snap['adress'],
      city: snap['city'],
      country: snap['country'],
      zipCode: snap['zipCode'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'adress': adress,
      'city': city,
      'country': country,
      'zipCode': zipCode,
    };
  }

  @override
  List<Object?> get props =>
      [id, fullName, email, adress, city, country, zipCode];
}
