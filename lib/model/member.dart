class Member {
  String _id;
  String _name;
  String _tel;
  String _image;
  double _participationRate;
  bool _isActiveHealth;
  bool _isParticipation;
  bool _isActiveMap;
  bool _isActive;

  Member(
      this._id,
      this._name,
      this._tel,
      this._image,
      this._participationRate,
      this._isParticipation,
      this._isActive,
      this._isActiveHealth,
      this._isActiveMap);

  Member.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._tel = obj['tel'];
    this._image = obj['image'];
    this._participationRate = obj['participationRate'];
    this._isParticipation = obj['isParticipation'];
    this._isActiveHealth = obj['isActiveHealth'];
    this._isActiveMap = obj['isActiveMap'];
  }

  String get id => _id;
  String get name => _name;
  String get tel => _tel;
  String get image => _image;
  double get participationRate => _participationRate;
  bool get isActiveHealth => _isActiveHealth;
  bool get isParticipation => _isParticipation;
  bool get isActiveMap => _isActiveMap;
  bool get isActive => _isActive;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['tel'] = _tel;
    map['image'] = _image;
    map['participationRate'] = _participationRate;
    map['isParticipation'] = _isParticipation;
    map['isActiveHealth'] = _isActiveHealth;
    map['isActiveMap'] = _isActiveMap;
    map['isActive'] = _isActive;
    return map;
  }

  Member.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._tel = map['tel'];
    this._image = map['image'];
    this._participationRate = map['participationRate'];
    this._isActiveHealth = map['isActiveHealth'];
    this._isParticipation = map['isParticipation'];
    this._isActiveMap = map['isActiveMap'];
    this._isActive = map['isActive'];
  }
}
