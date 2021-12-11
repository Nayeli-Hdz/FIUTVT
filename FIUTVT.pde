//Proyecto First Principal
//elaborado por: Mario Alberto Gutierrez Amador
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 28 de noviembre de 2021
//comentario: 
import ddf.minim.*;

final int PNCRG=1;    //Pantalla de Carga
final int PNCBT=2;    //Pantalla de Combate
final int PNCFG=3;    //Pantalla de Configuración
final int PNCRE=4;    //Pantalla de Creación
final int PNCRD=5;    //Pantalla de Créditos
final int PNFIN=6;    //Pantalla de Fin de Juego
final int PNINT=7;    //Pantalla de Intro
final int PNLVL=8;    //Pantalla de Subir Nivel
final int PNMAP=9;    //Pantalla de Mapa
final int PNPAU=10;   //Pantalla de Pausa
final int PNTND=11;   //Pantalla de Tienda
final int LGSPA=0;
final int LGENG=1;
final int ATATK=1;
final int ATDEF=2;
final int ATHPM=3;
final boolean ATUP=true;
final boolean ATDN=false;
final int CLAWA=0;
final int CLTRR=1;
final int CLBSQ=2;
final int CLPST=3;
final int CLTND=4;
final boolean MSCON=true;
final boolean MSCOFF=false;
final int ITPTN=0;
final int ITFPT=1;
final int ITTNC=2;
final int ITATK=3;
final int ITDEF=4;
final int ITHPP=5;
final int ITALLDEF=6;
final boolean TMBUY=true;
final boolean TMSELL=false;
final boolean BATTLEON=true;
final boolean BATTLEOFF=false;
final boolean ACTON=true;
final boolean ACTOFF=false;
final boolean TURNP=true;
final boolean TURNE=false;
final int ACATK=0;
final int ACDEF=1;
final int ACITM=3;
final int FBINTRO=0;
final int FBCOMBT=1;
final int FBEND=2;
final int FBEXIT=3;
final int FBESC=4;

final boolean LIVE=true;
final boolean DEAD=false;
final boolean RSVCT=true;
final boolean RSDFT=false;
final int ENFXINT=0;
final int ENFXATK=1;
final int ENFXDED=2;
final color COLBTNFACE=color(225,48,35);
final color COLBTNBRDR=color(234,239,34);
final color COLBLOOD=color(250,0,0);
final color COLMKGRN=color(0,250,0);
final color COLPERS=color(150,150,0);
final color COLENTR=color(170,0,0);
final color COLENBS=color(0,120,0);
final color COLENPS=color(0,200,0);
final int EASY=0;
final int MED=1;
final int HARD=2;
final boolean PRE=true;
final boolean POST=false;
//final boolean TEAMCW = true; //true aparece personaje y false no esta warrior
//final boolean TEAMCP = false; //true aparece personaje y false no esta paladin

color paleta[];
PImage terreno[];
PImage imgbackgr;
PImage imgatk;
PImage imgdef;
PImage imghpm;
PImage imgpotn;
PImage imgfpot;
PImage imgtonic;
PImage imgcash;
PImage imgalldef;
PImage imgicon;
boolean gmode;
boolean gameresult;

Minim minim;

AudioPlayer mscintro;
AudioPlayer msccrea;
AudioPlayer mscmundo;
AudioPlayer mscstore;
AudioPlayer msccombt;
AudioPlayer msccreds;
AudioPlayer mscdefet;
AudioPlayer mscfanfr;
AudioPlayer mscvctry;
AudioPlayer msclvlup;

AudioSample sfxfight;
AudioSample sfxclick;
AudioSample sfxcash; 
AudioSample sfxdrink;
AudioSample sfxbones;
AudioSample sfxdeath;
AudioSample sfxheal;
AudioSample sfxhit;
AudioSample sfximp;
AudioSample sfxsworm;
AudioSample sfxshild;
AudioSample sfxsword;
AudioSample sfxvnish;
AudioSample sfxknght;
AudioSample sfxshiss;
AudioSample sfxmnstr;
AudioSample sfxgmnst;
AudioSample sfxbbbls;
AudioSample sfxroar;
AudioSample sfxbite;
AudioSample sfxgrito;
AudioSample sfxgrwlf;
AudioSample sfxteamc;

GameControl gc;
PFont fbase;
LangFiles lf;
ConfigFile cf;
Personaje pers;
PersonajeTeam perst;
EnemyData ed;
TiraDados td;
DatosDados dcbt;
Bitacora bitacora;
MapLoader ml;

void setup(){
  size(800,800);
  frameRate(60);
  surface.setTitle("First Illusion UTVT");
  imgicon=new PImage();
  imgicon=loadImage("sprite/personaje/worldmove/left/left0.png");
  surface.setIcon(imgicon);
  createPal();
  createTerreno();
  gmode=true;
  fbase=createFont("Arial Black",24);
  imgbackgr=loadImage("sprite/backgr/backgr.png");
  imgatk=loadImage("sprite/icon/icon_atk.png");
  imgdef=loadImage("sprite/icon/icon_def.png");
  imghpm=loadImage("sprite/icon/icon_hpm.png");
  imgpotn=loadImage("sprite/items/potion.png");
  imgfpot=loadImage("sprite/items/full potion.png");
  imgtonic=loadImage("sprite/items/tonic.png");
  imgcash=loadImage("sprite/items/cash.png");
  imgalldef=loadImage("sprite/items/fullDef.png");
  textFont(fbase);
  bitacora=new Bitacora();
  cf=new ConfigFile();
  lf=new LangFiles(cf.lang,cf.ns);
  ed=new EnemyData();
  td=new TiraDados();
  ml=new MapLoader();
  dcbt=new DatosDados();
  gc=new GameControl();
  minim=new Minim(this);
    
  thread("loadAudio");
}

