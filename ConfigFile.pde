//Modulo ConfigFile 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 28 de septiembre de 2021
//fecha de ultima modificación: 28 de noviembre de 2021
//comentario:

class ConfigFile{
  String file[];
  String save;
  int lang;
  int ns;
  int ppa;
  int minatr;
  int maxatr;
  int bsqodd;
  int pstodd;
  int trrodd;
  int cash;
  int potnv;
  int fpotv;
  int tonicv;
  int alldefv;
  int potnc;
  int fpotc;
  int tonicc;
  int alldefc;
  int cdtenemy;
  int cdtplayr;
  int heal;
  int patkf;
  int eatkf;
  int pdeff;
  int edeff;
  int explup;
  int expinc;
  int tonicd;
  int hp;
  int tonicb;
  int stx;
  int sty;
  int lvlini;
  int lvlfin;
  int lvlesy;
  int lvlmed;
  int ss;
  int hs;
  int sp;
  int alldefd;
  
  ConfigFile(){
    file=loadStrings("config.dat");
    loadConfig();
  }
  
  void loadConfig(){
    int i;
    
    for(i=0;i<file.length;i++){
      if(isData("language",i)) lang=loadData(i);
      if(isData("langstr",i))  ns=loadData(i);
      if(isData("ppa",i))      ppa=loadData(i);
      if(isData("minatr",i))   minatr=loadData(i);
      if(isData("maxatr",i))   maxatr=loadData(i); 
      if(isData("bsqodd",i))   bsqodd=loadData(i);
      if(isData("pstodd",i))   pstodd=loadData(i);
      if(isData("trrodd",i))   trrodd=loadData(i);
      if(isData("cash",i))     cash=loadData(i);
      if(isData("potnv",i))    potnv=loadData(i);
      if(isData("fpotv",i))    fpotv=loadData(i);
      if(isData("tonicv",i))   tonicv=loadData(i);
      if(isData("alldefv",i))   alldefv=loadData(i);
      if(isData("potnc",i))    potnc=loadData(i);
      if(isData("fpotc",i))    fpotc=loadData(i);
      if(isData("tonicc",i))   tonicc=loadData(i);
      if(isData("alldefc",i))   alldefc=loadData(i);
      if(isData("cdtenemy",i)) cdtenemy=loadData(i);
      if(isData("cdtplayr",i)) cdtplayr=loadData(i);
      if(isData("heal",i))     heal=loadData(i);
      if(isData("patkf",i))    patkf=loadData(i);
      if(isData("eatkf",i))    eatkf=loadData(i);
      if(isData("pdeff",i))    pdeff=loadData(i);
      if(isData("edeff",i))    edeff=loadData(i);
      if(isData("explup",i))   explup=loadData(i);
      if(isData("expinc",i))   expinc=loadData(i);
      if(isData("tonicd",i))   tonicd=loadData(i);
      if(isData("alldefd",i))   alldefd=loadData(i);
      if(isData("hp",i))       hp=loadData(i);
      if(isData("tonicb",i))   tonicb=loadData(i);
      if(isData("startx",i))   stx=loadData(i);
      if(isData("starty",i))   sty=loadData(i);
      if(isData("lvlini",i))   lvlini=loadData(i);
      if(isData("lvlfin",i))   lvlfin=loadData(i);
      if(isData("lvlesy",i))   lvlesy=loadData(i);
      if(isData("lvlmed",i))   lvlmed=loadData(i);
      if(isData("ss",i))       ss=loadData(i);
      if(isData("hs",i))       hs=loadData(i);
      if(isData("sp",i))       sp=loadData(i);
    }
  }
  
  boolean isData(String s, int i){
    return (split(file[i],'=')[0].equals("#"+s));
  }
  
  int loadData(int i){
    return (int(split(file[i],'=')[1]));
  }
  
  void saveConfig(LangFiles lf){
    lang=lf.getLang();
    save="";
    addSave("language",lang);
    addSave("langstr",ns);
    addSave("ppa",ppa);
    addSave("minatr",minatr);
    addSave("maxatr",maxatr);
    addSave("bsqodd",bsqodd);
    addSave("pstodd",pstodd);
    addSave("trrodd",trrodd);
    addSave("cash",cash);
    addSave("potnv",potnv);
    addSave("fpotv",fpotv);
    addSave("tonicv",tonicv);
    addSave("potnc",potnc);
    addSave("fpotc",fpotc);
    addSave("tonicc",tonicc);
    addSave("cdtenemy",cdtenemy);
    addSave("cdtplayr",cdtplayr);
    addSave("heal",heal);
    addSave("patkf",patkf);
    addSave("eatkf",eatkf);
    addSave("pdeff",pdeff);
    addSave("edeff",edeff);
    addSave("explup",explup);
    addSave("expinc",expinc);
    addSave("tonicd",tonicd);
    addSave("hp",hp);
    addSave("tonicb",tonicb);
    addSave("startx",stx);
    addSave("starty",sty);
    addSave("lvlini",lvlini);
    addSave("lvlfin",lvlfin);
    addSave("lvlesy",lvlesy);
    addSave("lvlmed",lvlmed);
    addSave("ss",ss);
    addSave("hs",hs);
    addSave("sp",sp);
    file=split(save,';');
    saveStrings("data/config.dat",file);
  }
  
  void addSave(String s,int v){
    save=save+"#"+s+"="+v+";";
  }
}
