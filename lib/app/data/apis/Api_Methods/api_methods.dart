import 'dart:convert';
import 'dart:io';
import 'package:elearner/Models/My_friend_request.dart';
import 'package:elearner/Models/featured_model.dart';
import 'package:elearner/Models/getEvents.dart';
import 'package:elearner/Models/get_categories.dart';
import 'package:http/http.dart' as http;
import '../../../../CommonFile/http_methods.dart';
import '../../../../Models/Alluser_model.dart';
import '../../../../Models/DashboardData.dart';
import '../../../../Models/My_Friend_Model.dart';
import '../../../../Models/SearchHistory_model.dart';
import '../../../../Models/friend_profile_model.dart';
import '../../../../Models/get_event_details.dart';
import '../../../../Models/search_history.dart';
import '../Api_Models/SimpleResponseModel.dart';
import '../Api_Models/get_send_otp_model.dart';
import '../Api_Models/get_user_model.dart';
import '../Api_Url_Constants/api_url_constants.dart';

class ApiMethods {
  static Future<SimpleResponseModel?> userSignup({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUserSignup,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Send Otp For Login...
  static Future<SendOtpModel?> sendOtpForLogin({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SendOtpModel? sendOtpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogin,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sendOtpModel = SendOtpModel.fromJson(jsonDecode(response.body));
      return sendOtpModel;
    }
    return null;
  }

  ///  Login With Otp ...
  static Future<UserModel?> loginWithOtp({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLoginWithOtp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  /// Send Otp For Forgot Password ....
  // static Future<SendOtpModel?> sendOtpForPassword({
  //   void Function(int)? checkResponse,
  //   Map<String, dynamic>? bodyParams,
  // }) async {
  //   SendOtpModel? sendOtpModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfPasswordReset,
  //     checkResponse: checkResponse,
  //   );
  //   if (response != null) {
  //     sendOtpModel = SendOtpModel.fromJson(jsonDecode(response.body));
  //     return sendOtpModel;
  //   }
  //   return null;
  // }

  /// Check Otp for reset password.....
  // static Future<UserModel?> checkOtp({
  //   void Function(int)? checkResponse,
  //   Map<String, dynamic>? bodyParams,
  // }) async {
  //   UserModel? simpleResponseModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfOtpVerify,
  //     checkResponse: checkResponse,
  //   );
  //   if (response != null) {
  //     simpleResponseModel = UserModel.fromJson(jsonDecode(response.body));
  //     return simpleResponseModel;
  //   }
  //   return null;
  // }

  /// Create new password .....
  // static Future<UserModel?> newPassword({
  //   void Function(int)? checkResponse,
  //   Map<String, dynamic>? bodyParams,
  // }) async {
  //   UserModel? simpleResponseModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfChangePassword,
  //     checkResponse: checkResponse,
  //   );
  //   if (response != null) {
  //     simpleResponseModel = UserModel.fromJson(jsonDecode(response.body));
  //     return simpleResponseModel;
  //   }
  //   return null;
  // }

  ///  Get Profile  ...
  static Future<UserModel?> getProfile({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetProfile,
      wantSnackBar: false,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  ///Update Profile Api Calling.....
  static Future<UserModel?> updateProfileApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    Map<String, File>? imageMap,
  }) async {
    UserModel? logInModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUpdateProfile,
      imageMap: imageMap,
      checkResponse: checkResponse,
    );

    if (response != null) {
      logInModel = UserModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }

  ///  Dashboard  Api  ...
  static Future<DashboardData?> dashBoardApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    DashboardData? dashboardModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfDashBoardData,
      queryParameters: bodyParams,
      checkResponse: checkResponse,
    );
    if (response != null) {
      dashboardModel = DashboardData.fromJson(jsonDecode(response.body));
      return dashboardModel;
    }
    return null;
  }

  ///  Get All Features  Api  ...
  // static Future<FeaturedModel?> getAllFeaturesApi({
  //   void Function(int)? checkResponse,
  //   required Map<String, dynamic> bodyParams,
  // }) async {
  //   FeaturedModel? featuredModel;
  //   http.Response? response = await MyHttp.getMethodParams(
  //     baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
  //     endPointUri: ApiUrlConstants.endPointOfGetFeatured,
  //     queryParameters: bodyParams,
  //     checkResponse: checkResponse,
  //   );
  //   if (response != null) {
  //     featuredModel = FeaturedModel.fromJson(jsonDecode(response.body));
  //     return featuredModel;
  //   }
  //   return null;
  // }

  ///  Get All Popular Event  Api  ...
  // static Future<FeaturedModel?> getAllPopularEventApi({
  //   void Function(int)? checkResponse,
  //   required Map<String, dynamic> bodyParams,
  // }) async {
  //   FeaturedModel? featuredModel;
  //   http.Response? response = await MyHttp.getMethodParams(
  //     baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
  //     endPointUri: ApiUrlConstants.endPointOfGetPopular,
  //     queryParameters: bodyParams,
  //     checkResponse: checkResponse,
  //   );
  //   if (response != null) {
  //     featuredModel = FeaturedModel.fromJson(jsonDecode(response.body));
  //     return featuredModel;
  //   }
  //   return null;
  // }

  ///  Get All Event  Api  ...
  static Future<GetEvents?> getAllEventApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetEvents? eventData;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetEvents,
      queryParameters: bodyParams,
      checkResponse: checkResponse,
    );
    if (response != null) {
      eventData = GetEvents.fromJson(jsonDecode(response.body));
      return eventData;
    }
    return null;
  }

