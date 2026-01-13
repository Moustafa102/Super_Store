import 'package:final_project/core/resources/app_field.dart';
import 'package:final_project/features/search/search_results.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppField(
                hint: "Search",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.search),
                ),
                onFieldSubmitted: (value) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchResults(input: value),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        "assets/json/search.json",
                        width: 250,
                        height: 250,
                        fit: BoxFit.contain,
                        repeat: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
