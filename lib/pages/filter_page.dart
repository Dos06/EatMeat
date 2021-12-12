import 'package:eat_meat/models/category.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  static const String routeName = '/filters';

  const FilterPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FilterPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Filter',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                  ),
            ),
            CategoryFilterWidget(categories: Category.categories),
          ],
        ),
      ),
    );
  }
}

class CategoryFilterWidget extends StatelessWidget {
  final List<Category> categories;

  const CategoryFilterWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categories[index].name,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 25,
                child: Checkbox(
                  value: false,
                  onChanged: (bool? newValue) {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
