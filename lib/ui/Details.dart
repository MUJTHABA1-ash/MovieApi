import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/main.dart';


class Details extends StatefulWidget {
  final String image;
  final String title;
  final List<dynamic> genres;
  final String description;
  const Details({super.key, required this.image, required this.title, required this.genres, required this.description});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height:230.h,
                  width:375.w,
                  child: Image.network(widget.image,fit: BoxFit.cover,)),
              Padding(
                padding: EdgeInsets.only(top: 220.h),
                child: Stack(
                  children: [
                    Container(
                        height: 470.h,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r))))),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 310.w,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Mulish',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 90.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                '9.1/10 IMDb',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 12.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.w,top: 70.h),
                      child: SizedBox(
                        height: 20.h,
                        width: 340.w,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                          widget.genres.length,
                          itemBuilder: (BuildContext context,
                              int position) {
                            return Container(
                              height: 20.h,
                              width: 60.w,
                              decoration: ShapeDecoration(
                                color: Color(0xFFDBE3FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(100),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10),
                                  child: Text(
                                    widget.genres[position].toString(),
                                    style: TextStyle(
                                      color: Color(0xFF88A4E8),
                                      fontSize: 8.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context,
                              int position) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 100.h, left: 20.w),
                      child: Column(
                        children: [

                          SizedBox(
                            height: 18.h,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Length',
                                    style: TextStyle(
                                      color: Color(0xFF9B9B9B),
                                      fontSize: 12.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '2h 28min',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 40.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Language',
                                    style: TextStyle(
                                      color: Color(0xFF9B9B9B),
                                      fontSize: 12.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'English',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 40.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Rating',
                                    style: TextStyle(
                                      color: Color(0xFF9B9B9B),
                                      fontSize: 12.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'PG-13',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 200.h, left: 25.w),
                      child:
                          Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'Merriweather',
                              fontWeight: FontWeight.w900,
                            ),
                          ),


                      ),
                    Padding(
                      padding:  EdgeInsets.only(top: 230.h,left: 22.w),
                      child: Text(
                    widget.description,
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 13.sp,
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w400,

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 25.w,top: 330.h),
                      child: Row(
                        children: [
                          Text(
                            'Cast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'Merriweather',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 201.w,
                          ),
                          Container(
                            width: 61.h,
                            height: 21.w,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFE5E4EA)),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child:
                            Center(
                              child: Text(
                                'See more',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFFAAA8B0),
                                  fontSize: 10.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 25.w,top: 360.h),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child :
                          Row(
                            children: [
                              Image.asset("assets/a.png",height: 100.h,width: 100.w,),
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset("assets/b.png",height: 100.h,width: 100.w,),
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset("assets/c.png",height: 100.h,width: 100.w,),
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset("assets/d.png",height: 100.h,width: 100.w,)
                            ],
                          ),

                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
