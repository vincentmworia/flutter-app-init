import 'package:flutter/material.dart';
import 'package:iot_template/widgets/switch.dart';

class ScreenOneDetailScreen extends StatelessWidget {
  const ScreenOneDetailScreen(
      {Key? key,
      required this.title,
      required this.description,
      required this.temperature,
      required this.humidity,
      required this.homeData})
      : super(key: key);
  final String title;
  final String description;
  final int temperature;
  final int humidity;
  final List<Map<String, String>> homeData;

  Widget _customText(String data) => Text(
        data,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      );

  Widget _weather(String image, String data, String title) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(width: 5.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _customText(data),
              _customText(title),
            ],
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          child: LayoutBuilder(builder: (context, constraints) {
            final maxHeight = constraints.maxHeight;
            return Column(
              children: [
                Container(
                  height: maxHeight * .35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    // top: 30.0,
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30.0,
                            color: Colors.white,
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            description,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _weather(
                            'images/temp.png',
                            '${temperature.toString()} °C',
                            'Temp',
                          ),
                          _weather(
                            'images/humid.png',
                            '${humidity.toString()} %',
                            'Temp',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: homeData
                        .map((homeData) {
                          final title  = homeData['title'] as String;
                          final description  = homeData['description'] as String;
                          final active = homeData['active'] as String == 'true'
                              ? true
                              : false;
                          return Container(
                            margin: const EdgeInsets.all(8),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _customText(title),
                                    _customText(description),
                                  ],
                                ),
                                Container(),
                                CustomSwitchAdaptive(active: active, secondaryColor: Theme.of(context).colorScheme.primary)
                              ],
                            ),
                          );
                    } )
                        .toList(),
                  ),
                ))
              ],
            );
          }),
        ),
      ),
    ));
  }
}
