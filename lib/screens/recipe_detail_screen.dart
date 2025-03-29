import 'package:flutter/material.dart';
import 'dart:async';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  @override
  RecipeDetailScreenState createState() => RecipeDetailScreenState();
}

class RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int _servings = 0;
  bool _isCooking = false;
  int _timerSeconds = 0;
  Timer? _timer;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _servings = widget.recipe.servings;
    _isFavorite = widget.recipe.isFavorite;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _timerSeconds = widget.recipe.cookingTimeMinutes * 60;
      _isCooking = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          _isCooking = false;
          _timer?.cancel();
          // Show completion alert
          _showTimerCompleteDialog();
        }
      });
    });
  }

  void _showTimerCompleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cooking Complete!'),
          content: Text('Your ${widget.recipe.title} is ready to be served.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite
              ? '${widget.recipe.title} added to favorites'
              : '${widget.recipe.title} removed from favorites',
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recipe.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : null,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Image
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    widget.recipe.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.grey[600],
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (_isCooking)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.timer, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            _formatTime(_timerSeconds),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),

            // Recipe Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipe.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.recipe.description,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 16),

                  // Recipe Quick Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoItem(
                        context,
                        Icons.timer,
                        '${widget.recipe.cookingTimeMinutes} min',
                      ),
                      _buildInfoItem(
                        context,
                        Icons.people,
                        '$_servings servings',
                      ),
                      _buildInfoItem(
                        context,
                        Icons.layers,
                        widget.recipe.difficulty,
                      ),
                    ],
                  ),

                  // Cooking Timer
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              'Cooking Timer',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              _isCooking
                                  ? 'Time remaining: ${_formatTime(_timerSeconds)}'
                                  : 'Start the timer when you begin cooking',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(height: 8),
                            ElevatedButton.icon(
                              icon: Icon(
                                _isCooking ? Icons.stop : Icons.play_arrow,
                              ),
                              label: Text(
                                _isCooking ? 'Stop Timer' : 'Start Timer',
                              ),
                              onPressed: () {
                                if (_isCooking) {
                                  setState(() {
                                    _isCooking = false;
                                    _timer?.cancel();
                                  });
                                } else {
                                  _startTimer();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    _isCooking
                                        ? Colors.red
                                        : Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Servings Calculator
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              'Adjust Servings',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed:
                                      _servings > 1
                                          ? () {
                                            setState(() {
                                              _servings--;
                                            });
                                          }
                                          : null,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    '$_servings',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      _servings++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(height: 32),

                  // Ingredients Section
                  _buildSectionTitle(context, 'Ingredients'),
                  SizedBox(height: 8),
                  ...widget.recipe.ingredients.map(
                    (ingredient) => _buildIngredientItem(
                      context,
                      ingredient,
                      _servings / widget.recipe.servings,
                    ),
                  ),

                  SizedBox(height: 16),

                  // Instructions Section
                  _buildSectionTitle(context, 'Instructions'),
                  SizedBox(height: 8),
                  ...List.generate(
                    widget.recipe.steps.length,
                    (index) => _buildStepItem(
                      context,
                      index + 1,
                      widget.recipe.steps[index],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        SizedBox(height: 4),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildIngredientItem(
    BuildContext context,
    String ingredient,
    double ratio,
  ) {
    // Extract quantity and unit if possible
    final RegExp quantityRegex = RegExp(r'^(\d+(?:\.\d+)?)\s*([a-zA-Z]+)?');
    final match = quantityRegex.firstMatch(ingredient);

    String displayText = ingredient;

    if (match != null) {
      // Extract the numeric part and calculate adjusted quantity
      final quantity = double.parse(match.group(1) ?? '0');
      final unit = match.group(2) ?? '';
      final adjustedQuantity = (quantity * ratio)
          .toStringAsFixed(1)
          .replaceAll(RegExp(r'\.0$'), ''); // Remove trailing .0

      // Replace the original quantity with the adjusted one
      displayText = ingredient.replaceFirst(
        match.group(0) ?? '',
        '$adjustedQuantity $unit',
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.fiber_manual_record,
            size: 8,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              displayText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(BuildContext context, int stepNumber, String step) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              stepNumber.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(step, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
