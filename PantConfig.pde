//Modulo PantConfig
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 27 de noviembre de 2021
//comentario:

class PantConfig{
  Boton btnidio;
  Boton btnacep;
  Boton btnback;
  
  PantConfig(){
    btnidio=new Boton(550,250,200,100,3);
    btnacep=new Boton(250,500,200,100,4);
    btnback=new Boton(550,500,200,100,5);
    btnidio.activate();
    btnacep.activate();
    btnback.activate();
  }
  
  void display(){
    background(imgbackgr);
    fill(255);
    text(lf.showString(8),400,100);
    btnidio.display();
    btnacep.display();
    btnback.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(btnidio.isClicked(x,y) && b==LEFT){
      int newlang=(lf.getLang()==LGSPA)?LGENG:LGSPA;
      lf.setLang(newlang);
    }  
    if(btnacep.isClicked(x,y) && b==LEFT)
      cf.saveConfig(lf);  
    if(btnback.isClicked(x,y) && b==LEFT)
      gc.setPantAct(PNINT);  
  }
}
