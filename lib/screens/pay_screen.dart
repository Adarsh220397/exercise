import 'package:exercise/services/models/category_model.dart';
import 'package:exercise/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/client_service.dart';
import '../widgets/progress_widget.dart';

class PayTabScreen extends StatefulWidget {
  const PayTabScreen({super.key});

  @override
  State<PayTabScreen> createState() => _PayTabScreenState();
}

class _PayTabScreenState extends State<PayTabScreen> {
  late ThemeData themeData;

  bool isShowLoading = false;

  List<PaymentCategoryModel> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    isShowLoading = true;
    list = await ClientService.instance.getPaymentInfoData();

    isShowLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: KeyboardDismissOnTap(
          child: ProgressWidget(
              isShow: isShowLoading,
              color: Colors.black,
              opacity: 1,
              child: loginScreenBodyUI()),
        ),
      ),
    );
  }

  Widget loginScreenBodyUI() {
    return Stack(
      children: <Widget>[
        Positioned(
            top: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 160,
            child: formUI()),
        Positioned(
            top: 0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            child: Container(
              color: AppConstants.appColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Pay',
                        style: themeData.textTheme.headline5!.copyWith(
                          color: Color.fromARGB(255, 155, 176, 187),
                        ),
                      ),
                      const Icon(
                        FontAwesomeIcons.ellipsisVertical,
                        color: Color.fromARGB(255, 155, 176, 187),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                ],
              ),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      color: Colors.white,
                      width: 330,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Image.asset('assets/imgs/cashback.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      color: Colors.white,
                      width: 330,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Image.asset('assets/imgs/cashback.jpg'),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget formUI() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4.5,
          ),
          Wrap(
            spacing: 3,
            runSpacing: 3,
            children: [
              for (PaymentCategoryModel i in list)
                Card(
                  elevation: 5,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        i.title == 'Mobile'
                            ? SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/imgs/mobile.png',
                                  color: i.color,
                                ))
                            : i.title == 'Landline'
                                ? SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset(
                                      'assets/imgs/telephone.png',
                                      //color: i.color,
                                    ))
                                : i.title == 'Donation'
                                    ? SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Image.asset(
                                          'assets/imgs/donation.png',
                                          //   color: i.color,
                                        ))
                                    : i.title == 'Electric'
                                        ? SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                              'assets/imgs/lightbulbonpng.png',
                                              //   color: i.color,
                                            ))
                                        : i.icon,
                        SizedBox(
                          height: 10,
                        ),
                        Text(i.title),
                      ],
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
