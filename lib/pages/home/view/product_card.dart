import 'package:collecto_data/collecto_data.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.p);

  final Product p;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              p.image,
              width: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.contain,
            ),
            Text(
              p.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(p.description),
          ],
        ),
      ),
    );
  }
}
