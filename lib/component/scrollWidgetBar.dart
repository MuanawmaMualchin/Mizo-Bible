import 'package:flutter/material.dart';

class ScrollPageBarDelegate extends SliverPersistentHeaderDelegate {
  /// SliverPersistentHeaderDelegate
  ScrollPageBarDelegate(
    this.builder,
    {
      this.minHeight:kToolbarHeight, this.maxHeight:kToolbarHeight
    }
  );
  final double minHeight;
  final double maxHeight;
  final Function builder;

  @override
  // bool shouldRebuild(ScrollPageBarDelegate oldDelegate) => maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight;
  bool shouldRebuild(ScrollPageBarDelegate oldDelegate) => true;

  @override
  double get maxExtent => maxHeight;
  // kToolbarHeight

  @override
  double get minExtent => minHeight;

  // double stretch = 0.0;
  // double shrink = 1.0;
  // double get shrink => (maxHeight - minExtent)/(maxExtent - minExtent);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    double stretch = (shrinkOffset/maxExtent).toDouble();
    double shrink = (1.0 - stretch).toDouble();
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(2.0),
    //   child: Container(
    //     margin: const EdgeInsets.only(bottom: 0.5),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(3.0),
    //       color: Theme.of(context).primaryColor,
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.black38,
    //           offset: Offset(0.0, 1.0),
    //           blurRadius: 0.5,
    //         ),
    //       ],
    //     ),
    //     child: builder(context,shrinkOffset,overlapsContent,shrink,stretch)
    //   )
    // );
    return Container(
      // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: new BorderRadius.vertical(
          bottom: Radius.elliptical(3, 2)
        ),
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(10.0),
        //   bottomRight: Radius.circular(10.0)
        // ),
        // border: Border(
        //   bottom: BorderSide(
        //     color: Colors.grey,
        //     width: 1.0,
        //   ),
        // ),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: Colors.black38,
            // color: Theme.of(context).backgroundColor,
            spreadRadius: 0.0,
            offset: Offset(0.0, .0),
          )
        ]
      ),
      child: new SizedBox.expand(
        child: builder(context,shrinkOffset,overlapsContent,shrink,stretch)
      )
    );
    // return Container(
    //   // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    //   decoration: BoxDecoration(
    //     color: Theme.of(context).primaryColor,
    //     borderRadius: new BorderRadius.vertical(
    //       bottom: Radius.elliptical(3, 2)
    //     ),
    //     // borderRadius: BorderRadius.only(
    //     //   bottomLeft: Radius.circular(10.0),
    //     //   bottomRight: Radius.circular(10.0)
    //     // ),
    //     // border: Border(
    //     //   bottom: BorderSide(
    //     //     color: Colors.grey,
    //     //     width: 1.0,
    //     //   ),
    //     // ),
    //     boxShadow: [
    //       BoxShadow(
    //         blurRadius: 0.0,
    //         color: Colors.black38,
    //         // color: Theme.of(context).backgroundColor,
    //         spreadRadius: 0.0,
    //         offset: Offset(0.0, .0),
    //       )
    //     ]
    //   ),
    //   child: new SizedBox.expand(
    //     child: builder(context,shrinkOffset,overlapsContent,shrink,stretch)
    //   )
    // );
    // return LayoutBuilder(builder: (context, constraints){
    //   // print('constraints.maxHeight ${constraints.maxHeight}');
    //   // final percentage = (constraints.maxHeight - minExtent)/(maxExtent - minExtent);
    //   // return _container(context,shrinkOffset,overlapsContent, percentage);
    //   // print('stretch $stretch shrink $shrink');
    // });

  }
}
/*
class ScrollPageBarDelegateTesting extends SliverPersistentHeaderDelegate {
  int index = 0;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final Color color = Colors.primaries[index];
          final double percentage = (constraints.maxHeight - minExtent)/(maxExtent - minExtent);

          if (++index > Colors.primaries.length-1)
            index = 0;

          return Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.black45)],
                gradient: LinearGradient(
                    colors: [Colors.blue, color]
                )
            ),
            height: constraints.maxHeight,
            child: SafeArea(
                child: Center(
                  child: CircularProgressIndicator(
                    value: percentage,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
            ),
          );
        }
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 250.0;

  @override
  double get minExtent => 80.0;
}
*/