//Modulo ClickItem
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 27 de septiembre de 2021
//fecha de ultima modificación: 27 de noviembre de 2021
//comentario:

class ClickItem{
  int cx;
  int cy;
  int an;
  int al;
  int t;
  boolean active;
  boolean marked;
    
  ClickItem(int x,int y,int b, int a, int s){
    cx=x;
    cy=y;
    an=b;
    al=a;
    t=s;
    active=false;
    marked=false;
  }
  
  void display(){
    textAlign(CENTER,CENTER);
    if(active)
      image(getItemImage(t),cx,cy,an,al);
      if(marked){
        noFill();
        stroke(color(0,250,0));
        strokeWeight(6);
        rect(cx,cy,an,al);
        strokeWeight(1);
      }
  }
  
  PImage getItemImage(int i){
    PImage p=null;
    switch(i){
      case ITPTN: p=imgpotn; break;
      case ITFPT: p=imgfpot; break;
      case ITTNC: p=imgtonic; break;
      case ITATK: p=imgatk; break;
      case ITDEF: p=imgdef; break;
      case ITHPP: p=imghpm; break;
      case ITALLDEF: p=imgalldef;
    }
    return p;
  }
  
  void toggleActive(){
    active=!active;
  }
  
  void toggleMarked(){
    marked=!marked;
  }
  
  boolean isClicked(int x,int y){
    boolean r=active && ((x>=cx-(an/2))&&(x<=cx+(an/2))) && ((y>=cy-(al/2))&&(y<=cy+(al/2)));
    return r;    
  }
}
