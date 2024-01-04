import 'package:flutter/material.dart';
import 'package:movies_app/details/cast_details.dart';
import 'package:movies_app/models/cast.dart';

class CastContainer extends StatelessWidget {
  final Cast cast;

  const CastContainer({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CastDetails(
                cast: cast,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: cast.profilePath != null && cast.profilePath!.isNotEmpty
                ? Image.network(
                    cast.profilePath!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  )
                : const Icon(
                    Icons.person), // Placeholder for null or empty profilePath
          ),
        ),
      ),
    );
  }
}
