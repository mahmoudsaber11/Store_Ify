import 'package:flutter/material.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/features/stores/data/models/stores_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomStoresItem extends StatefulWidget {
  const CustomStoresItem({
    super.key,
    required this.storesModel,
  });
  final StoresModel storesModel;

  @override
  State<CustomStoresItem> createState() => _CustomStoresItemState();
}

class _CustomStoresItemState extends State<CustomStoresItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(routeName: Routes.storesDetailsViewRoute);
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 122.h,
              width: 169.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget
                      .storesModel.image.secureUrl), // Provide the image path
                  //  fit: BoxFit.fill, // Adjust the BoxFit as needed
                ),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              width: 169.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.storesModel.name,
                        style: AppTextStyles.textStyle14Regular,
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 19.sp,
                        ),
                      ),
                    ],
                  ),
                  RatingBar.builder(
                    initialRating:
                        3, // Initial rating value (you can set it dynamically based on your data)
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 12,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      rating = widget.storesModel.rate;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
