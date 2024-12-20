import 'package:bloc_cubit_project/logic/cubit/home_cubit.dart';
import 'package:bloc_cubit_project/logic/cubit/my_themes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreFilterComponent extends StatefulWidget {
  const GenreFilterComponent({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  State<GenreFilterComponent> createState() => _GenreFilterComponentState();
}

class _GenreFilterComponentState extends State<GenreFilterComponent> {
  static final List<String> listGenres = [
    'Todos',
    'Ação',
    'Comédia',
    'Drama',
    'Romance',
    'Documentário',
    'Suspense',
    'Terror',
    'Ficção Científica',
  ];

  String dropdownValue = listGenres.first;

  @override
  Widget build(BuildContext context) {
    final MyThemeCubit myThemeCubit = context.read<MyThemeCubit>();

    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Gênero: ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            items: listGenres.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  dropdownValue = value;

                  if (dropdownValue == 'Todos') {
                    widget.homeCubit.findMovies();

                    myThemeCubit.changeTheme('default');
                  } else {
                    widget.homeCubit.findMoviesByGenre(dropdownValue);

                    myThemeCubit.changeTheme(dropdownValue);
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
