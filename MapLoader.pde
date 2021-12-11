//Modulo MapLoader
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 24 de noviembre de 2021
//fecha de ultima modificación: 27 de noviembre de 2021
//comentario:
class MapLoader{
  String file[];
  int map[][];
  int tile[][];
  char bord[][];
  int r;
  int c;
  
  MapLoader(){
    file=loadStrings("worldmap.dat");
    r=int(split(file[0],'='))[1];
    c=int(split(file[1],'='))[1];
    map=new int[r][c];
    for(int i=0;i<r;i++)
      for(int j=0;j<c;j++)
        map[i][j]=(file[i+2].charAt(j))-'0';
    file=loadStrings("maptextures.dat");
    r=int(split(file[0],'='))[1];
    c=int(split(file[1],'='))[1];
    tile=new int[r][c];
    for(int i=0;i<r;i++)
      for(int j=0;j<c;j++)
        tile[i][j]=(file[i+2].charAt(j))-'0'; 
    file=loadStrings("mapborders.dat");
    r=int(split(file[0],'='))[1];
    c=int(split(file[1],'='))[1];
    bord=new char[r][c];
    for(int i=0;i<r;i++)
      for(int j=0;j<c;j++)
        bord[i][j]=(file[i+2].charAt(j));
  }
  
  int[][] getMap(){
    return map;
  }
  
  int[][] getTileMap(){
    return tile;
  }
  
  char[][] getBordMap(){
    return bord;
  }
  
  int getTile(int x,int y){
    return tile[y][x];
  }
  
  char getBord(int x,int y){
    return bord[y][x];
  }
  
  int getRows(){
    return r;
  }
  
  int getCols(){
    return c;
  }
  
  int getBordIndex(char c){
    int i=0;
    i=(isNumber(c))?c-'0':(isAlpha(c)?10+c-'A':36+c-'a');
    return i;
  }
  
  boolean isNumber(char c){
    return c>='0' && c<='9';
  }
  
  boolean isAlpha(char c){
    return c>='A' && c<='Z';
  }
  
  int getSymbol(char c){
    int i=0;
    switch(c){
      case '+': i=37; break;
      case '-': i=38; break;
      case '#': i=39; break;
      case '$': i=40; break;
      case '%': i=41; break;
      case '&': i=42; break;
      case '(': i=43; break;
      case ')': i=44; break;
      case '=': i=45; 
    }
    return i;
  }
  
  void printMap(){
    for(int i=0;i<r;i++){
      for(int j=0;j<c;j++)
        print(map[i][j]);
      println();  
    }  
  }
  
  void printTileMap(){
    for(int i=0;i<r;i++){
      for(int j=0;j<c;j++)
        print(tile[i][j]);
      println();  
    }  
  }
  
  void printBordMap(){
    for(int i=0;i<r;i++){
      for(int j=0;j<c;j++)
        print(bord[i][j]);
      println();  
    }  
  }
}
