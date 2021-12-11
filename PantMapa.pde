//Modulo PantMapa
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 11 de octubre de 2021
//fecha de ultima modificación: 28 de noviembre de 2021
//comentario:

class PantMapa{
  int mapa[][];
  int tile[][];
  char bord[][];
  int mx; 
  int my;
  PImage imgsky;
  PImage imgcloud;
  PImage imgblur;
  PImage imgtree3D;
  PImage imgcact3D;
  PImage imgflwr3D;
  SpriteSet ssfw;
  SpriteSet ssfp;
  SpriteSet ssfd;
  SpriteSet ssbw;
  SpriteSet ssbp;
  SpriteSet ssbd;
  SpriteSet ssba;
  
  
  ClickItem citpotn;
  ClickItem citfpot;
  int clouds[][];
  boolean blur;
  int xi;
  int yi;
  
  PantMapa(){
   mapa=ml.getMap();
    tile=ml.getTileMap();
    bord=ml.getBordMap();
    mx=ml.getCols()-10;
    my=ml.getRows()-10;
    imgsky=loadImage("sprite/sky.jpg");
    imgcloud=loadImage("sprite/cloud with shadow.png");
    imgblur=loadImage("sprite/backgr/blur.jpg");
    imgtree3D=loadImage("sprite/terreno/tree3D.png");
    imgcact3D=loadImage("sprite/terreno/cact3D.png");
    imgflwr3D=loadImage("sprite/terreno/flwr3D.png");
    ssfw=new SpriteSet("sprite/terreno/flora/woods/","tree3D",".png",5,0,false,0);
    ssfp=new SpriteSet("sprite/terreno/flora/prairie/","flwr3D",".png",8,0,false,0);
    ssfd=new SpriteSet("sprite/terreno/flora/desert/","cact3D",".png",4,0,false,0);
    ssbw=new SpriteSet("sprite/terreno/bords/woods/","bosque",".png",46,0,false,0);
    ssbp=new SpriteSet("sprite/terreno/bords/prairie/","prairie",".png",46,0,false,0);
    ssbd=new SpriteSet("sprite/terreno/bords/desert/","desert",".png",46,0,false,0);
    ssba=new SpriteSet("sprite/terreno/bords/water/","agua",".png",46,0,false,0);
    
    
    citpotn=new ClickItem(590,740,cf.sp,cf.sp,ITPTN);
    citfpot=new ClickItem(670,740,cf.sp,cf.sp,ITFPT);
    citpotn.toggleActive();
    citfpot.toggleActive();
    blur=false;
    clouds=new int[5][3];
    for(int i=0;i<5;i++){
      clouds[i][0]=-160-int(random(1,300));
      clouds[i][1]=int(random(40,700));
      clouds[i][2]=int(random(2,5));
    }
  }
  
  void display(){
    music();
    background(0);
    fill(255);
    textAlign(CENTER,CENTER);
    text(lf.showString(14),400,100);
    rectMode(CENTER);
    imageMode(CENTER);
    xi=(pers.px<=4)?0:(pers.px<ml.getCols()-5)?pers.px-5:mx;
    yi=(pers.py<=4)?0:(pers.py<ml.getRows()-5)?pers.py-5:my;
    displayPlanoMapa();
    displayPlanoPers();
    displayPlanoSky();
    displayPlanoHUD();
  }
  
  void displayPlanoMapa(){
    for(int i=0;i<10;i++)
      for(int j=0;j<10;j++)
        if(gmode){
          if(mapa[yi+j][xi+i]==CLTND)
            image(terreno[mapa[yi+j][xi+i]],cf.hs+i*cf.ss,cf.hs+j*cf.ss);
          else  
            image(getBord(mapa[yi+j][xi+i],ml.getBordIndex(bord[yi+j][xi+i])),cf.hs+i*cf.ss,cf.hs+j*cf.ss); 
        }  
        else{
          setFillStroke(paleta[mapa[yi+j][xi+i]]);
          rect(cf.hs+i*cf.ss,cf.hs+j*cf.ss,cf.ss,cf.ss);
        }
  }
  
  PImage getBord(int t, int b){
    PImage i=null;
    switch(t){
            case CLBSQ: i=ssbw.getSprite(b); break;
            case CLPST: i=ssbp.getSprite(b); break;
            case CLAWA: i=ssba.getSprite(b); break;
            case CLTRR: i=ssbd.getSprite(b); break;
            //case CLPNT: i=ssbb.getSprite(b); break;
            //case CLKSA: i=ssbc.getSprite(b); ;
          }
    return i;
  }
  
