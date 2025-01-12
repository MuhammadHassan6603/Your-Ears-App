import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/models/services_model.dart';
import 'package:your_ears_app/pages/home/data/service_api.dart';
import 'package:your_ears_app/pages/home/presentation/widgets/gridWidgets.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/signup_provider.dart';

class GridItems extends StatefulWidget {
  const GridItems({Key? key}) : super(key: key);

  @override
  State<GridItems> createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  Future<List<ServicesModel>> fetchServices(BuildContext context) async {
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
      log('Error: No valid token found. Cannot fetch services.');
      return [];
    }
    final apiService = ServiceApiService();
    try {
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
          child: Column(
            spacing: 15,
            children: [
              for (int i = 0; i < services.length; i += 2)
                Row(
                  spacing: 15,
                  children: [
                    gridWidget(
                      context,
                      services[i].imageUrl??'',
                      services[i].name??'',
                    ),
                    if (i + 1 < services.length)
                      gridWidget(
                        context,
                        services[i + 1].imageUrl??'',
                        services[i + 1].name??'',
                      ),
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
