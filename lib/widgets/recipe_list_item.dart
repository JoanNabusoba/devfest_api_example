import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(
      {super.key,
      required this.title,
      required this.servings,
      required this.time,
      required this.onClick,
      required this.image});
  final String title, servings, time, image;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 16),
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.4), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //title section
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.food_bank,
                color: Colors.white,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                "$servings Servings",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(
                width: 6,
              ),
              const Icon(
                Icons.lock_clock,
                color: Colors.white,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                "$time mins",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ],
          ),
          //end of  title section
        ],
      ),
    );
  }
}
