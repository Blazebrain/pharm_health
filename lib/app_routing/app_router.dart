import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../features/pharmacy/view/bag_view.dart';
import '../features/pharmacy/view/drug_details_view.dart';
import '../features/pharmacy/view/search_view.dart';
import '../features/pharmacy/view/store_view.dart';
import 'route_names.dart';

class AppRouter {
  ///Build a MaterialPageRoute with the provided [page] widget and return it.
  static Route _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);

  ///Build a CupetinoPageRoute with the provided [page] widget and return it.
  static Route _cupertinoPageRoute(Widget page) =>
      CupertinoPageRoute(builder: (_) => page);

  ///Check route name and return corresponding Route.
  ///Used for `OnGenerateRoute` in *main.dart*
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      //*! Pharmacy _______________________________________
      case storeViewRoute:
        return _materialPageRoute(StoreView());
        break;
      case drugDetailViewRoute:
        return _materialPageRoute(const DrugDetails());
        break;
      case bagViewRoute:
        return _materialPageRoute(BagView());
        break;
      case searchViewRoute:
        return _materialPageRoute(const SearchView());
        break;
      //* Bad route - Route not found page
      default:
        return _cupertinoPageRoute(
          Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error 404.'
                  'The route - ${settings.name} - you requested does not exist',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        );
    }
  }
}
