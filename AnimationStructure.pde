//Modulo AnimationStructure
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 26 de noviembre de 2021
//fecha de ultima modificación: 26 de noviembre de 2021
//comentario:
class AnimationStructure{
  ArrayList <SpriteSet> seqs;
  int activesprset;
  boolean activeanimation;
  
  AnimationStructure(){
    seqs=new ArrayList <SpriteSet>();
    activesprset=0;
    activeanimation=true;
  }
  
  void addSpriteSet(SpriteSet ss){
    seqs.add(ss);
  }
  
  void display(int x,int y,int w,int h){
    if(activeanimation && seqs.size()>0){
      seqs.get(activesprset).display(x,y,w,h);
    }
  }
  
  void setActiveSpriteSet(int n){
    activesprset=n;
  }
  
  void nextSpriteSet(){
    if(activesprset<seqs.size())
      activesprset++;
    else
      activesprset=0;
  }
  
  void prevSpriteSet(){
    if(activesprset>0)
      activesprset--;
    else
      activesprset=seqs.size();
  }
  
  void toggleActiveAnimation(){
    activeanimation=!activeanimation;
  }
}
