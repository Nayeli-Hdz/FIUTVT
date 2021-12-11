//Modulo PantIntro
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 26 de noviembre de 2021
//comentario:

class PantIntro{
  Boton btncred;
  Boton btnconf;
  Boton btnplay;
  Boton btnexit;
    
  PantIntro(){
    btncred=new Boton(400,250,200,100,0);
    btnconf=new Boton(400,400,200,100,1);
    btnplay=new Boton(400,550,200,100,2);
    btnexit=new Boton(400,700,200,100,23);
    btncred.activate();
    btnconf.activate();
    btnplay.activate();
    btnexit.activate();
  }
  
  void display(){
    music();
    background(imgbackgr);
    fill(255);
    text(lf.showString(12),400,100);
    btncred.display();
    btnconf.display();
    btnplay.display();
    btnexit.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(btncred.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF,false);
      gc.setPantAct(PNCRD);
    }  
    if(btnconf.isClicked(x,y) && b==LEFT)
      gc.setPantAct(PNCFG);
    if(btnplay.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF,false);
      gc.setPantAct(PNCRE);
    }  
    if(btnexit.isClicked(x,y) && b==LEFT){
      bitacora.cierraBitacora();
      exit();
    }  
  }
}
