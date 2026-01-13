import 'package:flutter/material.dart';

class FeaturedProductsScreen extends StatefulWidget {
  const FeaturedProductsScreen({super.key});

  @override
  State<FeaturedProductsScreen> createState() => _FeaturedProductsScreenState();
}

class _FeaturedProductsScreenState extends State<FeaturedProductsScreen> {
  final _search = TextEditingController();

  final List<_Product> _all = const [
    _Product(name: 'Shampoo', price: 144.99, currency: 'TL', icon: Icons.spa_outlined),
    _Product(name: 'Elidor Cream', price: 200.00, currency: 'TL', icon: Icons.medication_outlined),
    _Product(name: 'Vitamin C', price: 89.90, currency: 'TL', icon: Icons.local_pharmacy_outlined),
    _Product(name: 'Pain Relief', price: 59.50, currency: 'TL', icon: Icons.healing_outlined),
  ];

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = _search.text.trim().toLowerCase();
    final items = _all.where((p) => p.name.toLowerCase().contains(q)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Featured products')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _search,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _search.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        _search.clear();
                        setState(() {});
                      },
                      icon: const Icon(Icons.close),
                    ),
              filled: true,
              fillColor: Colors.black12.withOpacity(0.10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('${items.length} items', style: const TextStyle(fontWeight: FontWeight.w600)),
              const Spacer(),
              Text(q.isEmpty ? 'All' : 'Filtered', style: const TextStyle(color: Colors.black54)),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ProductTile(
                  product: p,
                  onAdd: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added: ${p.name}')),
                    );
                  },
                ),
              )),
          if (items.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(child: Text('No results', style: TextStyle(color: Colors.black54))),
            ),
        ],
      ),
    );
  }
}

class _Product {
  final String name;
  final double price;
  final String currency;
  final IconData icon;
  const _Product({required this.name, required this.price, required this.currency, required this.icon});
}

class _ProductTile extends StatelessWidget {
  final _Product product;
  final VoidCallback onAdd;
  const _ProductTile({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final priceText = product.price % 1 == 0 ? product.price.toStringAsFixed(0) : product.price.toStringAsFixed(2);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(product.icon),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text('$priceText ${product.currency}', style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          FilledButton(onPressed: onAdd, child: const Text('Add')),
        ],
      ),
    );
  }
}
