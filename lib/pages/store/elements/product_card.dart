import 'package:cached_network_image/cached_network_image.dart';
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
        child: Column(
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
          child: CachedNetworkImage(
            width: Get.width * 0.4,
            height: Get.height * 0.15,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
            imageUrl: p.image,
          ),
        ),
      );

  Widget get _productHeader => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${p.title}\n',
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
                  '100',
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
                Text(
                  'Price per share required'.tr,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      );

  Widget get _btnBuyNow => InkWell(
        onTap: () => Get.log('Item with ID:${p.id} was clicked'),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.greenAccent,
          ),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Text(
            'Buy Now'.tr,
            textAlign: TextAlign.center,
          ),
        ),
      );
}
