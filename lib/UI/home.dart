import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Bloc/image_bloc.dart';
import '../Repository/Modelclass/image.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

TextEditingController controller = TextEditingController();
late Image1 data;

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w),
              child: Container(
                  width: 319.w,
                  height: 234.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35.20.sp,
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w700,
                      ),
                      controller: controller,
                      autofocus: true,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 130.w),
              child: GestureDetector(onTap: (){
                print("helol");
                BlocProvider.of<ImageBloc>(context).add(
                    FetchImage(text: controller.text));
              },
                child: Container(
                    width: 150.w,
                    height: 100.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Get',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32.sp,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w),
              child: Container(
                width: 319.w,
                height: 234.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: SizedBox(
                    width: 319.w,
                    height: 234.h,
                    child: BlocBuilder<ImageBloc, ImageState>(
                        builder: (context, state) {
                      if (state is ImageLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ImageError) {
                        return Text('error');
                      }
                      if (state is ImageLoaded) {
                        data = BlocProvider.of<ImageBloc>(context).image;
                        return Image.network(data.data![0].toString());
                      }
                      else {
                        return SizedBox();
                      }
                    }
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
