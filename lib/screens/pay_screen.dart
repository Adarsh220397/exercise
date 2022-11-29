import 'package:exercise/services/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

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

  List<AllCategoryModel> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    isShowLoading = true;
    list = await ClientService.instance.getCategoriesData();

    print(list.length);

    for (AllCategoryModel i in list) {
      print(i.title);
    }
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
            height: MediaQuery.of(context).size.height,
            child: formUI()),
        Positioned(
            top: 0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            child: Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pay',
                    style: themeData.textTheme.headline6!
                        .copyWith(color: Colors.white),
                  ),
                  Icon(Icons.menu)
                ],
              ),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height / 6.5,
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
                    width: 10,
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
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            //   padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
            decoration: const BoxDecoration(
                //  color: Colors.red,
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.5,
                  ),
                  Center(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (AllCategoryModel i in list)
                          Container(
                            color: i.color,
                            child: Column(
                              children: [
                                i.icon,
                                Text(i.title),
                              ],
                            ),
                            height: 100,
                            width: 100,
                          )
                      ],
                    ),
                  )
                  // GridView.count(
                  //   crossAxisCount: 3,
                  //   crossAxisSpacing: 4.0,
                  //   mainAxisSpacing: 8.0,
                  //   children: List.generate(list.length, (index) {
                  //     return Container(
                  //         height: 100,
                  //         width: 100,
                  //         color: Colors.green,
                  //         child: Column(
                  //           children: [
                  //             // SizedBox(
                  //             //     height: 100,
                  //             //     width: 100,
                  //             //     child: list[index].image),
                  //             //Text(list[index].title)
                  //           ],
                  //         ));
                  //   }),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
