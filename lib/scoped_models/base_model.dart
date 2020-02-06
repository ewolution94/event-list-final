import 'package:basic_scrolllist/enums/view_states.dart';
import 'package:scoped_model/scoped_model.dart';

export 'package:basic_scrolllist/enums/view_states.dart';

class BaseModel extends Model {
  ViewState _state;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}