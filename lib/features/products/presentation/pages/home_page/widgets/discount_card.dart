import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/product_bloc/product_bloc.dart';

import '../../../../../../core/constantes/constantes.dart';
import '../../food_detail_page/food_detail_view.dart';
import '../components/size_config.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical! * 3,
          bottom: SizeConfig.blockSizeVertical! * 2),

      /// 20.0 - 10.0
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadindState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoadedState) {
            return CarouselSlider(
              options: CarouselOptions(
                
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlay: false,
              ),
              items: state.productList
                  .map((product) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FoodDetailView(food: product))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.blockSizeHorizontal! * 5.5),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              product.image == 'no-image.png'
                                  ? Image.asset(
                                      'assets/main/no_image.jpeg',
                                      fit: BoxFit.cover,
                                    )
                                  : FadeInImage(
                                      //? Rivisar esto aqui...
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return const Image(
                                            image: AssetImage(
                                                'assets/main/loading.gif'));
                                      },
                                      fit: BoxFit.fill,
                                      placeholder: const AssetImage(
                                          'assets/main/loading.gif'),
                                      image: NetworkImage(
                                        '$apiUrl/uploads/products/${product.id}',
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            );
          } else {
            return const Text('Ha occurido algun Error');
          }
        },
      ),
    );
  }
}
