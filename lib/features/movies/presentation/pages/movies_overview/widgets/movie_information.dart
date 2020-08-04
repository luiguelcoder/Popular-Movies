import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../localizations.dart';
import '../../../../domain/entities/movie.dart';

class MovieInformation extends StatelessWidget {
  final Movie movie;
  final Function callback;

  MovieInformation({@required this.movie, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: <Widget>[
          Text(
            movie.title,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
                description: AppLocalizations.of(context).popularityLabel,
              ),
              voteDetail(
                context: context,
                vote: "${movie.voteAverage.toString()} %",
                description: AppLocalizations.of(context).userScoreLabel,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 45,
            width: 150,
            child: OutlineButton(
              onPressed: callback,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(AppLocalizations.of(context).seeDetailsButton),
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
