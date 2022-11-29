import 'package:exercise/services/models/category_model.dart';
import 'package:exercise/services/models/job_match_data_model.dart';

import 'package:exercise/services/models/recent_job_model.dart';
import 'package:flutter/material.dart';

class ClientService {
  ClientService._internal();
  static ClientService instance = ClientService._internal();

  Future<List<AllCategoryModel>> getCategoriesData() async {
    List<AllCategoryModel> categoriesList = [
      AllCategoryModel(
          icon: const Icon(Icons.mobile_friendly_sharp),
          title: 'Mobile',
          color: Colors.pink),
      AllCategoryModel(
          icon: Icon(Icons.phone), title: 'Landline', color: Colors.blue),
      AllCategoryModel(
          icon: Icon(Icons.sim_card_download_sharp),
          title: 'Data Card',
          color: Colors.purple),
      AllCategoryModel(
          icon: Icon(Icons.wifi), title: 'Internet', color: Colors.pink),
      AllCategoryModel(
          icon: Icon(Icons.mobile_friendly_sharp),
          title: 'Mobile',
          color: Colors.blue),
      AllCategoryModel(
          icon: Icon(Icons.cell_tower), title: 'Cable Tv', color: Colors.teal),
      AllCategoryModel(
          icon: Icon(Icons.movie), title: 'Entertainment', color: Colors.red),
      AllCategoryModel(
          icon: Icon(Icons.light), title: 'Electric', color: Colors.yellow),
      AllCategoryModel(
          icon: Icon(Icons.book), title: 'School', color: Colors.red),
      AllCategoryModel(
          icon: Icon(Icons.church), title: 'Church', color: Colors.teal),
      AllCategoryModel(
          icon: Icon(Icons.health_and_safety_rounded),
          title: 'Donation',
          color: Colors.pink),
      AllCategoryModel(
          icon: Icon(Icons.badge), title: 'Merchants', color: Colors.blue),
      AllCategoryModel(
          icon: Icon(Icons.tab, color: Colors.red),
          title: 'Utility',
          color: Colors.red),
    ];

    return categoriesList;
  }

  Future<List<RecentJobModel>> getTransactionData() async {
    List<RecentJobModel> recentJobsList = [
      RecentJobModel(
          amount: 2000,
          btransactionStatus: true,
          currency: 'INR',
          date: DateTime.now(),
          name: 'Adarsh',
          color: Colors.green),
      RecentJobModel(
          amount: 4000,
          btransactionStatus: true,
          currency: 'DOLLAR',
          date: DateTime.now(),
          name: 'Karthick',
          color: Colors.red),
      RecentJobModel(
          amount: 2070,
          btransactionStatus: true,
          currency: 'INR',
          date: DateTime.now(),
          name: 'Srini',
          color: Colors.yellow),
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
