import 'package:flutter/material.dart';

class TodayWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            SizedBox(
              width: _query.size.width * 0.6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Daily Workout'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('---'),
                    ],
                  ),
                ],
              ),
            ),
            ClipRRect(            
              borderRadius: BorderRadius.circular(18.5),
              child: Image(
                image: NetworkImage('https://cdn.pixabay.com/photo/2016/11/21/17/33/body-1846668_1280.jpg'),
                width: _query.size.width * 0.35,
                height: 200,
            
              ),
            ),
          ],
        ),
      ),
    );
  }
}
