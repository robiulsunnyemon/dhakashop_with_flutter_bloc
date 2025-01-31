import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProductDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildProductDetails(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Product Details"),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      children: [
        _buildProductTitle(),
        _buildProductDescription(),
        _buildProductPrice(),
        _buildProductStock(),
        _buildProductReviews(),
      ],
    );
  }

  Widget _buildProductTitle() {
    return Text(
      data["name"],
      style: const TextStyle(
        color: Colors.red,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
    );
  }

  Widget _buildProductDescription() {
    return Text(
      data["description"],
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildProductPrice() {
    return Text(
      "Price: ${data["price"]}",
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildProductStock() {
    return Text(
      "Stock: ${data["stock"]}",
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildProductReviews() {
    return Expanded(
      child: ListView.builder(
        itemCount: data["review"].length,
        itemBuilder: (context, index) {
          final review = data["review"][index];
          return _buildReviewCard(review);
        },
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.red[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("User: ${review['user']['username']}"),
              Text("Comment: ${review['comment']}"),
              Text("Rating: ${review['rating']}"),
            ],
          ),
        ),
      ),
    );
  }
}
