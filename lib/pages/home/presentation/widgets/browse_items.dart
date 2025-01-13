import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/helper/share_prefences.dart';
import 'package:your_ears_app/models/categories_model.dart';
import 'package:your_ears_app/pages/home/data/category_api.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/signup_provider.dart';
import 'package:your_ears_app/utils/color.dart';

class BrowseIcons extends StatelessWidget {
  const BrowseIcons({super.key});

  Future<List<CategoriesModel>> fetchCategories(BuildContext context) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final signupProvider = Provider.of<SignupProvider>(context, listen: false);
    SharedPrefHelper sharepref = SharedPrefHelper();
    String? token;

    // Retrieve saved token from SharedPreferences
    token = await sharepref.getString();

    // Check if loginProvider or signupProvider has a token
    if (loginProvider.token != null && loginProvider.token!.isNotEmpty) {
      log('');
      token = loginProvider.token;
      log(' login token $loginProvider.token');
      // Save the token in SharedPreferences
      await sharepref.setString(token!);
    } else if (signupProvider.token != null &&
        signupProvider.token!.isNotEmpty) {
      token = signupProvider.token;
      log(' signup  token $signupProvider.token');
      // Save the token in SharedPreferences
      await sharepref.setString(token!);
    }

    // If no token is found, log an error and return an empty list
    if (token == null || token.isEmpty) {
      log('Error: No valid token found. Cannot fetch categories.');
      return [];
    }

    final apiService = BrowseApiService();

    try {
      // Fetch categories using the valid token
      final categories = await apiService.fetchCategories(token);
      return categories;
    } catch (e) {
      log('Error fetching categories: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoriesModel>>(
      future: fetchCategories(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No categories available'));
        } else {
          final categories = snapshot.data!;
          List<String> imgPaths = [
            'assets/images/category1.png',
            'assets/images/category2.png',
            'assets/images/category3.png',
            'assets/images/category4.png',
            'assets/images/category5.png',
            'assets/images/category6.png',
            'assets/images/category7.png',
            'assets/images/category8.png',
          ];

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: category.imageUrl != null &&
                              category.imageUrl!.isNotEmpty
                          ? Image.network(
                              category.imageUrl!,
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  imgPaths[index],
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 70,
                                );
                              },
                            )
                          : Image.asset(
                              imgPaths[index],
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            ),
                    ),
                    Text(
                      category.name ?? 'Unknown',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: AppColors.browseItemText,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
