import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserTransactionHistoryWidget extends StatefulWidget {
  String name;
  DateTime date;
  num amount;
  String currency;
  bool btransactionStatus;
  UserTransactionHistoryWidget(
      {super.key,
      required this.name,
      required this.amount,
      required this.date,
      required this.currency,
      required this.btransactionStatus});

  @override
  State<UserTransactionHistoryWidget> createState() =>
      _UserTransactionHistoryWidgetState();
}

class _UserTransactionHistoryWidgetState
    extends State<UserTransactionHistoryWidget> {
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width > 600 ? 3 : 2),
      child: Container(
        height: MediaQuery.of(context).size.width > 600 ? 135 : 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.circular((2.5)),
        ),
        child: Row(children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //     borderRadius: BorderRadius.circular(
          //         MediaQuery.of(context).size.width > 600 ? (40) : (25)),
          //   ),
          //   child: ClipOval(
          //     child: Image.asset(
          //       widget.name,
          //     ),
          //   ),
          // ),
          CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(
                widget.name.isEmpty
                    ? 'NA'
                    : ((widget.name.length == 1
                        ? widget.name[0].toUpperCase()
                        : widget.name.substring(0, 2).toUpperCase())),
              )),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: themeData.textTheme.subtitle1!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  subtitle: Text(widget.date.toString())),
            ),
          ),
          Row(
            children: [
              widget.btransactionStatus
                  ? Icon(Icons.add)
                  : Icon(Icons.minimize_outlined),
              Text('${widget.currency}  ${widget.amount}'),
            ],
          )
        ]),
      ),
    );
  }
}
