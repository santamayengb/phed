import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _photos = prefs.getStringList('ff_photos') ?? [];
    _photossingle = prefs.getString('ff_photossingle') ?? _photossingle;
    _location = _latLngFromString(prefs.getString('ff_location'));
  }

  SharedPreferences prefs;

  List<String> _photos = [];
  List<String> get photos => _photos;
  set photos(List<String> _value) {
    _photos = _value;
    prefs.setStringList('ff_photos', _value);
  }

  void addToPhotos(String _value) {
    _photos.add(_value);
    prefs.setStringList('ff_photos', _photos);
  }

  void removeFromPhotos(String _value) {
    _photos.remove(_value);
    prefs.setStringList('ff_photos', _photos);
  }

  String _photossingle;
  String get photossingle => _photossingle;
  set photossingle(String _value) {
    _photossingle = _value;
    prefs.setString('ff_photossingle', _value);
  }

  LatLng _location;
  LatLng get location => _location;
  set location(LatLng _value) {
    _location = _value;
    prefs.setString('ff_location', _value.serialize());
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
