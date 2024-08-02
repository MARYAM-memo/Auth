import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  int current = 0;
  Widget? widgets;
  changeCurrent(int index) {
    current = index;
    notifyListeners();
  }

/*   chngeWidgets({
    required Widget userWidget,
    required Widget buyerWidget,
    required Widget userandbuyer,
  }) {
    if (current == 0) {
      widgets = userWidget;
      notifyListeners();
      return widgets;
    }
    if (current == 1) {
      widgets = buyerWidget;
      notifyListeners();
      return widgets;
    } else {
      widgets = userandbuyer;
      notifyListeners();
      return widgets;
    }
  } */
}
