// 비동기처리 asynk ; A B C가 한번에 처리하는 것
// 동기 처리 synk : A > B > C 차근차근 처리하는것 (지금까지 배운 것)
main(){
  checkVersion();
  print('End process');

}

// 비동기 함수! await 로 기다리게 해서 순서를 정해준다 @ future / async / await 세트로 묶어서 사용 
Future checkVersion() async{
  var version = await lookupVersion();
  print(version);
}

int lookupVersion(){
  return 12;
}