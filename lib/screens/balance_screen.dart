import 'package:exercise/services/client_service.dart';
import 'package:exercise/services/models/transaction_history_model.dart';
import 'package:exercise/utils/global_variables.dart';
import 'package:exercise/widgets/tab_indicator_decorator_widget.dart';
import 'package:exercise/widgets/transaction_history_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  late ThemeData themeData;
  List<TransactionHistoryModel> transactionHistoryList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    transactionHistoryList = await ClientService.instance.getTransactionData();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    final currentWidth = MediaQuery.of(context).size.width;
    print(currentWidth);
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
                    Container(
                      color: AppConstants.appColor,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            FontAwesomeIcons.sliders,
                            color: AppConstants.lightWhiteColor,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: const TabBar(
                              unselectedLabelColor: Colors.blueGrey,
                              indicatorPadding:
                                  EdgeInsets.only(left: 30, right: 30),
                              indicatorColor: AppConstants.lightWhiteColor,
                              indicator: DotIndicator(
                                  color: AppConstants.lightWhiteColor,
                                  radius: 3),
                              labelColor: AppConstants.lightWhiteColor,
                              isScrollable: true,
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
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
                          ),
                          const SizedBox()
                        ],
                      ),
                    ),
                    SizedBox(
                      //width: SizeUtils.screenWidth,
                      height: currentWidth < 600
                          ? MediaQuery.of(context).size.height / 3
                          : MediaQuery.of(context).size.height / 2,
                      child: TabBarView(
                        children: [
                          tabBarUI(),
                          tabBarUI(),
                          tabBarUI(),
                          tabBarUI()
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: currentWidth > 600
                            ? MediaQuery.of(context).size.height / 3
                            : MediaQuery.of(context).size.height / 2,
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Transaction History',
                                      textAlign: TextAlign.left,
                                      style: themeData.textTheme.subtitle1!
                                          .copyWith(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Icon(
                                      Icons.navigate_next_outlined,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
                              ),
                              for (TransactionHistoryModel history
                                  in transactionHistoryList)
                                UserTransactionHistoryWidget(
                                  amount: history.amount,
                                  btransactionStatus:
                                      history.btransactionStatus,
                                  currency: history.currency,
                                  date: history.date,
                                  name: history.name,
                                  color: history.color,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }

  Widget tabBarUI() {
    final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppConstants.appColor,
      height: MediaQuery.of(context).size.height / 3,
      width: 250,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          dataRowUI(),
          SizedBox(
            height: currentWidth > 1200
                ? currentWidth > 600
                    ? 70
                    : 20
                : 20,
          ),
          SizedBox(
            height: currentWidth > 1200
                ? 100
                : currentWidth > 600
                    ? 70
                    : 70,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconData(
                    'Load',
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 25,
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  iconData(
                    'Exchange',
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 25,
                      child: Icon(
                        FontAwesomeIcons.sync,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  )
                ]),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget dataRowUI() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blueGrey,
            ),
            Container(child: currencyDataUI()),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }

  Widget currencyDataUI() {
    final currentWidth = MediaQuery.of(context).size.width;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$',
                style: TextStyle(
                    fontSize: currentWidth > 600 ? 20 : 16,
                    color: AppConstants.lightWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '124.99',
                style: TextStyle(
                    fontSize: currentWidth > 600 ? 40 : 34,
                    color: AppConstants.lightWhiteColor,
                    fontWeight: FontWeight.normal),
              ),
              Column(
                children: [
                  SizedBox(
                    height: currentWidth > 600 ? 7 : 5,
                  ),
                  const Text(
                    'USD',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      //   fontSize: 34,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              )
            ],
          ),
          Flexible(
            child: Text(
              'USh 462933.80',
              style: TextStyle(
                fontSize: currentWidth > 600 ? 18 : 16,
                color: Colors.blueGrey,
              ),
            ),
          )
        ]);
  }

  Widget iconData(String text, Widget icon) {
    return SizedBox(
      height: 160,
      width: MediaQuery.of(context).size.width < 600 ? 150 : 100,
      child: Column(
        children: [
          icon,
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              text,
              style: themeData.textTheme.subtitle1!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
          )
        ],
      ),
    );
  }
}
