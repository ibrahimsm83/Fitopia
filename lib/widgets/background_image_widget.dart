import 'package:fitopia/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import '../presentation/resources/index_manager.dart';

// ignore: must_be_immutable
class BackgroundImage extends StatelessWidget {
  Widget? child;
  BackgroundImage({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImageAssets.backgroundImage),
            fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
