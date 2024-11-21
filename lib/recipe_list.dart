import 'package:devfest_api_example/widgets/recipe_list_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Browse Healthy Meals",
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[300],
            ),
            child: const Icon(
              Icons.favorite,
              size: 18,
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Nice dishes",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Stay healthy with woderful meal list below",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: http
                    .get(Uri.https("api.spoonacular.com", "/recipes/random", {
                  "limitLicense": "true",
                  "number": "10",
                  "apiKey": "1f9d617ba13041859ea773423b0e6291"
                })),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    var recipes = json.decode(snapshot.data!.body)["recipes"];
                    return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: recipes.length,
                            itemBuilder: (context, index) {
                              var recipe = recipes[index];
                              return RecipeListItem(
                                image: recipe["image"],
                                title: recipe["title"],
                                servings: recipe["servings"].toString(),
                                time: recipe["readyInMinutes"].toString(),
                                onClick: () {},
                              );
                            }));
                  } else {
                    return Container(child: Text("No items fetched"));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
