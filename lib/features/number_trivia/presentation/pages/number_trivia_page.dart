import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_proyect/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:number_trivia_proyect/injection_container.dart';

import '../../domain/entities/number_trivia.dart';
import '../widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Number Trivia', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.cyan),
        body: SingleChildScrollView(child: _build_body(context)));
  }

  BlocProvider<NumberTriviaBloc> _build_body(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(message: 'Start Searching');
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  } else if (state is Loading) {
                    return LoadingDisplay();
                  } else if (state is Loaded) {
                    return TriviaDisplay(
                      numberTrivia: state.trivia,
                    );
                  } else {
                    return Text('Fatal error');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Trivia_controls()
            ],
          ),
        ),
      ),
    );
  }
}
