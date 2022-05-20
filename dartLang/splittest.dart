main(){
  String displayCharacter = 'Hello';
  String character;
  List str = [];


  str = displayCharacter.split('');
  print(str);
  print(str[0]);
  character = str[0];
  character += str[1];
  print(character);

}