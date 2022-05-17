main(){
  // Function
  List<int> list1 = [1,3,5,7,9];
  int sum = 0;
  for( int i in list1){
    sum += i ;
  }
  print("합계 : $sum");
  
  List<int> list2 = [10,30,50,70,90];
  int sum2 = 0;
  for( int i in list2){
    sum2 += i ;
  }
  print("합계 : $sum2");
  // 위 코딩을 함수로 변환
//-----------------------
  // 변수 앞에 _ 쓰면 프라이빗, 안쓰면 퍼블릭 이다. _addlist / addlist

// ver 1 
  //List<int> list1 = [1,3,5,7,9];
  //List<int> list2 = [10,30,50,70,90];
  addlist(List list){
    int sum = 0;
    for( int i in list){
      sum += i ;
    }
    print("합계 : $sum");
  }

  addlist(list1);
  addlist(list2);

// ver 2
  int addlist2(List list){
    int sum = 0;
    for( int i in list){
      sum += i ;
    }
    return sum;
  }
  int result = addlist2(list1);
  print(result);

}