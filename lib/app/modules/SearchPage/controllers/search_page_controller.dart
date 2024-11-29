

import 'package:elearner/Models/getEvents.dart';
import 'package:elearner/Models/get_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../../Models/DashboardData.dart';
import '../../../../Models/SearchHistory_model.dart';
import '../../../../Models/search_history.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/Api_Models/SimpleResponseModel.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';

class SearchPageController extends GetxController {
  //TODO: Implement SearchPageController

  final count = 0.obs;
  bool? isLoading;
  GetCategory? dashboardData;
  SearchHistory? searchHistory;
  SimpleResponseModel? simpleResponseModel;
  List<dynamic>? categoriesData = [] ;
  List<dynamic>? searchHistoryData = [] ;

  @override
  void onInit() {
    getDashboardData();

      getHistoryData();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
   // getHistoryData();
    super.onClose();
  }

  // categoryApi

  getDashboardData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          dashboardData = await ApiMethods.categoryApi();
          if (dashboardData != null && dashboardData?.status != '0') {
            isLoading = false;
            print("data is loading : ${dashboardData?.result![0].categoryName}");
            categoriesData = dashboardData!.result;
            print(categoriesData?.length);
            increment();
          } else {
            Get.snackbar("Error", dashboardData!.message ?? '');

          }
          isLoading = false;
        }
      } catch (e) {
        isLoading = false;
        print(e);
        Get.snackbar("please", '$e');
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.allFieldsRequired);
    }
  }


  getHistoryData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("userid"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid")!,
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          searchHistory = await ApiMethods.getSearchHistoryApi(bodyParams: bodyParams
          );
          if (searchHistory != null && searchHistory?.status != '0') {
            isLoading = false;
            print("data is loading : ${searchHistory?.result![0].name}");
            searchHistoryData = searchHistory!.result;
            print(searchHistoryData?.length);

            increment();
          } else {
            Get.snackbar("Error", searchHistory!.message ?? '');

          }
          isLoading = false;
        }
      } catch (e) {
        isLoading = false;
        print(e);
       // Get.snackbar("please", '$e');
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.allFieldsRequired);
    }
  }


  deleteHistoryData(String name, String eventId, int index) async {
    searchHistoryData?.removeRange(0, searchHistoryData!.length);
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("userid"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid")!,
        ApiKeyConstants.name: name,
        ApiKeyConstants.eventId: eventId,
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          simpleResponseModel = await ApiMethods.deleteSearchHistoryApi(bodyParams: bodyParams
          );
          if (simpleResponseModel != null && simpleResponseModel?.status != '0') {
            isLoading = false;
            print("data is loading : ${simpleResponseModel?.message!}");

           // print(simpleResponseModel!);searchHistoryData?.removeRange(0, searchHistoryData!.length);
            increment();
          } else {
            Get.snackbar("Error", simpleResponseModel!.message ?? '');

          }
          isLoading = false;
        }
      } catch (e) {
        isLoading = false;
        print(e);
        Get.snackbar("please", '$e');
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.allFieldsRequired);
    }
  }

  void increment() => count.value++;


}
