//Modulo Boton
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 27 de septiembre de 2021
//fecha de ultima modificación: 27 de noviembre de 2021
//comentario:

class Boton{
  int cx;
  int cy;
  int an;
  int al;
  int t;
  boolean active; //true=visible false=invisible
  boolean marked;
  
  Boton(int x,int y,int b, int a, int s){
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
      rectMode(CENTER);
      setFillStroke(COLBTNFACE,COLBTNBRDR);
      rect(cx,cy,an,al);
      fill(255);
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
  
  boolean isClicked(int x,int y){
    boolean r=(active && (((x>=cx-(an/2))&&(x<=cx+(an/2))) && ((y>=cy-(al/2))&&(y<=cy+(al/2)))));
    if(r)
      sfxclick.trigger();
    return r;    
  } 
  
}
