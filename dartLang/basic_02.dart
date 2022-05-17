main() {
  List threeKingdoms = [];

  // 데이터 추가
  threeKingdoms.add("위");
  threeKingdoms.add("촉");
  threeKingdoms.add("오");
  // 출력
  print(threeKingdoms);
  print(threeKingdoms[0]);
  // 수정하기
  threeKingdoms[0] = "We";
  print(threeKingdoms);
  // 삭제하기
  threeKingdoms.removeAt(1);
  print(threeKingdoms);

  threeKingdoms.remove("We");
  print(threeKingdoms);
  // 리스트 길이
  print(threeKingdoms.length);
  // 추가
  threeKingdoms.add(1);
  print(threeKingdoms); // 제너릭 타입을 안주었기 때문에 숫자, 문자 모두 사용할 수 있다

  List<String> threeKingdoms2 = []; // CNN / RNN의 차이?
  //--------
  // Map : Key와 Value로 이루어진 Collection
  Map fruits = {
    'apple' : '사과', // key값에 List가 들어갈 수도 있다 . 그게 JSON이다
    'grape' : '포도',
    'watermelon' : '수박',
  };

  print(fruits['apple']);

  // 수정하기
  fruits['watermelon'] = '시원한 수박';
  fruits['banana'] = '바나나';
  print(fruits);

  Map<String, int> fruitPrice = {
    'apple' : 1000,
    'grape' : 2000,
    'watermelon' : 3000,
  } ;

  print(fruitPrice['apple']);
  int applePrice = fruitPrice['apple']!; // ! <-- null safety
  // 자바랑 다른점 1. 옵션화, (= Null safety!) , null을 수용할 수 있는지 없는지!?

  int numA = 10;
  int? numB = 100; // ! nnull 것을 함
  numB = null;
  
}