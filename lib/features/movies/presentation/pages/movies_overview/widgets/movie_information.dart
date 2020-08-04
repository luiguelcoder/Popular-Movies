import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/movie.dart';

class MovieInformation extends StatelessWidget {
  final Movie movie;

  MovieInformation({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Text(
            movie.title,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            DateFormat.yMMMMd().format(movie.releaseDate).toString(),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              voteDetail(
                context: context,
                vote: movie.popularity.toString(),
                description: "Popularity",
              ),
              voteDetail(
                  context: context,
                  vote: "${movie.voteAverage.toString()} %",
                  description: "User Score")
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 45,
            width: 150,
            child: OutlineButton(
              onPressed: () {},
              child: Text("See Details"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget voteDetail({
    BuildContext context,
    String vote,
    String description,
  }) {
    return Column(
      children: <Widget>[
        Text(
          vote,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
