import 'package:exercise/services/models/category_model.dart';
import 'package:exercise/services/models/job_match_data_model.dart';

import 'package:exercise/services/models/recent_job_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientService {
  ClientService._internal();
  static ClientService instance = ClientService._internal();

  Future<List<AllCategoryModel>> getCategoriesData() async {
    List<AllCategoryModel> categoriesList = [
      AllCategoryModel(
          icon: const Icon(Icons.mobile_friendly_sharp, color: Colors.pink),
          title: 'Mobile',
          color: Colors.pink),
      AllCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.phone,
            color: Colors.blue,
            size: 30,
          ),
          title: 'Landline',
          color: Colors.blue),
      AllCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.usb,
            color: Colors.purple,
            size: 30,
          ),
          title: 'Data Card',
          color: Colors.purple),
      AllCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.wifi,
            color: Colors.pink,
            size: 30,
          ),
          title: 'Internet',
          color: Colors.pink),
      AllCategoryModel(
          icon: const Icon(
            Icons.cell_tower,
            color: Colors.teal,
            size: 30,
          ),
          title: 'Cable Tv',
          color: Colors.teal),
      AllCategoryModel(
          icon: const Icon(
            Icons.movie,
            color: Colors.red,
            size: 30,
          ),
          title: 'Entertainment',
          color: Colors.red),
      AllCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.solidLightbulb,
            color: Colors.yellow,
            size: 30,
          ),
          title: 'Electric',
          color: Colors.yellow),
      AllCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.bookOpen,
            color: Colors.red,
            size: 30,
          ),
          title: 'School',
          color: Colors.red),
      AllCategoryModel(
          icon: const Icon(
            Icons.church,
            color: Colors.teal,
            size: 30,
          ),
          title: 'Church',
          color: Colors.teal),
      AllCategoryModel(
          icon: const Icon(
            Icons.health_and_safety_rounded,
            size: 30,
          ),
          title: 'Donation',
          color: Colors.pink),
      AllCategoryModel(
          icon: const Icon(
            FontAwesomeIcons.basketShopping,
            color: Colors.blue,
            size: 30,
          ),
          title: 'Merchants',
          color: Colors.blue),
      AllCategoryModel(
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

  Future<List<RecentJobModel>> getTransactionData() async {
    List<RecentJobModel> recentJobsList = [
      RecentJobModel(
          amount: 45000,
          btransactionStatus: false,
          currency: 'ZAR',
          date: DateTime.utc(2018, 03, 9),
          name: 'Christine Chaka',
          color: Colors.green),
      RecentJobModel(
          amount: 980000,
          btransactionStatus: false,
          currency: 'UGX',
          date: DateTime.utc(2018, 03, 5),
          name: 'Paul Kafeero',
          color: Colors.amber),
      RecentJobModel(
          amount: 53000,
          btransactionStatus: true,
          currency: 'NGN',
          date: DateTime.utc(2018, 03, 1),
          name: 'Uche Ngozi',
          color: Colors.brown),
      RecentJobModel(
          amount: 3200,
          btransactionStatus: true,
          currency: 'KES',
          date: DateTime.utc(2018, 02, 22),
          name: 'Gerald Kimotho',
          color: Colors.pink),
    ];
    return recentJobsList;
  }

  Future<List<JobMatchesDataModel>> getJobsMatchingData() async {
    List<JobMatchesDataModel> jobList = [
      JobMatchesDataModel(
          cost: 20,
          description: 'Lorem ipsum dolor sit amit,consectiturer..',
          image: 'assets/imgs/waterheaterservices.png',
          job: 'Water heater services',
          likes: 35,
          views: 90),
      JobMatchesDataModel(
          cost: 25,
          description: 'Lorem ipsum dolor sit amit,consectiturer..',
          image: 'assets/imgs/toiletplumbing.png',
          job: 'Toilet plumbing',
          likes: 15,
          views: 40),
      JobMatchesDataModel(
          cost: 10,
          description: 'Lorem ipsum dolor sit amit,consectiturer..',
          image: 'assets/imgs/sumppumpservices.png',
          job: 'Sump pump services',
          likes: 32,
          views: 20),
      JobMatchesDataModel(
          cost: 45,
          description: 'Lorem ipsum dolor sit amit,consectiturer..',
          image: 'assets/imgs/pipingorleakingservices.png',
          job: 'Piping/leak services',
          likes: 36,
          views: 70),
    ];
    return jobList;
  }
}
