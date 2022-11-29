import 'package:exercise/widgets/transaction_history_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  late ThemeData themeData;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.blue,
                        height: MediaQuery.of(context).size.height / 8,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                              //  size: 30.0,
                            ),
                            TabBar(
                              isScrollable: true,
                              tabs: [
                                Tab(
                                  text: 'UGX 462963',
                                ),
                                Tab(
                                  text: '\$123',
                                ),
                                Tab(
                                  text: '8.0123',
                                ),
                                Tab(
                                  text: '102',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        //width: SizeUtils.screenWidth,
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: TabBarView(
                          children: [
                            // IncomingPage(),
                            // OutgoingPage(),
                            // MissedPage(),

                            Container(
                              color: const Color.fromARGB(255, 4, 42, 73),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.arrow_back_ios_new),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    '\$',
                                                    style:
                                                        TextStyle(fontSize: 24),
                                                  ),
                                                  const Text(
                                                    '124.99',
                                                    style:
                                                        TextStyle(fontSize: 34),
                                                  ),
                                                  Column(
                                                    children: const [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'USD',
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const Text('USh 462933.80')
                                            ]),
                                        const Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        iconData(
                                          'Load',
                                          const Icon(
                                            Icons.add_circle_outlined,
                                            size: 50,
                                          ),
                                        ),
                                        iconData(
                                          'Exchange',
                                          const Icon(
                                            Icons.refresh,
                                            size: 50,
                                          ),
                                        )
                                      ]),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.green,
                            ),
                            Container(
                              color: Colors.pink,
                            ),
                            Container(
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction History',
                            textAlign: TextAlign.left,
                          ),
                          Icon(Icons.navigate_next_outlined)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          UserTransactionHistoryWidget(
                            amount: 444434,
                            btransactionStatus: true,
                            currency: 'INR',
                            date: DateTime.now(),
                            name: 'Ada',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          UserTransactionHistoryWidget(
                            amount: 444434,
                            btransactionStatus: true,
                            currency: 'INR',
                            date: DateTime.now(),
                            name: 'Ada',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }

  Widget iconData(String text, Icon icon) {
    return Column(
      children: [
        icon,
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: themeData.textTheme.subtitle1!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
