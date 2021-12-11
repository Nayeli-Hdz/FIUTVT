//Modulo Boton
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 27 de septiembre de 2021
//fecha de ultima modificación: 27 de noviembre de 2021
//comentario:

class TxtBatalla{
  int cx;
  int cy;
  int an;
  int al;
  int t;
  boolean active; //true=visible false=invisible
  boolean marked;
  
  TxtBatalla(int x,int y,int b, int a, int s){
    cx=x;
    cy=y;
    an=b;
    al=a;
    t=s;
    active=false;
    marked=false;
  }
  
  void display(){
    if(active){
  switch(t){
      case 37:  fill(0,255,31);
                  break;
      case 38:  fill(64,247,255);
                  break;
      case 39: fill(255,86,8);
                  break;            
    }
      
      textAlign(CENTER,CENTER);
      text(lf.showString(t),cx,cy);
      if(marked){
        noFill();
        stroke(COLMKGRN);
        strokeWeight(10);
        rect(cx,cy,an,al);
        strokeWeight(1);
      }
    }
  }
  
  void activate(){
    active=true;  
  }
  
  void deactive(){
    active=false;
  }
  
  void toggle(){
    active=!active;
  }
  
  void toggleMarked(){
    marked=!marked;
  }
  
}
