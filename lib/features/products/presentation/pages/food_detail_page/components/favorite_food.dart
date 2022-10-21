import 'package:flutter/material.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class FavoriteFood extends StatelessWidget {
  const FavoriteFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.favorite),
      color: Colors.white,
      iconSize: SizeConfig.blockSizeVertical! * 5,
    );
  }
}
