import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/category.dart';
import '../../models/product.dart';
import 'app_colors.dart';
import 'app_images.dart';

class ProductItem extends StatefulWidget {
  final Color? clickedIconColor;
  final bool? hasPlusIcon;
  final dynamic dataObj;
  const ProductItem({
    super.key,
    this.clickedIconColor,
    this.hasPlusIcon,
    this.dataObj,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF8F7F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: widget.dataObj is Category
                      ? Image.network(
                          widget.dataObj.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : widget.dataObj is Product
                      ? Image.network(
                          widget.dataObj.images[0],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : SvgPicture.asset(AppImages.imageNotFound),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            widget.dataObj is Category
                                ? widget.dataObj.name
                                : widget.dataObj is Product
                                ? widget.dataObj.title
                                : "Watch",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.dataObj is Product
                                ? "\$${widget.dataObj.price}"
                                : "",
                            style: TextStyle(
                              color: Color(AppColors.primaryColor),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    widget.hasPlusIcon ?? false
                        ? CircleAvatar(
                            radius: 14,
                            backgroundColor: Color(AppColors.primaryColor),
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 8,
            top: 10,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isClicked = !isClicked;
                });
              },
              child: Icon(
                isClicked ? Icons.favorite : Icons.favorite_border,
                color: widget.clickedIconColor ?? Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
