// 테스트를 위해 임시로 만든 클래스입니다
// 나의 코디, 저장한 코디, 나의 옷장 별로 저장된 코디는 리스트로 관리합니다
// 3개의 리스트를 관리하는 클래스입니다
// 그리드 작성버튼을 위해 마지막에 null이 필요함!

import 'package:lyc_flutter_project/model/coordi.dart';

class CoordiLists {
  static List<Coordi?> myCoordi = [
    Coordi('ex_myCoordi1', 'hi', 'hello', ['#클래식', '#모던시크'], 'hot'),
    Coordi('ex_myCoordi2', 'hi', 'hello', ['#클래식', '#모던시크'], 'hot'),
    Coordi('ex_myCoordi1', 'hi', 'hello', ['#클래식', '#모던시크'], 'hot'),
    Coordi('ex_myCoordi2', 'hi', 'hello', ['#클래식', '#모던시크'], 'hot'),
    null
  ];
  static List<Coordi?> userCoordi = [
    Coordi('ex_userCoordi1', 'hi', 'hello', ['#클래식', '#모던시크'], 'hot'),
    Coordi('ex_userCoordi2', 'hi', 'hello', ['#클래식', '#모던시크'], 'hot'),
    null
  ];
  static List<Coordi?> myCloset = [
    Coordi('ex_myCloset1', 'hi', 'hello', ['#클래식', '#모던시크'], 'hot'),
    Coordi('ex_myCloset2', 'hi', 'hello', ['#클래식', '#모던시크'], 'hot'),
    null
  ];
}