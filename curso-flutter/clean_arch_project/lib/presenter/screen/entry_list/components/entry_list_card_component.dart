import 'package:animations/animations.dart';
import 'package:clean_arch_project/data/model/entry_model.dart';
import 'package:clean_arch_project/presenter/cubit/home_cubit.dart';
import 'package:clean_arch_project/presenter/screen/details/details_screen.dart';
import 'package:clean_arch_project/utils/consts/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryListCardComponent extends StatefulWidget {
  const EntryListCardComponent({
    super.key,
    required this.entryModel,
    required this.isFavorite,
  });

  final EntryModel entryModel;
  final bool isFavorite;

  @override
  EntryListCardComponentState createState() => EntryListCardComponentState();
}

class EntryListCardComponentState extends State<EntryListCardComponent> {
  double _progress = 0.0;
  int titleLines = 0;

  void _calculateLinesText() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final TextPainter textPainter = TextPainter(
          text: TextSpan(
              text: widget.entryModel.name,
              style: Theme.of(context).textTheme.bodyLarge),
          maxLines: null,
          textDirection: TextDirection.ltr,
        )..layout(
            maxWidth: 140,
          );

        setState(() {
          titleLines = textPainter.computeLineMetrics().length;

          textPainter.dispose();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _calculateLinesText(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeColors.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: Dismissible(
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment:
                _progress == 1 ? Alignment.center : Alignment.centerRight,
            child: Padding(
              padding: _progress == 1
                  ? EdgeInsets.zero
                  : EdgeInsets.only(
                      right: _progress *
                              (MediaQuery.of(context).size.width / 2.4) -
                          (_progress / 4),
                    ),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
        ),
        direction: widget.isFavorite
            ? DismissDirection.endToStart
            : DismissDirection.none,
        key: ValueKey(widget.entryModel.id),
        onDismissed: (_) async {
          await context.read<HomeCubit>().deleteLocalEntry(
                id: widget.entryModel.id,
              );
        },
        onUpdate: (DismissUpdateDetails details) {
          setState(() {
            _progress = details.progress;
          });
        },
        child: OpenContainer(
          useRootNavigator: true,
          openColor: Colors.transparent,
          closedElevation: 0,
          closedColor: Colors.transparent,
          transitionType: ContainerTransitionType.fadeThrough,
          transitionDuration: const Duration(
            milliseconds: 500,
          ),
          closedBuilder: (context, action) => Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    context.read<HomeCubit>().changeSelectedEntry(
                          entry: widget.entryModel,
                        );
        
                    action();
                  },
                  child: Ink(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 140,
                          height: 240,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Hero(
                              tag: widget.entryModel.name,
                              child: Image.network(
                                fit: BoxFit.fill,
                                widget.entryModel.image,
                                loadingBuilder:
                                    (context, child, loadingProcess) {
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
                        Container(
                          width: 205,
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.entryModel.name.toUpperCase(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                widget.entryModel.description,
                                maxLines: titleLines > 1
                                    ? titleLines > 2
                                        ? 6
                                        : 8
                                    : titleLines > 3
                                        ? 4
                                        : 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: ThemeColors.wrapColor,
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      alignment: WrapAlignment.start,
                      spacing: 4,
                      runSpacing: 4,
                      children: widget.entryModel
                          .commonLocationConverter()
                          .map(
                            (cL) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: Chip(
                                backgroundColor: ThemeColors.wrapColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                    color: Colors.white,
                                    strokeAlign: 2,
                                  ),
                                ),
                                label: Text(cL),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          openBuilder: (context, action) => const DetailsScreen(),
        ),
      ),
    );
  }
}