  void displayPlanoPers(){
    efecto3D(PRE);
    pers.display();
    efecto3D(POST);
  }
  void efecto3D(boolean e){
    int ir=pers.yr*10+pers.xr;
    int xl;
    int yl;
    int p=(e?0:ir+1);
    if(gmode)
      while(p<(e?ir:100)){
        xl=p%10;
        yl=p/10;
        if(mapa[yi+yl][xi+xl]!=CLAWA && mapa[yi+yl][xi+xl]!=CLTND){
          switch(mapa[yi+yl][xi+xl]){
            case CLBSQ: image(ssfw.getSprite(tile[yi+yl][xi+xl]),cf.hs+xl*cf.ss,cf.hs+yl*cf.ss); break;
            case CLPST: image(ssfp.getSprite(tile[yi+yl][xi+xl]),cf.hs+xl*cf.ss,cf.hs+yl*cf.ss); break;
            case CLTRR: image(ssfd.getSprite(tile[yi+yl][xi+xl]),cf.hs+xl*cf.ss,cf.hs+yl*cf.ss);
          }
        }
        p++;
      }
  }
  
  void displayPlanoSky(){
    if(gmode){
      tint(255,64);
      image(imgsky,400,400);
      noTint();
      displayClouds();
    }  
  }
  
  void displayPlanoHUD(){
    image(imgcash,50,740);
    image(imgatk,130,740);
    image(imgdef,210,740);
    image(imghpm,290,740);
    citpotn.display();
    citfpot.display();
    image(imgtonic,660,740);
    image(imgalldef,710,740);
    fill(255);
    text("$"+pers.cash,50,780);
    text(pers.atk,130,780);
    text(pers.def,210,780);
    text(pers.potn,560,780);
    text(pers.fpot,610,780);
    text(pers.tonic,660,780);
    text(pers.alldef,710,780);
    textAlign(LEFT,CENTER);
    text(pers.hp+"/"+pers.hpp,315,740);
    text("XP:"+pers.exp,440,740);
    text("LVL:"+pers.lvl,440,780);
    pers.drawLifeBar(265,768);
    textAlign(CENTER,CENTER);
  }
  
  void displayClouds(){
    for(int i=0;i<3;i++){
      image(imgcloud,clouds[i][0],clouds[i][1]);
      clouds[i][0]+=clouds[i][2];
      if(clouds[i][0]>900){
        clouds[i][0]=-160-int(random(1,300));
        clouds[i][1]=int(random(40,700));
        clouds[i][2]=int(random(2,5));
      }
    }
  }
  
  void mouseProcess(int x,int y,int b){
    if(citpotn.isClicked(x,y) && b==LEFT)
      drinkItem(ITPTN);
    if(citfpot.isClicked(x,y) && b==LEFT)
      drinkItem(ITFPT);
  }
  
  void keyProcess(char k){
    switch(k){
      case 'e':
      case 'E': drinkItem(ITPTN);
                break;
      case 'r':
      case 'R': drinkItem(ITFPT);
                break;          
      case 'g':
      case 'G': gmode=!gmode;
                break;
      case 'w':
      case 'W': if(revisaRestringido(pers,UP))
                  move(UP);
                break;
      case 'a':
      case 'A': if(revisaRestringido(pers,LEFT))
                  move(LEFT);
                break;
      case 's':
      case 'S': if(revisaRestringido(pers,DOWN))
                  move(DOWN);
                break;
      case 'd':
      case 'D': if(revisaRestringido(pers,RIGHT))
                  move(RIGHT);
                break;
      case 'q':
      case 'Q': toggleBlur();
                tint(255,128);
                image(imgblur,400,400);
                noTint();
                gc.setPantAct(PNPAU);
                break;
      case ' ': if(mapa[pers.py][pers.px]==CLTND){
                  gc.musicManager(MSCOFF,false);
                  gc.setPantAct(PNTND);
                }  
    }
  } 
  
  void drinkItem(int i){
    if((i==ITPTN?pers.potn:pers.fpot)>0)
      pers.consumeItem((i==ITPTN?ITPTN:ITFPT));
      sfxdrink.trigger();
  }
  
  boolean revisaRestringido(Personaje p,int d){
    boolean r=false;
    switch(d){
      case UP:    r=mapa[p.py-1][p.px]!=CLAWA;
                  break;
      case DOWN:  r=mapa[p.py+1][p.px]!=CLAWA;
                  break;
      case LEFT:  r=mapa[p.py][p.px-1]!=CLAWA;
                  break;
      case RIGHT: r=mapa[p.py][p.px+1]!=CLAWA;
                  break;         
    }
    return r;
  }
  
  void move(int d){
    pers.move(d);
    pers.setTerrain(mapa[pers.py][pers.px]);
    if(generaCombate()){
      sfxfight.trigger();
      gc.musicManager(MSCOFF,false);
      gc.setPantAct(PNCBT);
    }  
  }
  
  boolean generaCombate(){
    boolean r=false;
    switch(pers.terr){
      case CLBSQ: r=random(1,100)<cf.bsqodd;
                  break;
      case CLPST: r=random(1,100)<cf.pstodd;
                  break;
      case CLTRR: r=random(1,100)<cf.trrodd;
                  break;            
    }
    return r;
  }
  
  void toggleBlur(){
    blur=!blur;
  }
}
