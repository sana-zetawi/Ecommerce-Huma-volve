import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  final int productId;
  const ShareButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      icon: const Icon(Icons.share),
      onPressed: () async {
      final productLink = 'https://ecommerce-huma-volve-86b0b.web.app/products/$productId';
      final String shareMassage = 'Look at this product: $productLink';
      await SharePlus.instance.share(ShareParams(
        text: shareMassage,
        subject: 'Check out this product!',
      ));
      },
    );
  }
}