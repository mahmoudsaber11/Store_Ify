import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/widgets/custom_stores_item.dart';

class StoresListView extends StatelessWidget {
  const StoresListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 166.h,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CustomStoresItem();
          },
          separatorBuilder: ((context, index) => SizedBox(
                height: 10.h,
              )),
          itemCount: 5),
    );
  }
}
