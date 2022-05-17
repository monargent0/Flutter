// Class
main(){
  ThreeKingdoms threeKingdoms = ThreeKingdoms();
  print(threeKingdoms.name);
  threeKingdoms.sayName();

  ThreeKingdoms2 threeKingdoms2 = ThreeKingdoms2("유비", "촉");
  threeKingdoms2.saySomething();
} // main

class ThreeKingdoms{
  // Field
  String name = '유비';
  // Constructor

  // Method or Function
  sayName(){
    print("내 이름은 ${this.name} 입니다.");
  }
} // ThreeKongdoms

class ThreeKingdoms2{
  // Field
  late String name; // late = 이따가 데이터 줄게!
  String? nation; // null safety로 생성

  // Constructor
  ThreeKingdoms2(String name, String nation)
  : this.name = name,
    this.nation = nation;
  
  // Method
  saySomething(){
    print("제 이름은 ${this.name}이고 조국은 ${this.nation} 입니다.");
  }
}
