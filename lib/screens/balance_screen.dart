import 'package:exercise/services/client_service.dart';
import 'package:exercise/services/models/recent_job_model.dart';
import 'package:exercise/widgets/transaction_history_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  late ThemeData themeData;
  List<RecentJobModel> transactionHistoryList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
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
                      color: const Color.fromARGB(255, 4, 42, 73),
                      height: MediaQuery.of(context).size.height / 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            FontAwesomeIcons.sliders,
                            color: Color.fromARGB(255, 155, 176, 187),
                            size: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: const TabBar(
                              unselectedLabelColor: Colors.blueGrey,
                              indicatorPadding:
                                  EdgeInsets.only(left: 30, right: 30),
                              indicatorColor:
                                  Color.fromARGB(255, 155, 176, 187),
                              indicator: DotIndicator(
                                  color: Color.fromARGB(255, 155, 176, 187),
                                  radius: 3),
                              labelColor: Color.fromARGB(255, 155, 176, 187),
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
                          Container(
                            color: const Color.fromARGB(255, 4, 42, 73),
                            height: MediaQuery.of(context).size.height / 3,
                            width: 200,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                dataRowUI(),
                                SizedBox(
                                  height: currentWidth > 1200
                                      ? currentWidth > 600
                                          ? 70
                                          : 20
                                      : 20,
                                ),
                                Container(
                                  //   color: Colors.amber,
                                  height: currentWidth > 1200
                                      ? 100
                                      : currentWidth > 600
                                          ? 70
                                          : 70,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                              for (RecentJobModel history
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

  Widget dataRowUI() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blueGrey,
          ),
          currencyDataUI(),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  Widget currencyDataUI() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '\$',
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 155, 176, 187),
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '124.99',
                style: TextStyle(
                    fontSize: 34,
                    color: Color.fromARGB(255, 155, 176, 187),
                    fontWeight: FontWeight.normal),
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
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
          const Text(
            'USh 462933.80',
            style: TextStyle(
              // fontSize: 34,
              color: Colors.blueGrey,
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

class DotIndicator extends Decoration {
  const DotIndicator({
    this.color = Colors.white,
    this.radius = 4.0,
  });
  final Color color;
  final double radius;
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(
      color: color,
      radius: radius,
      onChange: onChanged,
    );
  }
}

class _DotPainter extends BoxPainter {
  _DotPainter({
    required this.color,
    required this.radius,
    VoidCallback? onChange,
  })  : _paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill,
        super(onChange);
  final Paint _paint;
  final Color color;
  final double radius;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    canvas.drawCircle(
      Offset(rect.bottomCenter.dx, rect.bottomCenter.dy - radius),
      radius,
      _paint,
    );
  }
}