void draw(){
  gc.display();
}

void mouseReleased(){
  gc.mouseProcess(mouseX,mouseY,mouseButton);
}

void keyReleased(){
  gc.keyProcess(key);
}

  
void createPal(){
  paleta=new color[5];
  paleta[CLAWA]=color(164,218,247);
  paleta[CLTRR]=color(150,113, 75);
  paleta[CLBSQ]=color( 88,138, 87);
  paleta[CLPST]=color( 91,244,103);
  paleta[CLTND]=color(105, 37,231);
}

void createTerreno(){
  terreno=new PImage[5];
  terreno[CLAWA]=loadImage("sprite/terreno/agua_ok.png");
  terreno[CLTRR]=loadImage("sprite/terreno/tierra_ok.png");
  terreno[CLBSQ]=loadImage("sprite/terreno/bosque_ok.png");
  terreno[CLPST]=loadImage("sprite/terreno/pasto_ok.png");
  terreno[CLTND]=loadImage("sprite/terreno/tienda_ok.png");
}

void loadAudio(){
  gc.pncrg.message=lf.showString(27);
  //efectos de uso general
  sfxfight=minim.loadSample("sound/fx/enter battle.mp3",512);
  sfxclick=minim.loadSample("sound/fx/click.mp3",512);
  sfxcash=minim.loadSample("sound/fx/cash.mp3",512);
  sfxdrink=minim.loadSample("sound/fx/drink.mp3",512);
  sfxheal=minim.loadSample("sound/fx/heal.mp3",512);
  sfxteamc=minim.loadSample("sound/fx/change-team.mp3",512);
  sfxfight.setGain(0.15);
  sfxclick.setGain(0.15);
  sfxcash.setGain(0.15);
  sfxdrink.setGain(0.15);
  sfxheal.setGain(0.15);
  sfxteamc.setGain(0.15);
  //efectos de intro de enemigos
  sfxbones=minim.loadSample("sound/fx/intro/bones.mp3",512);
  sfximp=minim.loadSample("sound/fx/intro/imp.mp3",512);
  sfxsworm=minim.loadSample("sound/fx/intro/sandworm.mp3",512);
  sfxknght=minim.loadSample("sound/fx/intro/knight.mp3",512);
  sfxshiss=minim.loadSample("sound/fx/intro/snakehiss.mp3",512);
  sfxmnstr=minim.loadSample("sound/fx/intro/monster.mp3",512);
  sfxgmnst=minim.loadSample("sound/fx/intro/growl monster.mp3",512);
  sfxbbbls=minim.loadSample("sound/fx/intro/bubbles.mp3",512);
  sfxroar=minim.loadSample("sound/fx/intro/roar.mp3",512);
  sfxgrwlf=minim.loadSample("sound/fx/intro/growl female.mp3",512);
  sfxbones.setGain(0.15);
  sfximp.setGain(0.15);
  sfxsworm.setGain(0.15);
  sfxknght.setGain(0.15);
  sfxshiss.setGain(0.15);
  sfxmnstr.setGain(0.15);
  sfxgmnst.setGain(0.15);
  sfxbbbls.setGain(0.15);
  sfxroar.setGain(0.15);
  sfxgrwlf.setGain(0.15);
  //efectos de ataque de enemigos
  sfxbite=minim.loadSample("sound/fx/atk/bite.mp3",512);
  sfxhit=minim.loadSample("sound/fx/atk/hit.mp3",512);
  sfxshild=minim.loadSample("sound/fx/atk/shield.mp3",512);
  sfxsword=minim.loadSample("sound/fx/atk/sword.mp3",512);
  sfxbite.setGain(0.15);
  sfxhit.setGain(0.15);
  sfxshild.setGain(0.15);
  sfxsword.setGain(0.15);
  //efectos de muerte de enemigos
  sfxvnish=minim.loadSample("sound/fx/death/vanish.mp3",512);
  sfxdeath=minim.loadSample("sound/fx/death/death.mp3",512);
  sfxgrito=minim.loadSample("sound/fx/death/grito.mp3",512);
  sfxvnish.setGain(0.15);
  sfxdeath.setGain(0.15);
  sfxgrito.setGain(0.15);
  gc.pncrg.message=lf.showString(28);
  mscintro=minim.loadFile("sound/music/intro.mp3");
  msccrea=minim.loadFile("sound/music/creation.mp3");
  mscmundo=minim.loadFile("sound/music/mapa.mp3");
  mscstore=minim.loadFile("sound/music/store.mp3");
  msccombt=minim.loadFile("sound/music/rude-buster.mp3");
  msccreds=minim.loadFile("sound/music/credits.mp3");
  mscdefet=minim.loadFile("sound/music/defeat.mp3");
  mscfanfr=minim.loadFile("sound/music/fanfare.mp3");
  mscvctry=minim.loadFile("sound/music/victory.mp3");
  msclvlup=minim.loadFile("sound/music/levelup.mp3");
  mscintro.setGain(0.05);
  msccrea.setGain(0.05);
  mscmundo.setGain(0.05);
  mscstore.setGain(0.05);
  msccombt.setGain(0.05);
  msccreds.setGain(0.05);
  mscdefet.setGain(0.05);
  mscfanfr.setGain(0.05);
  mscvctry.setGain(0.05);
  msclvlup.setGain(0.05);
  gc.pncrg.message=lf.showString(29);
  gc.pncrg.loading=false;
}

void music(){
  if(!gc.getMusicStatus())
    gc.musicManager(MSCON,false);
}

void setFillStroke(color c){
  fill(c);
  stroke(c);
}

void setFillStroke(color f,color s){
  fill(f);
  stroke(s);
}
