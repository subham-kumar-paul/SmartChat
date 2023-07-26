import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_ui/firebase_options.dart';
import 'package:whatsapp_ui/router.dart';
import 'package:whatsapp_ui/screens/mobile_layout_screen.dart';
import 'package:gradients/gradients.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color.fromARGB(132, 6, 1, 11),

          appBarTheme: const AppBarTheme(
            color: Colors.transparent
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileLayoutScreen();
            },
            error: (err, trace) {
              return ErrorScreen(error: err.toString());
            },
            loading: () => const Loader(),
          
          ),
          
    );





  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Whatsapp UI',
  //     theme: ThemeData.dark().copyWith(
  //       appBarTheme: const AppBarTheme(
  //         color: Colors.transparent,
  //       ),
  //     ),
  //     onGenerateRoute: (settings) => generateRoute(settings),
  //     home: Builder(
  //       builder: (context) {
  //         final gradient = LinearGradient(
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //           colors: [
  //             Color.fromARGB(132, 51, 5, 89),
  //             Color.fromARGB(215, 255, 10, 26),
  //           ],
  //         );

  //         return Scaffold(
  //           body: Container(
  //             decoration: BoxDecoration(
  //               gradient: gradient,
  //             ),
  //             child: ref.watch(userDataAuthProvider).when(
  //               data: (user) {
  //                 if (user == null) {
  //                   return const LandingScreen();
  //                 }
  //                 return const MobileLayoutScreen();
  //               },
  //               error: (err, trace) {
  //                 return ErrorScreen(error: err.toString());
  //               },
  //               loading: () => const Loader(),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  }
}