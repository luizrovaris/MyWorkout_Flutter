import 'package:flutter/material.dart';

class TodayWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
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
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Daily Workout',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Abs Advanced',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2016/11/21/17/33/body-1846668_1280.jpg'),
                width: _query.size.width * 0.35,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
