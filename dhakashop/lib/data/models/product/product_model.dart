class Product {
  final int id;
  final int category;
  final String name;
  final String description;
  final double price;
  final int stock;
  final DateTime createdAt;
  final List<Review> reviews;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.createdAt,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
      stock: json['stock'],
      createdAt: DateTime.parse(json['created_at']),
      reviews: (json['reviews'] as List<dynamic>)
          .map((review) => Review.fromJson(review))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'description': description,
      'price': price.toStringAsFixed(2),
      'stock': stock,
      'created_at': createdAt.toIso8601String(),
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }

  static List<Product> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Product.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Product> products) {
    return products.map((product) => product.toJson()).toList();
  }
}

class Review {
  final int product;
  final int rating;
  final String comment;
  final DateTime createdAt;
  final User user;

  Review({
    required this.product,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      product: json['product'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'rating': rating,
      'comment': comment,
      'created_at': createdAt.toIso8601String(),
      'user': user.toJson(),
    };
  }

  static List<Review> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Review.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Review> reviews) {
    return reviews.map((review) => review.toJson()).toList();
  }
}

class User {
  final int id;
  final String username;
  final String email;
  final bool isStaff;
  final bool isSuperuser;
  final DateTime dateJoined;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.isStaff,
    required this.isSuperuser,
    required this.dateJoined,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      isStaff: json['is_staff'],
      isSuperuser: json['is_superuser'],
      dateJoined: DateTime.parse(json['date_joined']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'is_staff': isStaff,
      'is_superuser': isSuperuser,
      'date_joined': dateJoined.toIso8601String(),
    };
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<User> users) {
    return users.map((user) => user.toJson()).toList();
  }
}
