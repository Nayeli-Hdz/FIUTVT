//Modulo PantCarga
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 28 de noviembre de 2021
//comentario:

class PantCarga{ 
  boolean loading;
  CoolDownTimer cdt;
  SpriteSet cristal;
  String message;
  
  PantCarga(){
    loading=true;
    cdt=new CoolDownTimer(120);
    cristal=new SpriteSet("sprite/cristal/","cristal",".png",5,10,true,0);
    message=lf.showString(26);
  }
  
  void display(){
    background(0);
    fill(255);
    imageMode(CENTER);
    cristal.display(400,350,cf.sp,cf.sp);
    textAlign(CENTER,CENTER);
    text(lf.showString(6),400,400);
    text(message,400,500);
    if(!loading && !cdt.isActive())
      cdt.activate();
    if(cdt.isActive())
      cdt.coolingDown();
    if(cdt.isOff())
      gc.setPantAct(PNINT);
  }
}
