import 'package:flutter/material.dart';
import 'authentication_service.dart';
// screens
import 'ui/home.dart';
import 'ui/sign_in.dart';
import 'ui/sign_up.dart';
import 'ui/splash.dart';
// Import the provider plugin
import 'package:provider/provider.dart';
// Import the firebase plugins
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';



// 1
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 2
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        // 3
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges, 
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Firebase Auth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.indigoAccent
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Splash(),
          '/auth': (context) => AuthenticationWrapper(),
          '/signin': (context) => SignIn(),
          '/signup': (context) => SignUp(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    if (firebaseuser != null) {
        return Home();
      } 
      return SignIn();
  }
}
