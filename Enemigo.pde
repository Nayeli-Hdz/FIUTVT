//Modulo Enemigo  
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 8 de noviembre de 2021 
//fecha de ultima modificación: 28 de noviembre de 2021 
//comentario:
class Enemigo{
  int atk;  //puntos de ataque
  int def;  //puntos de defensa
  int hp;   //puntos de vida actuales
  int hpp;  //puntos de vida máximo (puntos)
  int exp;  //experiencia que otorga
  int lvl;  //nivel del enemigo
  int cx;   //posición x en combate
  int cy;   //posicion y en combate
  int terr; //terreno que pisa
  int item; //objeto que da al ser vencido
  int cash; //cuanto dinero da al ser vencido
  PImage sprite;
  boolean alive;
  String sfxint;
  String sfxatk;
  String sfxded;
  String name;
  CoolDownTimer cdtturn;
  
  Enemigo(int t,DatosDados d){
    cx=200;
    cy=350;
    terr=t;
    ed.loadEnemyData(getEnemy(terr,d));
    cdtturn=new CoolDownTimer(ed.getCdt());
    atk=ed.getAtk();
    def=ed.getDef();
    hp=hpp=ed.getHpp();
    exp=ed.getExp();
    lvl=ed.getLvl();
    item=ed.getItem();
    cash=ed.getCash();
    sprite=ed.getSprite();
    name=ed.getEnemyName();
    alive=LIVE;
    sfxint=ed.getSfxInt();
    sfxatk=ed.getSfxAtk();
    sfxded=ed.getSfxDed();
  }
  
  void display(){
    if(gmode){  
      image(sprite,cx,cy);
      drawLifeBar(cx-cf.ss,cy+sprite.height/2+5);
      cdtturn.drawTimeBar(cx-cf.ss,cy+sprite.height/2+35);
    }
    else{
      switch(terr){
        case CLBSQ: setFillStroke(COLENBS);break;
        case CLPST: setFillStroke(COLENPS);break;
        case CLTRR: setFillStroke(COLENTR);break;
      }
      rect(cx,cy,cf.hs,cf.ss);
      drawLifeBar(cx-cf.ss,cy+45);
      cdtturn.drawTimeBar(cx-cf.ss,cy+75);
    }  
  }
  
  void activateCombat(){
    cdtturn.activate();
  }
  
  void drawLifeBar(int x,int y){
    rectMode(CORNER);
    setFillStroke(0);
    rect(x,y,160,28);
    setFillStroke(COLBLOOD);
    rect(x+2,y+2,int((hp*1.0/hpp)*156),24);
    rectMode(CENTER);
  }
  
  void herida(int d){
    hp-=hp-d>0?d:hp;
    alive=hp>0;
  }
  
  boolean isAlive(){
    return alive;
  }
  
  int getAtkDamage(){
    return atk*cf.eatkf;
  }
  
  int getDefDamage(){
    return def*cf.edeff;
  }
  
  int getEnemy(int t,DatosDados d){
    return t==CLTRR?d.tiraDado(pers):t==CLBSQ?4+d.tiraDado(pers):8+d.tiraDado(pers);
  }
  
  void playSfx(int s){
    switch(s){
      case ENFXINT:  playIntro(); break;
      case ENFXATK:  playAttack(); break;
      case ENFXDED:  playDeath();
    }
  }
  
  void playIntro(){
    if(sfxint.equals("bones")) sfxbones.trigger();
    if(sfxint.equals("bubbles")) sfxbbbls.trigger();
    if(sfxint.equals("growl female")) sfxgrwlf.trigger();
    if(sfxint.equals("growl monster")) sfxgmnst.trigger();
    if(sfxint.equals("imp")) sfximp.trigger();
    if(sfxint.equals("knight")) sfxknght.trigger();
    if(sfxint.equals("monster")) sfxmnstr.trigger();
    if(sfxint.equals("roar")) sfxroar.trigger();
    if(sfxint.equals("sandworm")) sfxsworm.trigger();
    if(sfxint.equals("snakehiss")) sfxshiss.trigger();
  }
  
  void playAttack(){
    if(sfxatk.equals("bite")) sfxbite.trigger();
    if(sfxatk.equals("hit")) sfxhit.trigger();
    if(sfxatk.equals("shield")) sfxshild.trigger();
    if(sfxatk.equals("sword")) sfxsword.trigger();
  }
  
  void playDeath(){
    if(sfxded.equals("death")) sfxdeath.trigger();
    if(sfxded.equals("grito")) sfxgrito.trigger();
    if(sfxded.equals("vanish")) sfxvnish.trigger();
  }
  
}
