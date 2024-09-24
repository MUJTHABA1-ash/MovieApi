import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/Repository/Model_class/Movie_model.dart';
import 'package:untitled6/bloc/movie_bloc.dart';
import 'package:untitled6/main.dart';
import 'package:untitled6/ui/Details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<MovieBloc>(context).add(fetchMovie());
  }

  late Moviemodel Movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  Text(
                    "FilmKu",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF110E47),
                      fontSize: 16.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    size: 25.sp,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Row(
                children: [
                  Text(
                    'Now Showing',
                    style: TextStyle(
                      color: Color(0xFF110E46),
                      fontSize: 16.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 140.w,
                  ),
                  Container(
                    width: 61.w,
                    height: 21.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: Color(0xFFE5E4EA)),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                    child: Center(
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 334.h,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is Movieloading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is Movieerror) {
                      return RefreshIndicator(
                        child: Text("this is wrang"),
                        onRefresh: () async {
                          return BlocProvider.of<MovieBloc>(context)
                              .add(fetchMovie());
                        },
                      );
                    }
                    if (state is Movieloaded) {
                      Movie = BlocProvider.of<MovieBloc>(context).moviemodel;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: Movie.movies!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Details(
                                      image: Movie.movies![index].backdropPath
                                          .toString(),
                                      title:
                                          Movie.movies![index].title.toString(),
                                      genres: Movie.movies![index].genres!,
                                      description: Movie.movies![index].overview
                                          .toString())));
                            },
                            child: Container(
                              height: 294.h,
                              width: 200.w,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                      height: 252.h,
                                      width: 210.w,
                                      child: Image.network(
                                        Movie.movies![index].backdropPath
                                            .toString(),
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Container(
                                      height: 50.h,
                                      width: 190.w,
                                      child: Text(
                                        Movie.movies![index].title.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(
                                          width: 5.w,
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
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 20.w,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Row(
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: Color(0xFF110E46),
                      fontSize: 16.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 180.w,
                  ),
                  Container(
                    width: 61.w,
                    height: 21.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: Color(0xFFE5E4EA)),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                    child: Center(
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 200.h,
              child: GestureDetector(
                onTap: () {},
                child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is Movieloading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is Movieerror) {
                      return RefreshIndicator(
                        child: Text("this is wrang"),
                        onRefresh: () async {
                          return BlocProvider.of<MovieBloc>(context)
                              .add(fetchMovie());
                        },
                      );
                    }
                    if (state is Movieloaded) {
                      Movie = BlocProvider.of<MovieBloc>(context).moviemodel;
                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: Movie.movies!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Details(
                                        image: Movie.movies![index].backdropPath
                                            .toString(),
                                        title: Movie.movies![index].title
                                            .toString(),
                                        genres: Movie.movies![index].genres!,
                                        description: Movie
                                            .movies![index].overview
                                            .toString())));
                              },
                              child: Container(
                                  height: 140.h,
                                  width: 334.w,
                                  decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r)))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h, left: 10.w),
                              child: Container(
                                height: 120.h,
                                width: 100.w,
                                child: Image.network(
                                  Movie.movies![index].backdropPath.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 130.w, top: 20.h),
                              child: Text(
                                Movie.movies![index].title.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 130.w, top: 55.h),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 155.w, top: 55.h),
                              child: Text(
                                '6.4/10 IMDb',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 12.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 126.w, top: 90.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                      width: 220.w,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            Movie.movies![index].genres!.length,
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
                                                  Movie.movies![index]
                                                      .genres![position]
                                                      .toString(),
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
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                  ],
                                ))
                          ]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 5.w,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
