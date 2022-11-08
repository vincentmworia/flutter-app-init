import 'package:flutter/material.dart';
import 'package:iot_template/data/screen_one_data.dart';
import 'package:iot_template/screens/screen_one_detail_screen.dart';
import 'package:iot_template/widgets/switch.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.home,
      Icons.timer,
      Icons.add,
      Icons.network_cell,
      Icons.settings,
    ];
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final cardBorderRadius = BorderRadius.circular(20.0);
    const textColor = Colors.black;
    final deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return SafeArea(
        child: Scaffold(
            backgroundColor: primaryColor,
            body: Column(
              children: [
                Expanded(
                  child: GridView(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250.0,
                            childAspectRatio: 1 / 1.2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0),
                    children: [
                      Container(
                        margin: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hi ${smartHomeData['owner']},',
                            style: const TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0),
                          ),
                          Text(
                            smartHomeData['caption'],
                            style: const TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w200,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                      ...(smartHomeData['rooms'] as List<Map<String, Object>>)
                          .map(
                        (roomData) {
                          final title = roomData['title'] as String;
                          final description = roomData['description'] as String;
                          final noOfDevices =
                              '${(roomData['homeData'] as List).length.toString()} Devices';
                          final active = roomData['active'] as String == 'true'
                              ? true
                              : false;
                          final temperature =
                              int.parse((roomData['temperature'] as String));
                          final humidity =
                              int.parse((roomData['humidity'] as String));
                          final homeData =
                              roomData['homeData'] as List<Map<String, String>>;

                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: cardBorderRadius),
                            elevation: 3.0,
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: cardBorderRadius,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ScreenOneDetailScreen(
                                            title: title,
                                            description: description,
                                            temperature: temperature,
                                            humidity: humidity,
                                            homeData: homeData)));
                              },
                              splashColor: secondaryColor.withOpacity(0.25),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                          fontSize: 21.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      description,
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    Text(
                                      noOfDevices,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: secondaryColor),
                                    ),
                                    CustomSwitchAdaptive(
                                      active: active,
                                      secondaryColor: secondaryColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        topLeft: Radius.circular(25.0),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...icons
                          .map((icons) => IconButton(
                                icon: Icon(
                                  icons,
                                  color: secondaryColor,
                                  size: 30.0,
                                ),
                                onPressed: () {},
                              ))
                          .toList(),
                    ],
                  ),
                ),
              ],
            )));
  }
}
