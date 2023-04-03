import 'package:flutter/material.dart';
import 'package:flutter_map_proj/constant/dimens.dart';

class MyBackButton extends StatelessWidget {
  Function() onPressed;
  MyBackButton({
  super.key,
  required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimens.medium,
      left: Dimens.medium,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2,3),
              blurRadius: 18,
            ),
          ],
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}