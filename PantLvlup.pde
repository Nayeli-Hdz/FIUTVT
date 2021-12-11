//Modulo PantLvlUp
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 28 de noviembre de 2021
//comentario:

class PantLvlUp{
  ClickItem citatk;
  ClickItem citdef;
  ClickItem cithpm;
  Boton btnnext;
  PImage imglvlup;
  boolean lvl;
  PantLvlUp(){
    citatk=new ClickItem(250,270,cf.sp*2,cf.sp*2,ITATK);
    citdef=new ClickItem(400,270,cf.sp*2,cf.sp*2,ITDEF);
    cithpm=new ClickItem(550,270,cf.sp*2,cf.sp*2,ITHPP);
    btnnext = new Boton(400,700,200,100,35);
    btnnext.activate();
    citatk.toggleActive();
    citdef.toggleActive();
    cithpm.toggleActive();
    imglvlup=loadImage("sprite/backgr/creation.jpg");
    lvl = true;
  }
  
  void display(){
    music();
    background(imglvlup);
    fill(255);
    text(lf.showString(13),400,100);
    citatk.display();
    citdef.display();
    cithpm.display();
    textAlign(CENTER,CENTER);

    if(lvl){
      text(pers.atk,250,335);
      text(pers.def,400,335);
      text(pers.hpm,550,335);
      pers.ssleft.display(400,550,200,100);
      println(lvl);
    }
    else{
      text(perst.atk,250,335);
      text(perst.def,400,335);
      text(perst.hpm,550,335);
      perst.ssleft.display(400,550,200,100);
      println(lvl);

    }
    
  }
  
  void mouseProcess(int x,int y, int b){
    if(citatk.isClicked(x,y) && b==LEFT){
      addAttr(ATATK);
      bitacora.agregaDatosLn("Ataque aumentado 1 punto, nivel: " + ATATK );
    }  
    if(citdef.isClicked(x,y) && b==LEFT){
      addAttr(ATDEF);
      bitacora.agregaDatosLn("Defensa aumentado 1 punto, nivel: " + ATDEF );
    }
    if(cithpm.isClicked(x,y) && b==LEFT){
      addAttr(ATHPM); 
      bitacora.agregaDatosLn("Salud aumentada 1 punto, nivel: " + ATHPM );
    }  
  }
  
  void addAttr(int a){
    
    if(lvl){

      pers.addAttr(a);
      togglePers();

    }
    else{

      perst.addAttr(a);
      togglePers();
      sfxheal.trigger();
      gameresult=pers.lvl==cf.lvlfin;
      gc.musicManager(MSCOFF,gameresult);
      gc.setPantAct(!gameresult?PNMAP:PNFIN);

    }
    
    //btnnext.display();
    /*sfxheal.trigger();
    gameresult=pers.lvl==cf.lvlfin;
    gc.musicManager(MSCOFF,gameresult);
    gc.setPantAct(!gameresult?PNMAP:PNFIN);
    lvl = false;*/

  }

  void togglePers(){

    lvl =! lvl;

  }

}
