import 'package:elearning_app/src/common/values/colors/colors.dart';
import 'package:elearning_app/src/features/home/bloc/home_blocs.dart';
import 'package:elearning_app/src/features/home/bloc/home_states.dart';
import 'package:elearning_app/src/features/home/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildHomeAppBar(),
      body: BlocBuilder<HomeBlocs, HomeStates>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04.h),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              homeText(
                text: "Hello,",
                color: AppColors.primaryThirdElementText,
              ),
              homeText(
                  text: "Onyedikachukwu",
                  color: AppColors.primaryText,
                  top: 5),
              SizedBox(
                height: 10.h,
              ),
              //search...
              customSearchBar(context),
              //image Slider...
              sliderView(context: context, state: state),
              //menu ...
              menuView(context: context)
            ],
          ),
        );
      }),
    );
  }
}
