import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/features/author/presentation/bloc/bloc.dart';
import 'package:flutter_clean/features/author/presentation/pages/cache_page.dart';
import 'package:flutter_clean/features/author/presentation/widgets/loading_widget.dart';
import 'package:flutter_clean/features/author/presentation/widgets/message_display.dart';
import 'package:flutter_clean/features/author/presentation/widgets/similar_controls.dart';
import 'package:flutter_clean/features/author/presentation/widgets/similar_display.dart';
import 'package:flutter_clean/injection_container.dart';

class SimilarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Similar Data'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CachePage()),
                );
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<SimilarBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SimilarBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SimilarControls(),
              SizedBox(height: 10),
              BlocBuilder<SimilarBloc, SimilarState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      message: 'Empty',
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return SimilarDisplay(datum: state.datum);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                  return MessageDisplay(message: 'Error');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
