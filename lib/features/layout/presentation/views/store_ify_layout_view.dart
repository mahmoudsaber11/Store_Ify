import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:store_ify/features/layout/presentation/cubit/layout_state.dart';

class StoreIfyLayout extends StatelessWidget {
  const StoreIfyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //   actions: const [
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 21),
          //   child: Icon(
          //     Icons.notifications_none,
          //     color: Colors.grey,
          //   ),
          // ),
          //   ],
          // ),
          body: cubit.views()[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 20,
            selectedItemColor: AppColors.primaryColor,
            unselectedIconTheme:
                const IconThemeData(color: AppColors.iconsColor),
            unselectedLabelStyle: AppTextStyles.textStyle8Regular.copyWith(
              fontWeight: FontWeight.bold,
            ),
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeBottomNav(value, context);
            },
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.storefront_sharp), label: "Stores"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
            ],
          ),
        );
      },
    );
  }
}
