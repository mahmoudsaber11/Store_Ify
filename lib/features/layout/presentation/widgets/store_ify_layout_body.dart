import 'package:flutter/material.dart';
import 'package:store_ify/features/layout/presentation/widgets/custom_user.dart';

class StoreIfyLayoutBody extends StatelessWidget {
  const StoreIfyLayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomUser(),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/icons/ic_outline-notifications.jpg',
            ),
          )
        ],
      ),
    );
  }
}
