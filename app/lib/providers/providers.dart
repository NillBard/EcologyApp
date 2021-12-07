import 'package:echology/bloc/form_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final bloc = FormBloc();
  // constructor, forward to Parent InheritedWidget
  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget _) {
    // Todo implantation
    return true;
  }

  static FormBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }
}
