import 'package:flutter/material.dart';

class LoadingDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(child: CircularProgressIndicator()),
      ),
    );
  }
}
