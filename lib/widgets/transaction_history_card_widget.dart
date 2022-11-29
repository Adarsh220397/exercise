import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class UserTransactionHistoryWidget extends StatefulWidget {
  String name;
  DateTime date;
  num amount;
  String currency;
  bool btransactionStatus;
  Color color;
  UserTransactionHistoryWidget(
      {super.key,
      required this.name,
      required this.amount,
      required this.date,
      required this.currency,
      required this.btransactionStatus,
      required this.color});

  @override
  State<UserTransactionHistoryWidget> createState() =>
      _UserTransactionHistoryWidgetState();
}

class _UserTransactionHistoryWidgetState
    extends State<UserTransactionHistoryWidget> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    DateFormat dateFormat = DateFormat("d MMMM yyyy");

    String string = dateFormat.format(DateTime.now());
    themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          left: currentWidth > 600 ? 10 : 10,
          right: currentWidth > 600 ? 10 : 10),
      child: Container(
        height: currentWidth > 600 ? 135 : 70,
        width: currentWidth,
        decoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.circular((currentWidth > 600 ? 5 : 2.5)),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                      radius: currentWidth > 600 ? 30 : 20,
                      backgroundColor: widget.color,
                      child: Text(
                        widget.name.isEmpty
                            ? 'NA'
                            : ((widget.name.length == 1
                                ? widget.name[0].toUpperCase()
                                : widget.name.substring(0, 1).toUpperCase())),
                        style: themeData.textTheme.subtitle1!
                            .copyWith(color: Colors.white),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                          widget.btransactionStatus ? Colors.blue : Colors.red,
                      child: widget.btransactionStatus
                          ? Icon(Icons.arrow_forward,
                              color: Colors.white, size: 7)
                          : Icon(Icons.arrow_back,
                              color: Colors.white, size: 7),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.name,
                              maxLines: 2,
                              style: themeData.textTheme.subtitle1!.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(dateFormat.format(widget.date))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.btransactionStatus
                      ? Text(
                          '+ ',
                          style: themeData.textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        )
                      : Text(
                          '- ',
                          style: themeData.textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                  Text(
                    '${widget.currency} ${widget.amount}',
                    style: themeData.textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
