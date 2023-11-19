import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/custom_user.dart';
import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:store_ify/core/widgets/custom_search_text_field.dart';
import 'package:store_ify/features/home/presentation/widgets/location_dialog.dart';

class SectionUpper extends StatefulWidget {
  const SectionUpper({super.key});

  @override
  State<SectionUpper> createState() => _SectionUpperState();
}

class _SectionUpperState extends State<SectionUpper> {
  Color buttonColor = AppColors.iconsColor;
  final location.Location _location = location.Location();
  // ignore: unused_field
  location.LocationData? _currentLocation;
  String? _locationName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomUser(location: 'Location:$_locationName'),
            const Spacer(),
            const Icon(
              Icons.notifications_none,
              color: AppColors.iconsColor,
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          children: [
            const Expanded(child: CustomSearchTextField()),
            SizedBox(
              width: 30,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      buttonColor = AppColors.primaryColor;
                    });
                    showDialog(
                        context: context,
                        builder: (context) {
                          return LocationDialog(
                            onPressedButton: () async {
                              setState(() {
                                context.getBack();
                                buttonColor = AppColors.iconsColor;
                              });
                              _getLocation();
                            },
                          );
                        });
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    size: 30,
                    color: buttonColor,
                  )),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _getLocation() async {
    location.LocationData currentLocation = await _location.getLocation();
    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(
      currentLocation.latitude!,
      currentLocation.longitude!,
    );

    // Using the first placemark to get the address
    geocoding.Placemark firstPlacemark =
        placemarks.isNotEmpty ? placemarks[0] : geocoding.Placemark();

    // You can use other properties of Placemark, such as `street`, `locality`, `administrativeArea`, etc.
    String address = firstPlacemark.name ?? 'Unknown Location';

    setState(() {
      _currentLocation = currentLocation;
      _locationName = address;
    });
  }
}
