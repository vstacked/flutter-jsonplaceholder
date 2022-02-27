import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_pretest/core/bloc/api_bloc.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiBloc, ApiState>(
      listener: (context, state) {
        if (state is ApiError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.error}')));
        }
      },
      builder: (context, state) {
        if (state is ApiInitial || state is ApiError) {
          return const SizedBox.shrink();
        } else if (state is ApiEmpty) {
          return const Center(child: Text('Post Empty'));
        } else if (state is ApiLoadedPost) {
          return ListTile(title: Text('${state.post.title}'), subtitle: Text('${state.post.body}'));
        } else {
          if (state is ApiLoaded)
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.posts.length,
              itemBuilder: (BuildContext context, int index) {
                final post = state.posts[index];
                return ListTile(title: Text('${post.title}'), subtitle: Text('${post.body}'));
              },
            );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
