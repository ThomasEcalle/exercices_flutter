import 'package:flutter/material.dart';

/// Create an application :
/// With Screen A B C D
/// A can go to B without params -> simple PUSH
/// A can go to C without params -> PUSH NAMED
/// A can go to D with params -> PUSH NAMED WITH PARAMS
/// Talk about :
/// * Add routes in MaterialApp
/// * Simple push with Navigator.push
/// * Push named
/// * Push named with params (onGenerateRoute)

void main() => runApp(Solution());

class Solution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => App(),
        C.routeName: (BuildContext context) => C(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final arguments = settings.arguments;
        switch (settings.name) {
          case D.routeName:
            if (arguments is DArguments) {
              return MaterialPageRoute(builder: (BuildContext context) {
                return D(
                  arguments: arguments,
                );
              });
            }
            break;
        }
      },
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You are on A"),
            RaisedButton(
              child: Text("Go on B"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => B()),
                );
              },
            ),
            RaisedButton(
              child: Text("Go on C"),
              onPressed: () {
                Navigator.of(context).pushNamed(C.routeName);
              },
            ),
            RaisedButton(
              child: Text("Go on D"),
              onPressed: () {
                Navigator.of(context).pushNamed(D.routeName, arguments: DArguments(42));
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class B extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You are on B"),
            RaisedButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

class C extends StatelessWidget {
  static const String routeName = "/C";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You are on C"),
            RaisedButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

class DArguments {
  final int id;

  DArguments(this.id);
}

class D extends StatelessWidget {
  static const String routeName = "/D";

  final DArguments arguments;

  const D({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You are on D"),
            Text("Arguments passed are ${arguments.id}"),
            RaisedButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
