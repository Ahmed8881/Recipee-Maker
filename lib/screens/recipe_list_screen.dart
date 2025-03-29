import 'package:flutter/material.dart';
import '../data/recipe_data.dart';
import '../../models/recipe.dart';
import '../../widgets/recipe_card.dart';
import './recipe_detail_screen.dart';

class RecipeListScreen extends StatelessWidget {
  final Category category;

  const RecipeListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final categoryRecipes = getRecipesByCategory(category.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                category.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child:
                  categoryRecipes.isEmpty
                      ? Center(
                        child: Text(
                          'No recipes found for this category',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                      : ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        itemCount: categoryRecipes.length,
                        itemBuilder: (ctx, index) {
                          return RecipeCard(
                            recipe: categoryRecipes[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => RecipeDetailScreen(
                                        recipe: categoryRecipes[index],
                                      ),
                                ),
                              );
                            },
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