  ///  Get My Events  Api  ...
  static Future<FeaturedModel?> getMyPublishEventApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    FeaturedModel? featuredModel;
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfMyEvent,
        bodyParams: bodyParams,
        checkResponse: checkResponse,
        wantSnackBar: false);
    if (response != null) {
      featuredModel = FeaturedModel.fromJson(jsonDecode(response.body));
      return featuredModel;
    }
    return null;
  }

  static Future<SimpleResponseModel?> likeUnlikeEvent({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddFav,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  ///  Get Favorites Model  ...
  static Future<FeaturedModel?> getFavoritesList({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    FeaturedModel? featuredModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetFav,
      checkResponse: checkResponse,
    );
    if (response != null) {
      featuredModel = FeaturedModel.fromJson(jsonDecode(response.body));
      return featuredModel;
    }
    return null;
  }

  ///  Get Event Details Model  ...
  static Future<GetEventDetails?> getEventDetail({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetEventDetails? getEventDetails;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetEventDetails,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getEventDetails = GetEventDetails.fromJson(jsonDecode(response.body));
      return getEventDetails;
    }
    return null;
  }

  /// Contact Us api
  // static Future<SimpleResponseModel?> contactUsApi(
  //     {void Function(int)? checkResponse,
  //     Map<String, dynamic>? bodyParams,
  //     bool wantSnackBar = true}) async {
  //   SimpleResponseModel simpleResponseModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfCreateSupportInquiries,
  //     checkResponse: checkResponse,
  //     wantSnackBar: wantSnackBar,
  //   );
  //   if (response != null) {
  //     simpleResponseModel =
  //         SimpleResponseModel.fromJson(jsonDecode(response.body));
  //     return simpleResponseModel;
  //   }
  //   return null;
  // }

  /// Get TermCondition  api
  // static Future<TermConditionModel?> termConditionApi(
  //     {void Function(int)? checkResponse}) async {
  //   TermConditionModel termConditionModel;
  //   http.Response? response = await MyHttp.getMethod(
  //       url: ApiUrlConstants.endPointOfGetTermCondition,
  //       checkResponse: checkResponse);
  //   if (response != null) {
  //     termConditionModel =
  //         TermConditionModel.fromJson(jsonDecode(response.body));
  //     return termConditionModel;
  //   }
  //   return null;
  // }

  /// Get Faq List  api
  // static Future<FaqModel?> faqApi({void Function(int)? checkResponse}) async {
  //   FaqModel termConditionModel;
  //   http.Response? response = await MyHttp.getMethod(
  //       url: ApiUrlConstants.endPointOfGetFqa, checkResponse: checkResponse);
  //   if (response != null) {
  //     termConditionModel = FaqModel.fromJson(jsonDecode(response.body));
  //     return termConditionModel;
  //   }
  //   return null;
  // }

  /// Privacy Policy api
  // static Future<PrivacyPolicyModel?> privacyPolicyApi(
  //     {void Function(int)? checkResponse}) async {
  //   PrivacyPolicyModel privacyPolicyModel;
  //   http.Response? response = await MyHttp.getMethod(
  //       url: ApiUrlConstants.endPointOfGetPrivacyPolicy,
  //       checkResponse: checkResponse);
  //   if (response != null) {
  //     privacyPolicyModel =
  //         PrivacyPolicyModel.fromJson(jsonDecode(response.body));
  //     return privacyPolicyModel;
  //   }
  //   return null;
  // }

  /// Privacy Policy api
  // static Future<PrivacyPolicyModel?> aboutUsApi(
  //     {void Function(int)? checkResponse}) async {
  //   PrivacyPolicyModel privacyPolicyModel;
  //   http.Response? response = await MyHttp.getMethod(
  //       url: ApiUrlConstants.endPointOfGetAboutUs,
  //       checkResponse: checkResponse);
  //   if (response != null) {
  //     privacyPolicyModel =
  //         PrivacyPolicyModel.fromJson(jsonDecode(response.body));
  //     return privacyPolicyModel;
  //   }
  //   return null;
  // }

  ///Add Product Api ....
  static Future<SimpleResponseModel?> addEventApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      List<File>? imageList}) async {
    SimpleResponseModel simpleResponseModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddEvent,
      images: imageList,
      imageKey: 'images[]',
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  ///Update Event Api ....
  // static Future<SimpleResponseModel?> updateEventApi(
  //     {void Function(int)? checkResponse,
  //     Map<String, dynamic>? bodyParams,
  //     List<File>? imageList}) async {
  //   SimpleResponseModel simpleResponseModel;
  //   http.Response? response = await MyHttp.multipart(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfUpdateEvent,
  //     images: imageList,
  //     imageKey: 'images[]',
  //     checkResponse: checkResponse,
  //   );
  //   if (response != null) {
  //     simpleResponseModel =
  //         SimpleResponseModel.fromJson(jsonDecode(response.body));
  //     return simpleResponseModel;
  //   }
  //   return null;
  // }

  /// Get Subscription List  api
  // static Future<SubscriptionPlanModel?> subscriptionApi(
  //     {void Function(int)? checkResponse}) async {
  //   SubscriptionPlanModel subscriptionPlanModel;
  //   http.Response? response = await MyHttp.getMethod(
  //       url: ApiUrlConstants.endPointOfGetPlans, checkResponse: checkResponse);
  //   if (response != null) {
  //     subscriptionPlanModel =
  //         SubscriptionPlanModel.fromJson(jsonDecode(response.body));
  //     return subscriptionPlanModel;
  //   }
  //   return null;
  // }

  /// Create CheckOut Session api
  // static Future<CheckOutSessionModel?> createCheckOutSession(
  //     {void Function(int)? checkResponse,
  //     Map<String, dynamic>? bodyParams,
  //     bool wantSnackBar = true}) async {
  //   CheckOutSessionModel checkOutSessionModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfCheckOutSession,
  //     checkResponse: checkResponse,
  //     wantSnackBar: wantSnackBar,
  //   );
  //   if (response != null) {
  //     checkOutSessionModel =
  //         CheckOutSessionModel.fromJson(jsonDecode(response.body));
  //     return checkOutSessionModel;
  //   }
  //   return null;
  // }

  /// Get Category List  api
  static Future<GetCategory?> categoryApi(
      {void Function(int)? checkResponse}) async {
    GetCategory categoryModel;
    http.Response? response = await MyHttp.getMethod(
        url: ApiUrlConstants.endPointOfGetCategory,
        checkResponse: checkResponse);
    if (response != null) {
      categoryModel = GetCategory.fromJson(jsonDecode(response.body));
      return categoryModel;
    }
    return null;
  }

  ///Use multipart Api Calling.....
  // static Future<TestModel?> useMultipartApi({
  //   void Function(int)? checkResponse,
  //   Map<String, dynamic>? bodyParams,
  //   File? imageFile,
  // }) async {
  //   TestModel? testModel;
  //   http.Response? response = await MyHttp.multipart(
  //     bodyParams: bodyParams,
  //     url: 'http://157.173.222.27:5000/api/v1/user/auth/sign-up',
  //     image: imageFile,
  //     imageKey: 'image',
  //     checkResponse: checkResponse,
  //   );
  //
  //   if (response != null) {
  //     print("Response:-${response.body}");
  //     testModel = TestModel.fromJson(jsonDecode(response.body));
  //     return testModel;
  //   }
  //   return null;
  // }

  /// Stripe Payment Success Response  api
  // static Future<StripeSuccessModel?> getStripeResponseApi(
  //     {void Function(int)? checkResponse, required String stripeUrl}) async {
  //   StripeSuccessModel stripeSuccessModel;
  //   http.Response? response =
  //       await MyHttp.getMethod(url: stripeUrl, checkResponse: checkResponse);
  //   if (response != null) {
  //     stripeSuccessModel =
  //         StripeSuccessModel.fromJson(jsonDecode(response.body));
  //     return stripeSuccessModel;
  //   }
  //   return null;
  // }

  /// Create Subscription api
  // static Future<SimpleResponseModel?> createSubscriptionApi(
  //     {void Function(int)? checkResponse,
  //     Map<String, dynamic>? bodyParams,
  //     bool wantSnackBar = true}) async {
  //   SimpleResponseModel checkOutSessionModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfCreateSubscription,
  //     checkResponse: checkResponse,
  //     wantSnackBar: wantSnackBar,
  //   );
  //   if (response != null) {
  //     checkOutSessionModel =
  //         SimpleResponseModel.fromJson(jsonDecode(response.body));
  //     return checkOutSessionModel;
  //   }
  //   return null;
  // }

  /// My Current Subscription api
  // static Future<MySubscriptionModel?> mySubscriptionApi(
  //     {void Function(int)? checkResponse,
  //     Map<String, dynamic>? bodyParams,
  //     bool wantSnackBar = true}) async {
  //   MySubscriptionModel mySubscriptionModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfMySubscription,
  //     checkResponse: checkResponse,
  //     wantSnackBar: wantSnackBar,
  //   );
  //   if (response != null) {
  //     mySubscriptionModel =
  //         MySubscriptionModel.fromJson(jsonDecode(response.body));
  //     return mySubscriptionModel;
  //   }
  //   return null;
  // }

  /// My Current Subscription api
  // static Future<SimpleResponseModel?> unSubscriptionMySubscriptionApi(
  //     {void Function(int)? checkResponse,
  //     Map<String, dynamic>? bodyParams,
  //     bool wantSnackBar = true}) async {
  //   SimpleResponseModel simpleResponseModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfUnSubscription,
  //     checkResponse: checkResponse,
  //     wantSnackBar: wantSnackBar,
  //   );
  //   if (response != null) {
  //     simpleResponseModel =
  //         SimpleResponseModel.fromJson(jsonDecode(response.body));
  //     return simpleResponseModel;
  //   }
  //   return null;
  // }

  /// Get Notification List  api
  // static Future<NotificationModel?> notificationApi(
  //     {void Function(int)? checkResponse}) async {
  //   NotificationModel categoryModel;
  //   http.Response? response = await MyHttp.getMethod(
  //       url: ApiUrlConstants.endPointOfGetNotification,
  //       checkResponse: checkResponse);
  //   if (response != null) {
  //     categoryModel = NotificationModel.fromJson(jsonDecode(response.body));
  //     return categoryModel;
  //   }
  //   return null;
  // }

  /// My Payment List api
  // static Future<MyPaymentModel?> myPaymentListApi(
  //     {void Function(int)? checkResponse,
  //     Map<String, dynamic>? bodyParams,
  //     bool wantSnackBar = true}) async {
  //   MyPaymentModel myPaymentModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfMyPayments,
  //     checkResponse: checkResponse,
  //     wantSnackBar: wantSnackBar,
  //   );
  //   if (response != null) {
  //     myPaymentModel = MyPaymentModel.fromJson(jsonDecode(response.body));
  //     return myPaymentModel;
  //   }
  //   return null;
  // }

  /// Get All User List api
  static Future<AllUserModel?> allUserListApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    AllUserModel allUserModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetUsers,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      allUserModel = AllUserModel.fromJson(jsonDecode(response.body));
      return allUserModel;
    }
    return null;
  }

  /// Get Friend Profile api
  static Future<FriendProfileModel?> getFriendProfileApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    FriendProfileModel friendProfileModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetUsersEvent,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      friendProfileModel =
          FriendProfileModel.fromJson(jsonDecode(response.body));
      return friendProfileModel;
    }
    return null;
  }

  /// Add Search name  api
  static Future<SearchHistoryModel?> addSearchHistoryApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = false}) async {
    SearchHistoryModel searchHistoryModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddSearchLogs,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      searchHistoryModel =
          SearchHistoryModel.fromJson(jsonDecode(response.body));
      return searchHistoryModel;
    }
    return null;
  }

  /// Get Search list  api
  static Future<SearchHistory?> getSearchHistoryApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = false}) async {
    SearchHistory searchHistoryModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetSearchLogs,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      searchHistoryModel =
          SearchHistory.fromJson(jsonDecode(response.body));
      return searchHistoryModel;
    }
    return null;
  }

  /// Get Delete Search list  api
  static Future<SimpleResponseModel?> deleteSearchHistoryApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    SimpleResponseModel simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfDeleteSearchLogs,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Send Follow Request api
  static Future<SimpleResponseModel?> sendFollowRequestApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    SimpleResponseModel simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSendRequest,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// accept Follow Request api
  static Future<SimpleResponseModel?> acceptRequestApi(
      {void Function(int)? checkResponse,
        Map<String, dynamic>? bodyParams,
        bool wantSnackBar = true}) async {
    SimpleResponseModel simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetAcceptReq,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Un Follow From Friend list api
  static Future<SimpleResponseModel?> userUnFollowApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    SimpleResponseModel simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfDeleteReq,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// delete request From Friend list api
  static Future<SimpleResponseModel?> deleteRequestApi(
      {void Function(int)? checkResponse,
        Map<String, dynamic>? bodyParams,
        bool wantSnackBar = true}) async {
    SimpleResponseModel simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUnFollow,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Get My Friend List api
  static Future<MyFriendModel?> getMyFriendListApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    MyFriendModel myFriendModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetMyFriend,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      myFriendModel = MyFriendModel.fromJson(jsonDecode(response.body));
      return myFriendModel;
    }
    return null;
  }

  /// Get My Friend List api
  static Future<MyFriendRequest?> getMyFriendRequestApi(
      {void Function(int)? checkResponse,
        Map<String, dynamic>? bodyParams,
        bool wantSnackBar = true}) async {
    MyFriendRequest myFriendRequest;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetFollowRequest,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      myFriendRequest = MyFriendRequest.fromJson(jsonDecode(response.body));
      return myFriendRequest;
    }
    return null;
  }
}
