import 'package:collecto_data/collecto_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.p);

  final Product p;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        //height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            _productPreview,
            _spacer,
            _productHeader,
            _spacer,
            _shares,
            _spacer,
            _btnBuyNow,
          ],
        ),
      ),
    );
  }

  Widget get _productPreview => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.black12,
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Image.network(
            p.image,
            width: Get.width * 0.4,
            height: Get.height * 0.15,
            fit: BoxFit.contain,
          ),
        ),
      );

  Widget get _productHeader => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              p.title,
              maxLines: 2,
              style: Get.theme.textTheme.titleMedium,
            ),
            _spacer,
            Text(
              p.description,
              maxLines: 2,
              style: Get.theme.textTheme.bodySmall,
            ),
          ],
        ),
      );

  Widget get _spacer => const SizedBox(height: 10);

  Widget get _shares => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Text(
                  p.rating.count.toString(),
                  style: Get.textTheme.bodyLarge?.copyWith(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'N. of shares available',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Text(
                  '${p.rating.count}€',
                  style: Get.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const Text(
                  'Price per share required',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      );

  Widget get _btnBuyNow => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.greenAccent,
        ),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: const Text(
          'Buy Now',
          textAlign: TextAlign.center,
        ),
      );
}
