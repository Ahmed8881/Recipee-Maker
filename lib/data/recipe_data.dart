import '../models/recipe.dart';

// Hardcoded categories
List<Category> categories = [
  Category(
    id: 'c1',
    name: 'Breakfast',
    imageUrl:
        'https://img.freepik.com/free-photo/flat-lay-table-full-delicious-food-composition_23-2149141362.jpg',
    description: 'Start your day with these delicious breakfast recipes',
  ),
  Category(
    id: 'c2',
    name: 'Main Course',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp9OZs-ICFOGYXXB5JADlTLxLDJo7__C-GTg&s',
    description: 'Delicious main dishes for lunch and dinner',
  ),
  Category(
    id: 'c3',
    name: 'Desserts',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4hWbxw7BCuRVjAibOy7rY_oQ5zYSzQTVDgA&s',
    description: 'Sweet treats to satisfy your cravings',
  ),
  Category(
    id: 'c4',
    name: 'Vegan',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCJgnE0o2AYEpC9MEqqEYYUVYwPsAzd9KPoQ&s',
    description: 'Plant-based recipes that are delicious and nutritious',
  ),
  Category(
    id: 'c5',
    name: 'Quick Meals',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvePc2S_zW49GF-jt-5RUMma79nWD59vpFzw&s',
    description: 'Ready in 30 minutes or less',
  ),
];

