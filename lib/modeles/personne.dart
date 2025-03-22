import 'dart:html';

class Personne {
  int _id;
  String _nom;
  String _metier;
  int _telephone;
  String _imagesProfil;
  Personne(
      this._id, this._nom, this._metier, this._telephone, this._imagesProfil);
  int get id => _id;
  set id(int value) {
    _id = value;
  }

  String get nom => _nom;
  set nom(String value) {
    _nom = value;
  }

  String get metier => _metier;
  set metier(String value) {
    _metier = value;
  }

  int get telephone => _telephone;
  set telephone(int value) {
    _telephone = value;
  }

  String get imageProfil => _imagesProfil;
  set imageProfil(String value) {
    _imagesProfil = value;
  }
}
