import 'package:flutter/material.dart';

import '../main.dart';
import './screen_one.dart';
import './screen_three.dart';
import './screen_two.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const List<String> _iotTemplateTitle = ['One', 'Two', 'Three'];

  void _switchPage(BuildContext context, String title) {
    switch (title) {
      case 'One':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const ScreenOne()));
        break;
      case 'Two':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const ScreenTwo()));
        break;
      case 'Three':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const ScreenThree()));
        break;
      default:
    }
    // print(title);
  }

  @override
  Widget build(BuildContext context) {
    final cardBorderRadius = BorderRadius.circular(20.0);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.appTitle),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250.0,
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0),
            children: [
              ..._iotTemplateTitle
                  .map((title) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: cardBorderRadius),
                        elevation: 3.0,
                        color: Theme.of(context).colorScheme.secondary,
                        child: InkWell(
                          borderRadius: cardBorderRadius,
                          onTap: () => _switchPage(context, title),
                          splashColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.25),
                          child: Center(child: Text(title)),
                        ),
                      ))
                  .toList()
            ],
          )),
    ));
  }
}
