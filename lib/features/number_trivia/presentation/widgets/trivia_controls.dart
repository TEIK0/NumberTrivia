import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_trivia_bloc.dart';

class Trivia_controls extends StatefulWidget {
  @override
  State<Trivia_controls> createState() => Trivia_controlsState();
}

class Trivia_controlsState extends State<Trivia_controls> {
  final controller = TextEditingController();
  late String input;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Ingrese un Numero'),
          onChanged: (value) {
            input = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: dispatchConcrete,
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextButton(
                onPressed: dispatchRandom,
                child:
                    Text('Get Random', style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan)),
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForConcreteNumber(input));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  }
}
