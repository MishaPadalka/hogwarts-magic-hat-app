import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hogwarts_magic_hat_app/presentation/screens/home_screen/home_screen_cubit/home_screen_cubit.dart';
import 'package:hogwarts_magic_hat_app/presentation/shared/colors.dart';
import 'package:hogwarts_magic_hat_app/presentation/shared/images.dart';
import 'package:hogwarts_magic_hat_app/presentation/widgets/guesses_amount_row.dart';
import 'package:hogwarts_magic_hat_app/presentation/widgets/snack_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home Screen'),
        // actions: [ElevatedButton(onPressed: () {}, child: Text('ssss'))],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.black,
            thickness: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeScreenContent) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<HomeScreenCubit>().getRandomCharacter();
                },
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GuessesAmountRow(
                                  total: state.guesses.total,
                                  success: state.guesses.success,
                                  failed: state.guesses.failed),
                              state.character.image != ''
                                  ? CachedNetworkImage(
                                      imageUrl: state.character.image!,
                                      width: MediaQuery.of(context).size.width * 0.25,
                                      height: MediaQuery.of(context).size.height * 0.25,
                                    )
                                  : SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.25,
                                      child: Center(
                                        child: Text(state.character.name!),
                                      ),
                                    ),
                              state.character.image != ''
                                  ? Center(child: Text(state.character.name!))
                                  : Container(),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: _grid(state.character.house ?? ''),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is HomeScreenError) {
              return Text(state.errorMessage);
            }
            return Container();
          },
          buildWhen: (previous, current) => _isBuildState(current),
        ),
      ),
    );
  }

  bool _isBuildState(HomeScreenState state) {
    return state is HomeScreenContent || state is HomeScreenLoading || state is HomeScreenError;
  }

  Widget _grid(String correctHouse) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        _gridItem(
            context: context,
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            title: 'Gryffindor',
            icon: AppImages.gryffindor,
            correctHouse: correctHouse),
        _gridItem(
            context: context,
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            title: 'Slytherin',
            icon: AppImages.slytherin,
            correctHouse: correctHouse),
        _gridItem(
            context: context,
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            title: 'Ravenclaw',
            icon: AppImages.ravenclaw,
            correctHouse: correctHouse),
        _gridItem(
            context: context,
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            title: 'Hufflepuff',
            icon: AppImages.hufflepuff,
            correctHouse: ''),
        _gridItem(
            context: context,
            crossAxisCellCount: 4,
            mainAxisCellCount: 1,
            title: 'Not in House',
            correctHouse: correctHouse),
      ],
    );
  }

  Widget _gridItem(
      {required int crossAxisCellCount,
      required num mainAxisCellCount,
      required String title,
      required String correctHouse,
      required BuildContext context,
      String? icon}) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: GestureDetector(
        onTap: () async {
          if (title == correctHouse || (title == 'Not in House' && correctHouse == '')) {
            showSnackBar(context: context, message: 'Right', success: true);
            await context.read<HomeScreenCubit>().rightChoiceSelected(true);
          } else {
            showSnackBar(context: context, message: 'Wrong', success: false);
            await context.read<HomeScreenCubit>().rightChoiceSelected(false);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
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
      ),
    );
  }
}
