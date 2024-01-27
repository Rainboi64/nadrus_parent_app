import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../extensions/assets_extension.dart';
import '../resources/colors/colors.dart';

selectableItem(String text, {bool selected = false, bool isCircle = true}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 6),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: selected ? DesignColors.primaryColor : Colors.transparent)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18, color: DesignColors.textColor),
        ),
        isCircle
            ? SvgPicture.asset(selected
                ? 'circle_selected'.svgAsset
                : 'circle_unselected'.svgAsset)
            : SvgPicture.asset(selected
                ? 'square_selected'.svgAsset
                : 'square_unselected'.svgAsset),
      ],
    ),
  );
}
