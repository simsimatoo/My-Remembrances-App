import 'package:daily_supplications_app/shared/cubit/cubit.dart';
import 'package:daily_supplications_app/shared/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'supplications_screen.dart';

class PrayerScreen extends StatelessWidget {
  String? title;
  int? number;
  int? id;

  PrayerScreen(this.title, this.number, this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    double num = double.parse(number.toString());
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
            iconTheme: IconThemeData(size: 25.h,color: Theme.of(context).appBarTheme.iconTheme?.color),
            actions: [
              IconButton(
              onPressed: () {
                AppCubit.get(context).changeValueOfThemeMode();
        },
            icon: Icon(
              Icons.nightlight_round,
              size: 25.h,
            ),
              )
            ],
            leading: IconButton(
              onPressed: () {
                AppCubit.get(context).getNumber(id);

                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const SupplicationsScreen()), (route) => false);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 25.h,
              ),
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            child:
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$title",
                      style: Theme.of(context).textTheme.labelMedium!,textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                          minimum: 0,
                          maximum: num,
                          showLabels: false,
                          showTicks: false,
                          axisLineStyle: const AxisLineStyle(
                            thickness: 0.2,
                            cornerStyle: CornerStyle.bothCurve,
                            color: Color.fromARGB(30, 0, 169, 181),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: AppCubit.get(context).number,
                              cornerStyle: CornerStyle.bothCurve,
                              width: 0.2,
                              sizeUnit: GaugeSizeUnit.factor,
                              color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                            )
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                positionFactor: 0.1,
                                angle: 90,
                                widget: Text(
                                  '${AppCubit.get(context).number.toStringAsFixed(0)} / $number',
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 20.sp,
                                  ),
                                ))
                          ])
                    ]),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 40.w),
                      child: Center(
                        child: Container(
                            width: double.infinity,
                            height: 60.h,
                            decoration: BoxDecoration(
                                color:Theme.of(context).floatingActionButtonTheme.backgroundColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: MaterialButton(
                              onPressed: () {
                                AppCubit.get(context).changeValueNumber(number!, id!);
                              },
                              child:  Text(
                                "قم بدعاء",
                                style: TextStyle(color: Colors.white, fontSize: 20.sp),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
