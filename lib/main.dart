import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizme_app_demo/algebra_quiz.dart';
import 'package:quizme_app_demo/assembly_lang_quiz.dart';
import 'package:quizme_app_demo/constants/user_preferences.dart';
import 'package:quizme_app_demo/courses_view.dart';
import 'package:quizme_app_demo/database_quiz.dart';
import 'package:quizme_app_demo/electronics_quiz.dart';
import 'package:quizme_app_demo/firebase_options.dart';
import 'package:quizme_app_demo/homepage.dart';
import 'package:quizme_app_demo/literature_quiz.dart';
import 'package:quizme_app_demo/logic_view.dart';
import 'package:quizme_app_demo/mobile_apps_quiz.dart';
import 'package:quizme_app_demo/notification_view.dart';
import 'package:quizme_app_demo/privacy_policy_view.dart';
import 'package:quizme_app_demo/profile_view.dart';
import 'package:quizme_app_demo/register_view.dart';
import 'package:quizme_app_demo/reset_password_view.dart';
import 'package:quizme_app_demo/services/theme_provider.dart';
import 'package:quizme_app_demo/settings_view.dart';
import 'package:quizme_app_demo/system_analysis_quiz.dart';
import 'package:quizme_app_demo/terms_and_conditions_view.dart';
import 'package:quizme_app_demo/visual_basic_quiz.dart';
import 'about_view.dart';
import 'edit_profile_view.dart';
import 'login_view.dart';
import 'package:quizme_app_demo/constants/routes.dart';
import 'package:quizme_app_demo/verify_email_view.dart';

void main() async {
  //Initialize the firebase app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Initialize the user preferences class
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //creates and initializes a new user
  late StreamSubscription user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
      } else {}
    });
  }
//disposes the user variable
  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //handles the app theme and the changes in the theme
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            //checks if a user has been signed in and returns the appropriate page
            initialRoute: FirebaseAuth.instance.currentUser == null
                ? loginRoute
                : homepageRoute,
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme ? dark : light,
            title: 'QuizMe',
            routes: {
              //Initiate all named routes in the project
              verifyEmailRoute: (context) => const VerifyEmailView(),
              loginRoute: (context) => const LoginView(),
              registerRoute: (context) => const RegisterView(),
              homepageRoute: (context) => const Homepage(),
              termsRoute: (context) => const TermsAndConditionsView(),
              policyRoute: (context) => const PrivacyPolicyView(),
              settingsRoute: (context) => const SettingsView(),
              resetPasswordRoute: (context) => const ResetPasswordView(),
              logicRoute: (context) => const LogicView(),
              notificationRoute: (context) => const NotificationView(),
              profileRoute: (context) => const ProfileView(),
              editProfileRoute: (context) => const EditProfileView(),
              aboutRoute: (context) => const AboutView(),
              coursesRoute: (context) => const CoursesView(),
              assemblyRoute: (context) => const AssemblyQuizView(),
              vbRoute: (context) => const VisualQuizView(),
              systemAnalysisRoute: (context) => const SystemAnalysisQuizView(),
              algebraRoute: (context) => const AlgebraQuizView(),
              mobileAppsRoute: (context) => const MobileAppsQuizView(),
              databaseRoute: (context) => const DatabaseQuizView(),
              electronicsRoute: (context) => const ElectronicsQuizView(),
              literatureRoute: (context) => const LiteratureQuizView()
            },
            home: const Scaffold(
              body: LoginView(),
            ),
          );
        },
      ),
    );
  }
}
