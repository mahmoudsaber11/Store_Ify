import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/Features/layout/presentation/cubit/store_ify_cubit.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/layout/presentation/cubit/store_ify_states.dart';

class StoreIfyLayout extends StatelessWidget {
  const StoreIfyLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreIfyCubit(),
      child: BlocBuilder<StoreIfyCubit, StoreIfyState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.grey,
                  ),
                ),
              ],
              title: Row(
                children: [
                  Image.asset(AppAssets.imagesPerson),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    children: [
                      Text(
                        "Hello,Yasmeen",
                        style: AppTextStyles.textStyle8Regular
                            .copyWith(color: AppColors.appColor, fontSize: 12),
                      ),
                      Text(
                        "Alexandria,Egypt",
                        style: AppTextStyles.textStyle8Regular
                            .copyWith(fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: AppColors.primaryColor,
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              unselectedLabelStyle: AppTextStyles.textStyle8Regular.copyWith(
                fontWeight: FontWeight.bold,
              ),
              currentIndex: StoreIfyCubit.get(context).currentIndex,
              onTap: (value) {
                StoreIfyCubit.get(context).changeBottomNav(value);
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
      ),
    );
  }
}
