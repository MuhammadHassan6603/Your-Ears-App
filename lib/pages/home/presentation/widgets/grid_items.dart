import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/helper/share_prefences.dart';
import 'package:your_ears_app/models/services_model.dart';
import 'package:your_ears_app/pages/home/data/service_api.dart';
import 'package:your_ears_app/pages/home/presentation/widgets/gridWidgets.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/signup_provider.dart';

class GridItems extends StatefulWidget {
  const GridItems({super.key});

  @override
  State<GridItems> createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  Future<List<ServicesModel>> fetchServices(BuildContext context) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final signupProvider = Provider.of<SignupProvider>(context, listen: false);
    SharedPrefHelper sharedPrefHelper = SharedPrefHelper();
    String? token;

    // Try to retrieve the token from SharedPreferences
    token = await sharedPrefHelper.getString();

    // Update token from providers if available
    if (loginProvider.token != null && loginProvider.token!.isNotEmpty) {
      token = loginProvider.token;
      // Save token persistently
      await sharedPrefHelper.setString(token!);
    } else if (signupProvider.token != null &&
        signupProvider.token!.isNotEmpty) {
      token = signupProvider.token;
      // Save token persistently
      await sharedPrefHelper.setString(token!);
    }

    // If no valid token is found, log error and return an empty list
    if (token == null || token.isEmpty) {
      log('Error: No valid token found. Cannot fetch services.');
      return [];
    }

    final apiService = ServiceApiService();
    try {
      // Fetch services using the valid token
      final services = await apiService.fetchServices(token);
      return services;
    } catch (e) {
      log('Error fetching services: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServicesModel>>(
      future: fetchServices(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No services available'));
        } else {
          final services = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Column(
              spacing: 15,
              children: [
                for (int i = 0; i < services.length; i += 2)
                  Row(  
                    spacing: 15,
                    children: [
                      gridWidget(context, services[i].imageUrl ?? '',
                          services[i].name ?? '', services[i].id!,services[i].startTime!.toString(),services[i].endTime!.toString()),
                      if (i + 1 < services.length)
                        gridWidget(context, services[i + 1].imageUrl ?? '',
                            services[i + 1].name ?? '', services[i + 1].id!,services[i+1].startTime!.toString(),services[i+1].endTime!.toString()),
                    ],
                  ),
              ],
            ),
          );
        }
      },
    );
  }
}
