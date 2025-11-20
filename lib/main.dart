import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';
import 'screens/appointments/appointment_page.dart';
import 'screens/chat/chat_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/activity/activity_page.dart';
import 'utils/responsive.dart';
import 'screens/login/login_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/personalize/personalize_card.dart';

void main() {
  // Entry point — launches the Flutter application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Initialize responsive utility based on device size
        Responsive.init(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,

          // ===============================
          // APP ROUTING CONFIGURATION
          // Defines all top-level pages of the app
          // ===============================
          routes: {
            '/login': (_) => const LoginScreen(),

            // OTP screen receives phone/email as argument
            '/otp': (context) {
              final args = ModalRoute.of(context)!.settings.arguments as String;
              return OtpScreen(phoneOrEmail: args);
            },

            '/personalize': (_) => const PersonalizeCard(),

            // Main navigation screens
            '/home': (_) => const HomePage(),
            '/appointments': (_) => const AppointmentPage(),
            '/chat': (_) => const ChatPage(),
            '/profile': (_) => const ProfilePage(),
            '/activity': (_) => const ActivityPage(),
          },

          // App starts here by default
          initialRoute: '/login',
        );
      },
    );
  }
}