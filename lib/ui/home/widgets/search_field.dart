import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_pretest/core/bloc/api_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Search by id',
              suffixIcon: state is ApiLoadedPost || state is ApiEmpty
                  ? IconButton(onPressed: () => context.read<ApiBloc>().add(ApiPosts()), icon: const Icon(Icons.close))
                  : null,
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty && int.tryParse(value) != null)
                context.read<ApiBloc>().add(ApiPost(id: int.parse(value)));
            },
          ),
        );
      },
    );
  }
}
