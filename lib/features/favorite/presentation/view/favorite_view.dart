import 'package:flutter/material.dart';
import 'package:store_ify/features/favorite/presentation/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoriteViewBody(),
    );
  }
}
