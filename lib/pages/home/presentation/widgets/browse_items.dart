import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/models/categories_model.dart';
import 'package:your_ears_app/pages/home/data/api_service.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/signup_provider.dart';
import 'package:your_ears_app/utils/color.dart';

class BrowseIcons extends StatelessWidget {
  const BrowseIcons({super.key});

  Future<List<CategoriesModel>> fetchCategories(BuildContext context) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final signupProvider = Provider.of<SignupProvider>(context, listen: false);
    final loginToken = loginProvider.token;
    final signupToken = signupProvider.token;

    String? token;
    if (loginToken != null && loginToken.isNotEmpty) {
      token = loginToken;
    } else if (signupToken != null && signupToken.isNotEmpty) {
      token = signupToken;
    } else {
      log('Error: No valid token found. Cannot fetch categories.');
      return [];
    }

    final apiService = ApiService();
    try {
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
                      child:
                          category.image != null && category.image!.isNotEmpty
                              ? Image.network(
                                  category.image!,
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
