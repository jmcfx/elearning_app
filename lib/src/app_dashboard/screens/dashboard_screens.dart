import 'package:elearning_app/common/values/colors/colors.dart';
import 'package:elearning_app/src/app_dashboard/bloc/dashboard_bloc.dart';
import 'package:elearning_app/src/app_dashboard/bloc/dashboard_events.dart';
import 'package:elearning_app/src/app_dashboard/bloc/dashboard_states.dart';
import 'package:elearning_app/src/app_dashboard/widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardScreens extends StatefulWidget {
  const DashBoardScreens({super.key});

  @override
  State<DashBoardScreens> createState() => _DashBoardScreensState();
}

class _DashBoardScreensState extends State<DashBoardScreens> {
 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: pageIndexList(index: state.index),
            bottomNavigationBar: Container(
              width: MediaQuery.of(context).size.width,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourthElementText,
                currentIndex: state.index,
                onTap: (value) {
                  context.read<DashboardBloc>().add(TriggerAppEvent(index: value));
                },
                elevation: 0,
                items: [
                 ...bottomNavItem
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
