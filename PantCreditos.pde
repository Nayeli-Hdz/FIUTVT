//Modulo PantCreditos
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 27 de noviembre de 2021
//comentario:

class PantCreditos{ 
  boolean movieactive;
  Boton btnback;
  
  PantCreditos(){
    movieactive=false;
    btnback=new Boton(680,730,200,100,5);
    btnback.activate();
  }
  
  void display(){
    if(!movieactive){
      movieactive=true;
    }
    //music();
    background(0);
    btnback.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(btnback.isClicked(x,y) && b==LEFT){
      movieactive=false;
      gc.musicManager(MSCOFF,false);
      gc.setPantAct(PNINT);
    } 
  }  
}
