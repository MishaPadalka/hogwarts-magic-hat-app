import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hogwarts_magic_hat_app/presentation/shared/images.dart';

class HousesGridView extends StatelessWidget {
  const HousesGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        _gridItem(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            title: 'Gryffindor',
            icon: AppImages.gryffindor),
        _gridItem(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            title: 'Slytherin',
            icon: AppImages.slytherin),
        _gridItem(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            title: 'Ravenclaw',
            icon: AppImages.ravenclaw),
        _gridItem(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            title: 'Hufflepuff',
            icon: AppImages.hufflepuff),
        _gridItem(crossAxisCellCount: 4, mainAxisCellCount: 1, title: 'Not in House'),
      ],
    );
  }

  Widget _gridItem(
      {required int crossAxisCellCount,
      required num mainAxisCellCount,
      required String title,
      String? icon}) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.black,
              width: 2.5,
            )),
        child: icon != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(icon),
                  Text(title),
                ],
              )
            : Center(child: Text(title)),
      ),
    );
  }
}
