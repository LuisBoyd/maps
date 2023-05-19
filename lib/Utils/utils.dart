import 'dart:convert';

bool OrdinalStringCheck(String a, String b)
{
  List<int> bytesA = utf8.encode(a);
  List<int> bytesB = utf8.encode(b);
  if(bytesA == bytesB)
    return true;
  return false;
}