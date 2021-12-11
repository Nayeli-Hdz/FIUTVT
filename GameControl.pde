//Modulo GameControl 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 28 de noviembre de 2021
//comentario:

class GameControl{
  PantCarga pncrg;
  PantCombate pncbt;
  PantConfig pncfg;
  PantCreacion pncre;
  PantCreditos pncrd;
  PantFinJgo pnfin;
  PantIntro pnint;
  PantLvlUp pnlvl;
  PantMapa pnmap;
  PantPausa pnpau;
  PantTienda pntnd;
  int pantact;
  boolean musicon;
  
  GameControl(){
    pncrg=new PantCarga();
    pncbt=new PantCombate();
    pncfg=new PantConfig();
    pncre=new PantCreacion(cf);
    pncrd=new PantCreditos();
    pnfin=new PantFinJgo();
    pnint=new PantIntro();
    pnlvl=new PantLvlUp();
    pnmap=new PantMapa();
    pnpau=new PantPausa();
    pntnd=new PantTienda();
    pantact=PNCRG;
    musicon=MSCOFF;
  }
  
  void display(){
    switch(pantact){
      case PNCRG: pncrg.display();
                  break;
      case PNCBT: pncbt.display();
                  break;
      case PNCFG: pncfg.display();
                  break;
      case PNCRE: pncre.display();
                  break;
      case PNCRD: pncrd.display();
                  break;
      case PNFIN: pnfin.display();
                  break;
      case PNINT: pnint.display();
                  break; 
      case PNLVL: pnlvl.display();
                  break; 
      case PNMAP: pnmap.display();
                  break;
      case PNPAU: pnpau.display();
                  break;
      case PNTND: pntnd.display();
                  break;
    }
  }
  
  void sigPant(){
    pantact++;
    if(pantact==12)
      pantact=1;
  }
 
  void antPant(){
    pantact--;
    if(pantact==0)
      pantact=11;
  }
  
  void setPantAct(int p){
    pantact=p;
  }
  
  void mouseProcess(int x,int y, int b){
    switch(pantact){
      case PNCBT: pncbt.mouseProcess(x,y,b);
                  break;
      case PNCFG: pncfg.mouseProcess(x,y,b);
                  break;            
      case PNCRD: pncrd.mouseProcess(x,y,b);
                  break;  
      case PNCRE: pncre.mouseProcess(x,y,b);
                  break;
      case PNFIN: pnfin.mouseProcess(x,y,b);
                  break;            
      case PNINT: pnint.mouseProcess(x,y,b);
                  break;
      case PNLVL: pnlvl.mouseProcess(x,y,b);
                  break;            
      case PNMAP: pnmap.mouseProcess(x,y,b);
                  break;            
      case PNPAU: pnpau.mouseProcess(x,y,b);
                  break;
      case PNTND: pntnd.mouseProcess(x,y,b);
                  break;            
      default:    if(b==LEFT)
                    sigPant();
                  if(b==RIGHT)
                    antPant();
    }  
  }
  
  void keyProcess(char k){
    switch(pantact){
      case PNMAP: pnmap.keyProcess(k);
                  break;
      case PNTND: pntnd.keyProcess(k);
                  break;            
    }
  }
   
  void musicManager(boolean s,boolean v){
    musicon=s;
    playTrack((musicon?pantact:0),v);
  }
  
  void playTrack(int t,boolean v){
    if(t==PNCBT)msccombt.loop();else{msccombt.pause();msccombt.rewind();}
    if(t==PNCRD)msccreds.loop();else{msccreds.pause();msccreds.rewind();}
    if(t==PNCRE)msccrea.loop();else{msccrea.pause();msccrea.rewind();}
    if(t==PNFIN)
      if(v)
        mscvctry.loop();
      else
        mscdefet.loop();
    else{    
      mscvctry.pause();
      mscvctry.rewind();
      mscdefet.pause();
      mscdefet.rewind();
    } 
    if(t==PNINT)mscintro.loop();else{mscintro.pause();mscintro.rewind();}
    if(t==PNLVL)msclvlup.loop();else{msclvlup.pause();msclvlup.rewind();}
    if(t==PNMAP)mscmundo.loop();else{mscmundo.pause();mscmundo.rewind();}
    if(t==PNTND)mscstore.loop();else{mscstore.pause();mscstore.rewind();}
  }
  
  boolean getMusicStatus(){
    return musicon;
  }
  
}
