import 'package:clean_arch_project/presenter/animation/color_animation_mixin.dart';
import 'package:clean_arch_project/presenter/animation/scale_animation_mixin.dart';
import 'package:clean_arch_project/presenter/cubit/home_cubit.dart';
import 'package:clean_arch_project/utils/consts/categories_enum.dart';
import 'package:clean_arch_project/utils/consts/categories_consts.dart';
import 'package:clean_arch_project/utils/consts/my_themes.dart';
import 'package:clean_arch_project/utils/consts/routes_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryComponent extends StatefulWidget {
  const CategoryComponent({
    super.key,
    required this.category,
    this.isHighlight = false,
  });

  final CategoriesEnum category;
  final bool isHighlight;

  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent>
    with ScaleAnimationMixin, ColorAnimationMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: colorAnimation,
        builder: (context, child) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 160,
                  height: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: ThemeColors.iconColor,
                      width: 3,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(29, 3, 101, 140),
                        offset: Offset(-5, -5),
                        spreadRadius: 5,
                        blurRadius: 5,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(29, 3, 101, 140),
                        offset: Offset(5, 5),
                        spreadRadius: 5,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Ink(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        context.read<HomeCubit>().changeSelectedCategory(
                              category: widget.category,
                            );

                        Navigator.of(context).pushNamed(
                          RoutesEnum.entries.route,
                          arguments: {
                            'isFavorite': false,
                          },
                        );
                      },
                      child: widget.isHighlight
                          ? ScaleTransition(
                              scale: scaleAnimation,
                              child: Center(
                                child: Image.asset(
                                  '${CategoriesConsts.imagePath}${widget.category.name}.png',
                                  height: 80,
                                  fit: BoxFit.fitHeight,
                                  color: colorAnimation.value ??
                                      Colors.transparent,
                                ),
                              ),
                            )
                          : Center(
                              child: Image.asset(
                                '${CategoriesConsts.imagePath}${widget.category.name}.png',
                                height: 80,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: Text(
                  widget.category.text,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          );
        });
  }
}
