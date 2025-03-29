import 'package:flutter/material.dart';
import '../data/recipe_data.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  List<Recipe> _searchResults = [];
  bool _isSearching = false;
  final Map<String, bool> _filterCategories = {};
  String _selectedDifficulty = 'All';
  final List<String> _difficulties = ['All', 'Easy', 'Medium', 'Hard'];

  @override
  void initState() {
    super.initState();
    // Initialize category filters
    for (var category in categories) {
      _filterCategories[category.id] = false;
    }
  }

  void _performSearch() {
    if (_searchQuery.isEmpty &&
        !_filterCategories.containsValue(true) &&
        _selectedDifficulty == 'All') {
      setState(() {
        _searchResults = [];
        _isSearching = false;
      });
      return;
    }

    setState(() {
      _isSearching = true;

      // Filter by search query, categories, and difficulty
      _searchResults =
          recipes.where((recipe) {
            // Check title and ingredients match
            bool matchesQuery =
                _searchQuery.isEmpty ||
                recipe.title.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ) ||
                recipe.ingredients.any(
                  (ingredient) => ingredient.toLowerCase().contains(
                    _searchQuery.toLowerCase(),
                  ),
                );

            // Check category filters
            bool matchesCategory =
                !_filterCategories.containsValue(true) ||
                recipe.categories.any(
                  (categoryId) => _filterCategories[categoryId] == true,
                );

            // Check difficulty filter
            bool matchesDifficulty =
                _selectedDifficulty == 'All' ||
                recipe.difficulty == _selectedDifficulty;

            return matchesQuery && matchesCategory && matchesDifficulty;
          }).toList();
    });
  }

  Widget _buildCategoryFilters() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children:
          categories.map((category) {
            return FilterChip(
              label: Text(category.name),
              selected: _filterCategories[category.id] ?? false,
              onSelected: (selected) {
                setState(() {
                  _filterCategories[category.id] = selected;
                  _performSearch();
                });
              },
              backgroundColor: Colors.grey[200],
              selectedColor: Theme.of(context).primaryColor.withAlpha((0.3 * 255).toInt()),
              checkmarkColor: Theme.of(context).primaryColor,
            );
          }).toList(),
    );
  }

  Widget _buildDifficultyFilter() {
    return DropdownButton<String>(
      value: _selectedDifficulty,
      hint: Text('Difficulty'),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedDifficulty = newValue;
            _performSearch();
          });
        }
      },
      items:
          _difficulties.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Recipes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search recipes or ingredients',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                    _performSearch();
                  });
                },
              ),
            ),

            // Filters
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter by category',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  _buildCategoryFilters(),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text('Difficulty: '),
                      SizedBox(width: 8),
                      _buildDifficultyFilter(),
                    ],
                  ),
                ],
              ),
            ),

            // Results or initial message
            Expanded(
              child:
                  _isSearching
                      ? _searchResults.isEmpty
                          ? Center(child: Text('No recipes found.'))
                          : ListView.builder(
                            padding: EdgeInsets.all(16.0),
                            itemCount: _searchResults.length,
                            itemBuilder: (ctx, index) {
                              return RecipeCard(
                                recipe: _searchResults[index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => RecipeDetailScreen(
                                            recipe: _searchResults[index],
                                          ),
                                    ),
                                  );
                                },
                              );
                            },
                          )
                      : Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search,
                              size: 80,
                              color: Colors.grey[400],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Search for recipes by name or ingredients',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: Colors.grey[600]),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
