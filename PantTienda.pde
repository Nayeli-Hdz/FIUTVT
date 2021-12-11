//Modulo PantTienda
//elaborado por: Gutierrez Amador Mario Alberto
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 28 de noviembre de 2021
//comentario:

class PantTienda{
  Boton btncomp;
  Boton btnvend;
  Boton btncont;
  ClickItem citpotn;
  ClickItem citfpot;
  ClickItem cittonic;
  ClickItem citalldef;
  PImage tienda;
  PImage imgtrademode;
  boolean trademode;
  
  PantTienda(){
    btncomp=new Boton(200,600,200,100,24);
    btnvend=new Boton(600,600,200,100,25);
    btncont=new Boton(400,720,200,100,5);
    btncomp.activate();
    btnvend.activate();
    btncont.activate();
    citpotn=new ClickItem(300,270,cf.sp,cf.sp,ITPTN);
    citfpot=new ClickItem(400,270,cf.sp,cf.sp,ITFPT);
    cittonic=new ClickItem(500,270,cf.sp,cf.sp,ITTNC);
    citalldef=new ClickItem(600,270,cf.sp,cf.sp,ITALLDEF);
    citpotn.toggleActive();
    citfpot.toggleActive();
    cittonic.toggleActive();
    citalldef.toggleActive();
    tienda=loadImage("sprite/backgr/store_ok.png");
    imgtrademode=loadImage("sprite/items/trademode.png");
    trademode=TMBUY;
    btncomp.toggleMarked();
  }
  
  void display(){
    music();
    background(tienda);
    fill(255);
    text(lf.showString(16),400,100);
    citpotn.display();
    citfpot.display();
    cittonic.display();
    citalldef.display();
    btncomp.display();
    btnvend.display();
    btncont.display();
    pers.drawTradeData();
    if(trademode)
      flipYImage(imgtrademode,400,400);
    else
      image(imgtrademode,400,400);
    text("$"+(trademode?cf.potnv:cf.potnc),300,300);
    text("$"+(trademode?cf.fpotv:cf.fpotc),400,300);
    text("$"+(trademode?cf.tonicv:cf.tonicc),500,300);
    text("$"+(trademode?cf.alldefv:cf.alldefc),600,300);
  }
  
  void toggleTM(){
    trademode=!trademode;
    btncomp.toggleMarked();
    btnvend.toggleMarked();
  }
  
  void flipYImage(PImage i,int x,int y){
    pushMatrix();
    scale(1,-1);
    image(i,x,-y);
    popMatrix();
  }
  
  void mouseProcess(int x,int y,int b){
    if(btncomp.isClicked(x,y) && b==LEFT){
      btncomp.toggleMarked();
      btnvend.toggleMarked();
      trademode=TMBUY;
    }  
    if(btnvend.isClicked(x,y) && b==LEFT){
      btncomp.toggleMarked();
      btnvend.toggleMarked();
      trademode=TMSELL;  
    }  
    if(btncont.isClicked(x,y) && b==LEFT)
      exitStore(); 
    if(citpotn.isClicked(x,y) && b==LEFT)
      trade(ITPTN);
    if(citfpot.isClicked(x,y) && b==LEFT)
      trade(ITFPT);
    if(cittonic.isClicked(x,y) && b==LEFT)
      trade(ITTNC);
    if(citalldef.isClicked(x,y) && b==LEFT)
      trade(ITALLDEF);
  }
  
  void keyProcess(char k){
    switch(k){
      case '1':   //compra/venta de poción
                  trade(ITPTN);
                  break;
      case '2':   //compra/venta de poción llena
                  trade(ITFPT);
                  break;
      case '3':   //compra/venta de tónico
                  trade(ITTNC);
                  break;
      case '4':   //compra/venta de tónico
                  trade(ITALLDEF);
                  break;
      case ' ':   //cambio de modo de comercio
                  toggleTM();
                  break;
      case 'x':            
      case 'X': //salir de la pantalla
                  exitStore();
    }
  }
  
  void trade(int i){
    if(trademode)
      buyItem(i);
    else
      sellItem(i);
  }
  //Este método escribe datos en la bitácora
  void buyItem(int i){
    if(pers.cash>=getItemVCost(i)){
      pers.cash-=getItemVCost(i);
      pers.updateInv(i,trademode);
      bitacora.agregaDatosLn(generaDatosCompra(i));
      sfxcash.trigger();
    }
  }
  //Este método escribe datos en la bitácora
  void sellItem(int i){
    if(pers.getItemInv(i)>0){
      pers.cash+=getItemCCost(i);
      pers.updateInv(i,trademode);
      bitacora.agregaDatosLn(generaDatosVenta(i));
      sfxcash.trigger();
    }
  }
  
  int getItemVCost(int i){
    return (i==ITPTN?cf.potnv:(i==ITFPT?cf.fpotv:(i==ITTNC?cf.tonicv:cf.alldefv)));
  }
  
  int getItemCCost(int i){
    return (i==ITPTN?cf.potnc:(i==ITFPT?cf.fpotc:(i==ITTNC?cf.tonicc:cf.alldefc)));
  }
  
  void exitStore(){
    gc.musicManager(MSCOFF,false);
    gc.setPantAct(PNMAP);  
  }
  
  //estos son métodos para generar cadenas específicas de datos a grabar en la
  //bitácora.
  
  String generaDatosCompra(int i){
    String s="----------------------------------------------------------------\n";
    s="Se compro:"+indicaItem(i)+", saldo: "+pers.cash;
    return s;
  }
  
  String generaDatosVenta(int i){
    String s="----------------------------------------------------------------\n";
    s="Se vendio:"+indicaItem(i)+", saldo: "+pers.cash;
    return s;
  }
  
  String indicaItem(int i){
    return i==ITPTN?"Poción normal":i==ITFPT?"Poción llena":i==ITTNC?"Tonico de poder":"Poción de defensa";
    
  }
}
