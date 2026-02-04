import 'package:flutter/material.dart';

//Grid de categorías (Comida, transporte, etc)

class CategoryGrid extends StatelessWidget {
  final List<Category> categories;
  final ValueChanged<Category>? onSelected;

  const CategoryGrid({
    super.key,
    required this.categories,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: categories.map((cat) {
        return CategoryChip(
          category: cat,
          isSelected: cat.isSelected,
          onPressed: () => onSelected?.call(cat),
        );
      }).toList(),
    );
  }
}

class Category {
  final String name;
  final IconData icon;
  final bool isSelected;

  Category({required this.name, required this.icon, this.isSelected = false});
}

class CategoryChip extends StatelessWidget {
  final Category category;
  final VoidCallback? onPressed;
  final bool isSelected;

  const CategoryChip({
    super.key,
    required this.category,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          children: [
            Icon(category.icon, size: 24, color: isSelected ? Colors.white : Colors.blue),
            const SizedBox(height: 4),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}