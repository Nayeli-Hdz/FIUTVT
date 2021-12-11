//Modulo PantFinJgo 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 25 de noviembre de 2021
//comentario:

class PantFinJgo{  
  Boton btnback;
  PImage imgdefeat;
  PImage imgvictry;
  
  PantFinJgo(){
    btnback=new Boton(400,700,200,100,5);
    btnback.activate();
    imgdefeat=loadImage("sprite/backgr/graveyard.png");
    imgvictry=loadImage("sprite/backgr/throne.png");
  }
  
  void display(){
    music();
    background((gameresult?imgvictry:imgdefeat));
    fill(255);
    text(lf.showString(11),400,100);
    btnback.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(btnback.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF,false);
      gc.setPantAct(PNINT);
    }  
  }
}
