import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceWidget extends StatelessWidget {
  final String oldPrice;
  final String newPrice;
  final String discountPercent;

  const PriceWidget({
    super.key,
    required this.oldPrice,
    required this.newPrice,
    required this.discountPercent,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Giá mới
        Text(
          currencyFormatter.format(int.parse(newPrice)),
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4), // Khoảng cách giữa các dòng
        // Giá cũ và % giảm giá
        Row(
          children: [
            Text(
              currencyFormatter.format(int.parse(oldPrice)),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "- ${double.parse(discountPercent).toStringAsFixed(2)}%",
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
