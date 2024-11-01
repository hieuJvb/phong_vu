import 'dart:math';
import 'package:flutter/material.dart';

import '../../common/font.dart';
import '../../models/product_detail.dart';

class ProductAttributesList extends StatefulWidget {
  final List<AttributeGroup> attributeGroups;

  const ProductAttributesList({super.key, required this.attributeGroups});

  @override
  State<ProductAttributesList> createState() => _ProductAttributesListState();
}

class _ProductAttributesListState extends State<ProductAttributesList> {
  late bool _isShowAll = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: _isShowAll
              ? widget.attributeGroups.length
              : min(7, widget.attributeGroups.length),
          itemBuilder: (context, index) {
            final attribute = widget.attributeGroups[index];

            return Container(
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? Colors.white
                    : Colors.grey.withOpacity(0.6),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      attribute.name,
                      style: AppFonts.kFontParagraph,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      attribute.value,
                      style: AppFonts.kFontParagraph,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isShowAll ? 'Thu gọn' : 'Xem thêm nội dung', style: const  TextStyle(color:  Colors.grey, fontSize: 18),),
            IconButton(
              icon: _isShowAll
                  ? const Icon(Icons.expand_less)
                  : const Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isShowAll = !_isShowAll;
                });
              },
            )
          ],
        ),
      ],
    );
  }
}
