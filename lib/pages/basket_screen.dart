import 'package:eat_meat/models/menu_item.dart';
import 'package:eat_meat/util/db_handler.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => BasketScreen(),
        settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    BasketScreen basketScreen = new BasketScreen();

    List<MenuItem> items = DbHandler.instance.getBasketItems();

    return Scaffold(
      appBar: AppBar(title: Text('Basket')),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                primary: Theme.of(context).primaryColorDark,
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/basket');
              },
              child: const Text('Go to Checkout'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Items',
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Theme.of(context).accentColor),
                ),
                TextButton(
                    onPressed: () {
                      DbHandler.instance.clearBasket();
                    },
                    child: Text(
                      'Clear',
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).accentColor),
                    )
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 230,
              margin: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '1x',
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).accentColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            items[index].name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Text(
                          '\$' + items[index].price.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: NetworkImage('https://cdn4.iconfinder.com/data/icons/flat-pro-database-set-3/32/table-512.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reserve a table in several clicks',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).accentColor),
                      ),
                      TextButton(
                          onPressed: () {

                          },
                          child: Text(
                            'Book',
                            style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).accentColor),
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal: ', style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).accentColor),),
                      Text('\$' + DbHandler.instance.getBasketSubTotal(), style: Theme.of(context).textTheme.headline6,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service (10%): ', style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).accentColor),),
                      Text('\$' + DbHandler.instance.getBasketService(), style: Theme.of(context).textTheme.headline6,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total: ', style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.deepOrange),),
                      Text('\$' + DbHandler.instance.getBasketTotal(), style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.deepOrange),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}