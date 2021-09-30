import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  ExerciseCard(this.name, this.description, this.imageUrl);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          this.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          this.description,
          style: TextStyle(
            color: Theme.of(context).textTheme.subtitle2?.color,
          ),
        ),
        leading: Image.network(
          this.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        trailing: IconButton(
          onPressed: () => print('Remove pressed'),
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
