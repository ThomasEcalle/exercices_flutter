import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'selected_post_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedPostModel>(
      builder: (_) => SelectedPostModel(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home()),
    );
  }
}
