// // ignore_for_file: must_be_immutable, use_super_parameters
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sales_progress_report/shared/theme_color.dart';

// final _currentIndex = StateProvider.autoDispose<int>((ref) => 0);
// final _index = StateProvider.autoDispose<int>((ref) => -1);

// class ComponenCarouselSliderImageSliver extends ConsumerWidget{
//   final List imageProduct;
//   const ComponenCarouselSliderImageSliver({Key? key,
//     required this.imageProduct,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int _indexs = ref.watch(_index);
//     //print("sliver 1 ${ref.watch(_currentIndex)}");
//     //print("sliver 1 $_indexs");
//     return Container(
//       color: kWhiteColor,
//       child: Column(
//         children: [
//           CarouselSlider(
//             items: imageProduct.map(
//             (imageProduct) => Image.asset(
//               imageProduct,
//               width: double.maxFinite,
//               fit: BoxFit.cover,
//             ),).toList(),
//             options: CarouselOptions(
//               autoPlay: true,
//               reverse: true,
//               viewportFraction: 1,
//               initialPage: 0,
//               onPageChanged: ((i, reason){
//                 ref.read(_currentIndex.notifier).state = i;
//                 ref.read(_index.notifier).state = -1;
//               })
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: imageProduct.map(
//               (e) {
//                 _indexs++;
//                 return Container(
//                   margin: EdgeInsets.only(right: 4.w),
//                   width: (ref.watch(_currentIndex) == _indexs) ? 16.w : 4.w,
//                   height: 4.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.r),
//                     color: (ref.watch(_currentIndex) == _indexs) ? kPrimaryColor : kGreenColor,
//                   ),
//                 );
//               }
//             ).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }