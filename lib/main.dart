import 'package:flutter/material.dart';
import 'package:expense_tracker_app/expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFF5B67FF),
          onPrimary: Colors.white,
          secondary: const Color(0xFFFFB74D),
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: const Color(0xFFF8F9FB),
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black87,
        ),

        scaffoldBackgroundColor: const Color(0xFFF8F9FB),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),

        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF5B67FF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,

        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF8C9EFF),
          onPrimary: Colors.black,
          secondary: Color(0xFFFFCC80),
          onSecondary: Colors.black,
          error: Colors.redAccent,
          onError: Colors.black,
          background: Color(0xFF121212),
          onBackground: Colors.white,
          surface: Color(0xFF1E1E1E),
          onSurface: Colors.white70,
        ),

        scaffoldBackgroundColor: const Color(0xFF121212),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),

        cardTheme: CardThemeData(
          elevation: 0,
          color: const Color(0xFF1E1E1E),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF8C9EFF),
          foregroundColor: Colors.black,
        ),
      ),

      themeMode: ThemeMode.system,
      home: const Expenses(),
    );
  }
}