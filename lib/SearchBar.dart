
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              // Handle search logic here
              // You can filter your data based on the value entered
            },
          ),
         const  SizedBox(height: 16),
          // Add your search results or other widgets here
        ],
      ),
    );
  }
}
