import 'package:animations/animations.dart';
import 'package:clean_arch_project/data/model/entry_model.dart';
import 'package:clean_arch_project/presenter/cubit/home_cubit.dart';
import 'package:clean_arch_project/presenter/screen/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryListShort extends StatelessWidget {
  const EntryListShort({
    super.key,
    required this.entryModel,
    required this.isFavorite,
  });

  final EntryModel entryModel;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      openColor: Colors.transparent,
      closedElevation: 0,
      closedColor: Colors.transparent,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
      closedBuilder: (context, action) => Ink(
        child: InkWell(
          onTap: () {
            context.read<HomeCubit>().changeSelectedEntry(
                  entry: entryModel,
                );

            action();
          },
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: entryModel.name,
                    child: Image.network(
                      entryModel.image,
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProcess) {
                        return loadingProcess == null
                            ? child
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(
                    entryModel.name.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      openBuilder: (context, action) => const DetailsScreen(),
    );
  }
}
