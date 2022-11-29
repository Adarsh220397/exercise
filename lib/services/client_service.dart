import 'package:exercise/services/models/category_model.dart';
import 'package:exercise/services/models/transaction_history_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientService {
  ClientService._internal();
  static ClientService instance = ClientService._internal();

  Future<List<PaymentCategoryModel>> getPaymentInfoData() async {
    List<PaymentCategoryModel> categoriesList = [
      PaymentCategoryModel(
          icon: const Icon(Icons.mobile_friendly_sharp, color: Colors.pink),
          title: 'Mobile',
          color: Colors.pink),
      PaymentCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.phone,
            color: Colors.blue,
            size: 30,
          ),
          title: 'Landline',
          color: Colors.blue),
      PaymentCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.usb,
            color: Colors.purple,
            size: 30,
          ),
          title: 'Data Card',
          color: Colors.purple),
      PaymentCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.wifi,
            color: Colors.pink,
            size: 30,
          ),
          title: 'Internet',
          color: Colors.pink),
      PaymentCategoryModel(
          icon: const Icon(
            Icons.cell_tower,
            color: Colors.teal,
            size: 30,
          ),
          title: 'Cable Tv',
          color: Colors.teal),
      PaymentCategoryModel(
          icon: const Icon(
            Icons.movie,
            color: Colors.red,
            size: 30,
          ),
          title: 'Entertainment',
          color: Colors.red),
      PaymentCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.solidLightbulb,
            color: Colors.yellow,
            size: 30,
          ),
          title: 'Electric',
          color: Colors.yellow),
      PaymentCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.bookOpen,
            color: Colors.red,
            size: 30,
          ),
          title: 'School',
          color: Colors.red),
      PaymentCategoryModel(
          icon: const Icon(
            Icons.church,
            color: Colors.teal,
            size: 30,
          ),
          title: 'Church',
          color: Colors.teal),
      PaymentCategoryModel(
          icon: const Icon(
            Icons.health_and_safety_rounded,
            size: 30,
          ),
          title: 'Donation',
          color: Colors.pink),
      PaymentCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.basketShopping,
            color: Colors.blue,
            size: 30,
          ),
          title: 'Merchants',
          color: Colors.blue),
      PaymentCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.screwdriverWrench,
            color: Colors.purple,
            size: 30,
          ),
          title: 'Utility',
          color: Colors.purple),
    ];

    return categoriesList;
  }

  Future<List<TransactionHistoryModel>> getTransactionData() async {
    List<TransactionHistoryModel> recentJobsList = [
      TransactionHistoryModel(
          amount: 45000,
          btransactionStatus: false,
          currency: 'ZAR',
          date: DateTime.utc(2018, 03, 9),
          name: 'Christine Chaka',
          color: Colors.green),
      TransactionHistoryModel(
          amount: 980000,
          btransactionStatus: false,
          currency: 'UGX',
          date: DateTime.utc(2018, 03, 5),
          name: 'Paul Kafeero',
          color: Colors.amber),
      TransactionHistoryModel(
          amount: 53000,
          btransactionStatus: true,
          currency: 'NGN',
          date: DateTime.utc(2018, 03, 1),
          name: 'Uche Ngozi',
          color: Colors.brown),
      TransactionHistoryModel(
          amount: 3200,
          btransactionStatus: true,
          currency: 'KES',
          date: DateTime.utc(2018, 02, 22),
          name: 'Gerald Kimotho',
          color: Colors.pink),
    ];
    return recentJobsList;
  }
}
