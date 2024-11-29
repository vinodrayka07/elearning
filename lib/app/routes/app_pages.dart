import 'package:get/get.dart';

import '../../custom_orientation_player/custom_orientation_player.dart';
import '../modules/AddEventPage/bindings/add_event_page_binding.dart';
import '../modules/AddEventPage/views/add_event_page_view.dart';
import '../modules/AddFriendsPage/bindings/add_friends_page_binding.dart';
import '../modules/AddFriendsPage/views/add_friends_page_view.dart';
import '../modules/FavoritesPage/bindings/favorites_page_binding.dart';
import '../modules/FavoritesPage/views/favorites_page_view.dart';
import '../modules/MainActivity/bindings/main_activity_binding.dart';
import '../modules/MainActivity/views/main_activity_view.dart';
import '../modules/MyEventPage/bindings/my_event_page_binding.dart';
import '../modules/MyEventPage/views/my_event_page_view.dart';
import '../modules/MySubscriptioPage/bindings/my_subscriptio_page_binding.dart';
import '../modules/MySubscriptioPage/views/my_subscriptio_page_view.dart';
import '../modules/My_Friends_page/bindings/my_friends_page_binding.dart';
import '../modules/My_Friends_page/views/my_friends_page_view.dart';
import '../modules/ProfileUpdatePage/bindings/profile_update_page_binding.dart';
import '../modules/ProfileUpdatePage/views/profile_update_page_view.dart';
import '../modules/SearchPage/bindings/search_page_binding.dart';
import '../modules/SearchPage/views/search_page_view.dart';
import '../modules/Signup/bindings/signup_binding.dart';
import '../modules/Signup/views/signup_view.dart';
import '../modules/Videoplayer/bindings/videoplayer_binding.dart';
import '../modules/Videoplayer/views/videoplayer_view.dart';
import '../modules/dashboard_page/bindings/dashboard_page_binding.dart';
import '../modules/dashboard_page/views/dashboard_page_view.dart';
import '../modules/dataViewpage/bindings/data_viewpage_binding.dart';
import '../modules/dataViewpage/views/data_viewpage_view.dart';
import '../modules/editEventPage/bindings/edit_event_page_binding.dart';
import '../modules/editEventPage/views/edit_event_page_view.dart';
import '../modules/event_details_page/bindings/event_details_page_binding.dart';
import '../modules/event_details_page/views/event_details_page_view.dart';
import '../modules/friends_list_page/bindings/friends_list_page_binding.dart';
import '../modules/friends_list_page/views/friends_list_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/otp_page/bindings/otp_page_binding.dart';
import '../modules/otp_page/views/otp_page_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/views/profile_page_view.dart';
import '../modules/search_list_view/bindings/search_list_view_binding.dart';
import '../modules/search_list_view/views/search_list_view_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => const SearchPageView(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: _Paths.VIDEOPLAYER,
      page: () => const VideoplayerView(),
      binding: VideoplayerBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => CustomOrientationPlayer(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.OTP_PAGE,
      page: () => const OtpPageView(),
      binding: OtpPageBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_PAGE,
      page: () => const DashboardPageView(),
      binding: DashboardPageBinding(),
    ),
    GetPage(
      name: _Paths.DATA_VIEWPAGE,
      page: () => const DataViewpageView(),
      binding: DataViewpageBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_LIST_VIEW,
      page: () => const SearchListViewView(),
      binding: SearchListViewBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAILS_PAGE,
      page: () => const EventDetailsPageView(),
      binding: EventDetailsPageBinding(),
    ),
    GetPage(
      name: _Paths.FRIENDS_LIST_PAGE,
      page: () => const FriendsListPageView(),
      binding: FriendsListPageBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_ACTIVITY,
      page: () => const MainActivityView(),
      binding: MainActivityBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES_PAGE,
      page: () => const FavoritesPageView(),
      binding: FavoritesPageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EVENT_PAGE,
      page: () => const AddEventPageView(),
      binding: AddEventPageBinding(),
    ),
    GetPage(
      name: _Paths.MY_FRIENDS_PAGE,
      page: () => const MyFriendsPageView(),
      binding: MyFriendsPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_UPDATE_PAGE,
      page: () => const ProfileUpdatePageView(),
      binding: ProfileUpdatePageBinding(),
    ),
    GetPage(
      name: _Paths.MY_EVENT_PAGE,
      page: () => const MyEventPageView(),
      binding: MyEventPageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_FRIENDS_PAGE,
      page: () => const AddFriendsPageView(),
      binding: AddFriendsPageBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EVENT_PAGE,
      page: () => const EditEventPageView(),
      binding: EditEventPageBinding(),
    ),
    GetPage(
      name: _Paths.MY_SUBSCRIPTIO_PAGE,
      page: () => const MySubscriptioPageView(),
      binding: MySubscriptioPageBinding(),
    ),
  ];
}
