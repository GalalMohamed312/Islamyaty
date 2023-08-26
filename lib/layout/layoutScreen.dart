import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyat/utils/app_colors.dart';

import '../cubit/Cubit.dart';
import '../cubit/states.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return  Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar:ConvexAppBar(
              initialActiveIndex: cubit.currentIndex,
              shadowColor: Colors.grey,
              // color: Colors.white,
                backgroundColor: AppColors.amber,
                activeColor: AppColors.amber,
                onTap: (index){
                  cubit.changeIndex(index);
                }, items:cubit.screenItems
            ),
          );
        },
      ),
    );
  }
}
