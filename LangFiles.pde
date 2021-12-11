//Modulo LangFiles
//elaborado por: Gutierrez Amador Mario ALberto
//fecha de creación: 27 de septiembre de 2021
//fecha de ultima modificación: 28 de septiembre de 2021
//comentario:

class LangFiles{
  String langs[][];
  String file[];
  int actlang;
  int ns;
  
  LangFiles(int l,int n){
    actlang=l;
    ns=n;
    langs=new String[ns][2];
    loadLang(LGSPA);
    loadLang(LGENG);
  }
  
  void loadLang(int i){
    int n;
    
    file=loadStrings((i==LGSPA)?"spa.lang":"eng.lang");    
    for(n=0;n<ns;n++)
      langs[n][i]=split(file[n],'=')[1];
  }
  
  void setLang(int l){
    actlang=l;
  }
  
  int getLang(){
    return actlang;
  }
  
  String showString(int i){
    return langs[i][actlang];
  }
}
