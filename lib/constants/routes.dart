import 'package:get/get.dart';
import 'package:sati/screens/category/category_page.dart';
import 'package:sati/screens/chat/chat_page.dart';
import 'package:sati/screens/createpassword/password_page.dart';
import 'package:sati/screens/history/history_page.dart';
import 'package:sati/screens/home/tabs.dart';
import 'package:sati/screens/login/Login_page.dart';
import 'package:sati/screens/otp/otp_page.dart';
import 'package:sati/screens/recent/recent_page.dart';
import 'package:sati/screens/register/register_page.dart';
import 'package:sati/screens/single/single_page.dart';
import 'package:sati/screens/splash/splash_screen.dart';
import 'package:sati/screens/subcategory/subcategory_page.dart';

var routes = [
  GetPage(name: '/splash', page: () => const SplashScreen()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/register', page: () => const RegisterPage()),
  GetPage(name: '/otp', page: () => const OtpPage()),
  GetPage(name: '/password', page: () => const PasswordPage()),
  GetPage(name: '/home', page: () => const HomePage()),
  GetPage(name: '/category', page: () => const CategoryPage()),
  GetPage(name: '/subcategory', page: () => const SubCategoryPage()),
  GetPage(name: '/single', page: () => const SinglePage()),
  GetPage(name: '/recent', page: () => const RecentPage()),
  GetPage(name: '/cart', page: () => const HistoryPage()),
  GetPage(name: '/chat', page: () => const ChatPage()),
];