// Hardcoded recipes
List<Recipe> recipes = [
  // Breakfast Recipes
  Recipe(
    id: 'r1',
    title: 'Fluffy Pancakes',
    description:
        'Light and fluffy pancakes that are perfect for a weekend breakfast',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqb_qV6y4DvEs9VEu81bfL4Ffdpiz4dNwxfQ&s',
    ingredients: [
      '2 cups all-purpose flour',
      '2 tablespoons sugar',
      '1 tablespoon baking powder',
      '1/2 teaspoon salt',
      '2 eggs',
      '1 3/4 cups milk',
      '1/4 cup vegetable oil',
      '1 teaspoon vanilla extract',
    ],
    steps: [
      'In a large bowl, whisk together flour, sugar, baking powder, and salt.',
      'In another bowl, beat the eggs, then add milk, oil, and vanilla.',
      'Pour the wet ingredients into the dry ingredients and stir until just combined (lumps are okay).',
      'Heat a lightly oiled griddle or frying pan over medium-high heat.',
      'Pour the batter onto the griddle, using approximately 1/4 cup for each pancake.',
      'Cook until bubbles form and the edges look dry, then flip and cook until browned on the other side.',
      'Serve hot with maple syrup, fresh fruit, or your favorite toppings.',
    ],
    cookingTimeMinutes: 20,
    servings: 4,
    difficulty: 'Easy',
    categories: ['c1'],
  ),
  Recipe(
    id: 'r2',
    title: 'Avocado Toast',
    description: 'Simple and nutritious avocado toast with various toppings',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc9AIvAc6dkD5GTVhVASi91F4Jc4n7AbOFhw&s',
    ingredients: [
      '2 slices of whole grain bread',
      '1 ripe avocado',
      '1/2 lemon, juiced',
      'Salt and pepper to taste',
      'Red pepper flakes (optional)',
      '2 eggs (optional)',
      'Cherry tomatoes, halved (optional)',
      'Microgreens or sprouts (optional)',
    ],
    steps: [
      'Toast the bread slices until golden and crisp.',
      'Cut the avocado in half, remove the pit, and scoop the flesh into a bowl.',
      'Add lemon juice, salt, and pepper to the avocado and mash with a fork to desired consistency.',
      'Spread the mashed avocado evenly on the toast slices.',
      'If using, top with halved cherry tomatoes, microgreens, or a fried egg.',
      'Sprinkle with red pepper flakes if desired.',
      'Serve immediately.',
    ],
    cookingTimeMinutes: 10,
    servings: 2,
    difficulty: 'Easy',
    categories: ['c1', 'c4', 'c5'],
  ),

  // Main Course Recipes
  Recipe(
    id: 'r3',
    title: 'Spaghetti Bolognese',
    description: 'Classic Italian pasta dish with a rich meat sauce',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA_EF-1qMDLEoJA2sJ9S0rbE8qgw1ffJK3Bw&s',
    ingredients: [
      '1 lb spaghetti',
      '1 lb ground beef',
      '1 onion, finely chopped',
      '2 cloves garlic, minced',
      '1 carrot, finely diced',
      '1 celery stalk, finely diced',
      '1 can (28 oz) crushed tomatoes',
      '2 tablespoons tomato paste',
      '1 cup beef broth',
      '1 teaspoon dried oregano',
      '1 teaspoon dried basil',
      '1/2 teaspoon sugar',
      'Salt and pepper to taste',
      'Grated Parmesan cheese for serving',
    ],
    steps: [
      'Heat a large pot of salted water to boiling for the pasta.',
      'In a large skillet or Dutch oven, brown the ground beef over medium heat, breaking it up as it cooks.',
      'Add onion, garlic, carrot, and celery to the beef and cook until vegetables are softened, about 5 minutes.',
      'Stir in tomato paste and cook for 1 minute.',
      'Add crushed tomatoes, beef broth, oregano, basil, sugar, salt, and pepper.',
      'Bring to a simmer, then reduce heat to low and cook uncovered for 30 minutes, stirring occasionally.',
      'While the sauce simmers, cook the spaghetti according to package instructions until al dente.',
      'Drain the pasta and serve topped with the Bolognese sauce and grated Parmesan cheese.',
    ],
    cookingTimeMinutes: 45,
    servings: 6,
    difficulty: 'Medium',
    categories: ['c2'],
  ),
  Recipe(
    id: 'r4',
    title: 'Vegetable Stir Fry',
    description: 'Quick and healthy stir-fried vegetables with a savory sauce',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZLma0d73k7wIYPeWAp8zAs43GBi1fwSdbw&s',
    ingredients: [
      '2 tablespoons vegetable oil',
      '2 cloves garlic, minced',
      '1 tablespoon ginger, grated',
      '1 bell pepper, sliced',
      '1 carrot, julienned',
      '1 cup broccoli florets',
      '1 cup snap peas',
      '1 cup mushrooms, sliced',
      '1/4 cup soy sauce',
      '1 tablespoon rice vinegar',
      '1 tablespoon honey or maple syrup',
      '1 teaspoon cornstarch mixed with 2 tablespoons water',
      'Sesame seeds and green onions for garnish',
      'Cooked rice for serving',
    ],
    steps: [
      'Heat oil in a large wok or skillet over high heat.',
      'Add garlic and ginger, stir-fry for 30 seconds until fragrant.',
      'Add vegetables, starting with the ones that take longer to cook (carrots, broccoli) and stir-fry for 2-3 minutes.',
      'Add remaining vegetables and stir-fry for another 3-4 minutes until crisp-tender.',
      'In a small bowl, whisk together soy sauce, rice vinegar, and honey/maple syrup.',
      'Pour sauce mixture over vegetables and stir to coat.',
      'Add cornstarch slurry and cook for 1-2 minutes until sauce thickens.',
      'Garnish with sesame seeds and sliced green onions.',
      'Serve hot over cooked rice.',
    ],
    cookingTimeMinutes: 15,
    servings: 4,
    difficulty: 'Easy',
    categories: ['c2', 'c4', 'c5'],
  ),

  // Dessert Recipes
  Recipe(
    id: 'r5',
    title: 'Chocolate Chip Cookies',
    description:
        'Classic homemade chocolate chip cookies with a soft center and crispy edges',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR88da2DpqI0VWtq9FzNs5lNq-l4FSDEEH8FQ&s',
    ingredients: [
      '2 1/4 cups all-purpose flour',
      '1 teaspoon baking soda',
      '1 teaspoon salt',
      '1 cup (2 sticks) unsalted butter, softened',
      '3/4 cup granulated sugar',
      '3/4 cup packed brown sugar',
      '2 large eggs',
      '2 teaspoons vanilla extract',
      '2 cups semi-sweet chocolate chips',
      '1 cup chopped nuts (optional)',
    ],
    steps: [
      'Preheat the oven to 375°F (190°C).',
      'In a small bowl, combine flour, baking soda, and salt.',
      'In a large mixing bowl, beat butter, granulated sugar, and brown sugar until creamy.',
      'Add eggs one at a time, beating well after each addition. Stir in vanilla extract.',
      'Gradually beat in flour mixture until well combined.',
      'Stir in chocolate chips and nuts (if using).',
      'Drop by rounded tablespoon onto ungreased baking sheets.',
      'Bake for 9-11 minutes or until golden brown.',
      'Cool on baking sheets for 2 minutes; remove to wire racks to cool completely.',
    ],
    cookingTimeMinutes: 20,
    servings: 24,
    difficulty: 'Easy',
    categories: ['c3'],
  ),
  Recipe(
    id: 'r6',
    title: 'Fruit Smoothie Bowl',
    description:
        'Refreshing and nutritious smoothie bowl topped with fresh fruits and granola',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf_XRFv0cc1DxN-ObiE9Hfotm0amYC9fnUmw&s',
    ingredients: [
      '2 frozen bananas',
      '1 cup frozen mixed berries',
      '1/2 cup plant-based milk or yogurt',
      '1 tablespoon honey or maple syrup (optional)',
      'Toppings: sliced fresh fruits, granola, chia seeds, coconut flakes, nuts',
    ],
    steps: [
      'Add frozen bananas, berries, and milk/yogurt to a blender.',
      'Blend until smooth and creamy, adding more liquid if needed to reach desired consistency.',
      'Transfer the smoothie to a bowl.',
      'Arrange toppings in sections over the smoothie.',
      'Drizzle with honey or maple syrup if desired.',
      'Serve immediately.',
    ],
    cookingTimeMinutes: 10,
    servings: 1,
    difficulty: 'Easy',
    categories: ['c1', 'c3', 'c4', 'c5'],
  ),

  // Quick Meals
  Recipe(
    id: 'r7',
    title: 'Quesadillas',
    description:
        'Quick and customizable quesadillas filled with cheese and your favorite ingredients',
    imageUrl: 'https://www.recipetineats.com/tachyon/2018/06/Quesadillas_4.jpg',
    ingredients: [
      '4 large flour tortillas',
      '2 cups shredded cheese (cheddar, monterey jack, or a blend)',
      '1 can black beans, drained and rinsed (optional)',
      '1 bell pepper, thinly sliced (optional)',
      '1/2 red onion, thinly sliced (optional)',
      '1 cup cooked chicken, shredded (optional)',
      'Salsa, guacamole, and sour cream for serving',
    ],
    steps: [
      'Heat a large skillet over medium heat.',
      'Place one tortilla in the skillet and sprinkle half of it with a layer of cheese.',
      'Add your choice of fillings on top of the cheese.',
      'Add another layer of cheese on top of the fillings and fold the tortilla in half.',
      'Cook until the bottom is golden brown, about 2-3 minutes.',
      'Flip carefully and cook the other side until golden and the cheese is melted.',
      'Remove from skillet and repeat with remaining tortillas and fillings.',
      'Cut into wedges and serve with salsa, guacamole, and sour cream.',
    ],
    cookingTimeMinutes: 15,
    servings: 4,
    difficulty: 'Easy',
    categories: ['c2', 'c5'],
  ),
];

// Function to get recipes by category
List<Recipe> getRecipesByCategory(String categoryId) {
  return recipes
      .where((recipe) => recipe.categories.contains(categoryId))
      .toList();
}
