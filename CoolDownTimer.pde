//Modulo CoolDownTimer
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 15 de octubre de 2021
//fecha de ultima modificación: 27 de noviembre de 2021
//comentario:

class CoolDownTimer{
  int count;
  int cntlimit;
  float actime;
  float cotime;
  boolean active;
  boolean off;
  boolean pause;
  
  CoolDownTimer(int cl){
    count=0;
    cntlimit=cl;
    actime=0f;
    cotime=0f;
    active=false;
    off=false;
    pause=false;
  }
  
  void activate(){
    off=false;
    active=true;
    pause=false;
    actime=millis();
    cotime=0f;
    count=0;
  }
  
  void deactivate(){
    off=false;
    active=false;
    pause=false;
    actime=0f;
    count=0;
  }
  
  boolean isActive(){
    return active;
  }
  
  boolean isOff(){
    return off;
  }
  
  void setTime(int t){
    cntlimit=t;
    deactivate();
  }
  
  void coolingDown(){
    if(active && !pause){
      if(count<cntlimit)
        count++;
      else{
        active=false;
        count=0;
        off=true;
      }  
    }
  }
  
  void coolingDownM(){
    if(active){
      cotime=millis()-actime;
      if(cotime>=cntlimit){
        active=false;
        off=true;
        actime=0f;
      }
    }
  }
  
  int countLeft(){
    return cntlimit-count;
  } 
  
  float timeLeft(){
    return (cntlimit-count)*1.0/60;
  }
  
  void togglePause(){
    if(active)
      pause=!pause;
  }
  
  void drawTimeBar(int x,int y){
    rectMode(CORNER);
    setFillStroke(0);
    rect(x,y,160,28);
    setFillStroke(COLMKGRN);
    rect(x+2,y+2,int((count*1.0/cntlimit)*156),24);
    rectMode(CENTER);
  }
}
