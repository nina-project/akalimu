import 'package:akalimu/data/local_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/category.dart';
import '../../data/models/client.dart';
import '../../data/providers/app_provider.dart';
import '../../routes.dart';

class AdditionalDetails extends StatefulWidget {
  const AdditionalDetails({super.key});

  @override
  State<AdditionalDetails> createState() => _AdditionalDetailsState();
}

class _AdditionalDetailsState extends State<AdditionalDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  Category? categoryValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AppProvider appProvider =
          Provider.of<AppProvider>(context, listen: false);
      await appProvider.fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Consumer<AppProvider>(builder: (context, appProvider, _) {
            List<Category> categories = appProvider.categories;
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Skills and \nAdditional details",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Country',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _countryController,
                    decoration: const InputDecoration(
                      hintText: 'Enter country where you are located',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF163a96)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter country';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'City',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      hintText: 'Enter city where you are located',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF163a96)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter city';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  DropdownButtonFormField<Category>(
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xFF163a96)),
                      ),
                    ),
                    value: categoryValue,
                    onChanged: (newValue) {
                      setState(() {
                        categoryValue = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select category you would like to belong to';
                      }
                      return null;
                    },
                    items: categories
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 40.0),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFF163a96), // Text Color background color)
                      ),
                      onPressed: () {
                        updateProfile();
                      },
                      child: const Text('Update Details'),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  updateProfile() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      Client currentUserData =
          appProvider.userData ?? LocalPreferences().userData!;
      Client userData = currentUserData.copyWith(
        country: _countryController.text,
        city: _cityController.text,
        categories: categoryValue != null ? [categoryValue!] : [],
        updatedAt: DateTime.now(),
      );

      appProvider.updateUserData(userData).then((value) {
        _formKey.currentState!.reset();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
      });
    }
  }
}
