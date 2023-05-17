class SmartArray<T>{

  late List<List<T>> _Collection;
  SmartArray(){
    _Collection = List.generate(1, (index) => <T>[]);
  }

  void SetIndex(int x, int y, T value){
    _Collection[x][y] = value;
  }

  T GetIndex(int x, int y){
    return _Collection[x][y];
  }

  bool ValidateIndex(int x, int y){
    //Check if we are in the bounds for x
    if(x > _Collection.length - 1)
      return false;
    var collection = _Collection[x];
    if(y > _Collection.length - 1)
      return false;

    return true;
  }

  void ExpandCollection(int x, int value){
    _Collection[x].length = value;
  }

}