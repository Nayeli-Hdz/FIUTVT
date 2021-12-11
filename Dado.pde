//Modulo Dado
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 26 de noviembre de 2021
//fecha de ultima modificación: 28 de noviembre de 2021
//comentario:

//ejemplo de uso de un dado complejo
/*
  Dado d;           //declaración
  
  //para instanciarlo se deben declarar los vectores con los valores,
  //en este ejemplo el dado tiene 6 caras, distribuidas así:
  //3 caras con valor 1. 1/2 de probabilidad.
  //2 caras con valor 2. 1/3 de probabilidad.
  //1 cara con valor  3.  1/6 de probabilidad.
  int caras[]={3,2,1};  
  int valores[]={1,2,3};
  //y después se pasan los nombres de las variables al constructor
  d=new Dado(caras,valores);
  
  //para generar la tirada sería llamado así
  tirada=d.tiraDadoC();
  
  //el otro constructor permite crear dados "normales"con un número específico 
  //de caras y de forma directa valores distintos, pero consecutivos a partir de 1
  d=new Dado(9);
  d=new Dado(12);
*/
class Dado{
  int nc;
  int t;
  int tc;
  int ca[];
  int va[];
  float pa[];
  int lov;
  int hiv;
  boolean issimple;
  boolean islocritics;
  boolean ishicritics;
  boolean islocriticc;
  boolean ishicriticc;
  
  Dado(int n){
    nc=n;
    issimple=true;
    islocritics=false;
    ishicritics=false;
  }
  
  Dado(int c[],int v[]){
    nc=0;
    ca=c;
    va=v;
    pa=new float[va.length];
    tc=0;
    lov=1000;
    hiv=0;
    for(int i=0;i<ca.length;i++){
      tc+=c[i];
      if(va[i]>hiv) hiv=va[i];
      if(va[i]<lov) lov=va[i];
    } 
    pa[0]=ca[0]*1.0/tc;
    for(int i=1;i<ca.length-1;i++)
      pa[i]=ca[i-1]+ca[i]*1.0/tc;
    issimple=false;
    islocriticc=false;
    ishicriticc=false;
  }
  
  int tiraDado(){
    return issimple?tiraDadoS():tiraDadoC();
  }
  
  int tiraDadoS(){
    t=int(random(1,nc+1));
    islocritics=(t==1);
    ishicritics=(t==nc);
    return t;
  }
  
  boolean isLoCriticS(){
    return islocritics;
  }
  
  boolean isHiCriticS(){
    return ishicritics;
  }
  
  int tiraDadoC(){
    float n=random(1);
    int v=0;
    int i=0;
    while(n<pa[i] && i<pa.length-1)
      i++;
    v=va[i];  
    islocriticc=v==lov;
    ishicriticc=v==hiv;
    return v;
  }
  
  boolean isLoCriticC(){
    return islocriticc;
  }
  
  boolean isHiCriticC(){
    return ishicriticc;
  }
  
  void printDado(){
    if(issimple)
      println("Dado simple de "+nc+" caras");
    else{
      println("Dado complejo");
      print("Caras:  ");
      imprimeVector(ca);
      print("Valores:");
      imprimeVector(va);
      println();
    }
  }
  
  void imprimeVector(int []v){
    print("{");
    for(int i=0;i<v.length;i++)
      print(v[i]+(i<v.length-1?",":""));
    println("}");
  }
}
