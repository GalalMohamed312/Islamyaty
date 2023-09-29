import 'package:flutter/material.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.location_off,
            size: 150,
            color: AppColors.darkRed,
          ),
          const SizedBox(height: AppSize.s30),
          Text(
            error!,
            style: const TextStyle(color: AppColors.darkRed, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height:  AppSize.s30),
          ElevatedButton(
            child: const Text("Retry"),
            onPressed: () {
              if (callback != null) callback!();
            },
          )
        ],
      ),
    );
  }
}