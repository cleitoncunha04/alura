import 'package:clean_arch_project/data/model/entry_model.dart';
import 'package:clean_arch_project/presenter/cubit/home_cubit.dart';
import 'package:clean_arch_project/presenter/widget/custom_app_bar.dart';
import 'package:clean_arch_project/utils/consts/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late EntryModel entryModel;

  @override
  void initState() {
    entryModel = context.read<HomeCubit>().state.selectedEntry;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          text: 'Details',
          isCenter: false,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context
                .read<HomeCubit>()
                .saveLocalEntryModel(entryModel: entryModel);

            if (context.mounted) {
              List<EntryModel> entries =
                  context.read<HomeCubit>().state.savedEntries;

              if (entries.where(
                        (e) => e.id == entryModel.id,
                      )
                      .toList()
                      .length ==
                  1) {
                QuickAlert.show(
                  headerBackgroundColor: Colors.black,
                  titleColor: Colors.white,
                  confirmBtnColor: ThemeColors.iconColor,
                  context: context,
                  backgroundColor: ThemeColors.detailsBackground,
                  textColor: Colors.white,
                  type: QuickAlertType.success,
                  text: 'Entry saved successfully!',
                  autoCloseDuration: const Duration(
                    milliseconds: 1500,
                  ),
                );
              } else {
                context
                    .read<HomeCubit>()
                    .changeStateToError(message: 'Saving Entry...');
              }
            }
          },
          child: const Icon(
            Icons.bookmark,
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeError) {
              return Center(
                child: Text(
                  'An error occured: ${state.message}',
                ),
              );
            } else {
              return Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            entryModel.name.toUpperCase(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: entryModel
                                .commonLocationConverter()
                                .map(
                                  (cL) => Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      4,
                                      8.0,
                                      4,
                                      16,
                                    ),
                                    child: Chip(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Image.network(
                            entryModel.image,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              return loadingProgress == null
                                  ? child
                                  : const SizedBox(
                                      width: 280,
                                      height: 280,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                        ),
                        child: Text(
                          entryModel.description,
                          maxLines: 50,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
