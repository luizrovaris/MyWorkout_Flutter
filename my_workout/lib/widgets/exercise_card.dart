import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/exercise_provider.dart';

class ExerciseCard extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  ExerciseCard(this.id, this.name, this.description, this.imageUrl);

  void _delete(BuildContext context) async {
    await Provider.of<ExerciseProvider>(context, listen: false).delete(id);
  }
  
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
          onPressed: () => _delete(context),
          color: Colors.red,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
