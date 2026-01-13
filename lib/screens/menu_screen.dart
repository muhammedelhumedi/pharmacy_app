import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured products'),
        // سهم الرجوع يظهر تلقائيًا
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ProductTile(name: 'Shampoo', price: '144.99 TL'),
          SizedBox(height: 12),
          ProductTile(name: 'Elidor Cream', price: '200 TL'),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String name;
  final String price;

  const ProductTile({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
