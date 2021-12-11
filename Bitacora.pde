//Modulo Bitácora
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 24 de noviembre de 2021
//fecha de ultima modificación: 24 de noviembre de 2021
//comentario:
class Bitacora{
  PrintWriter output;
  
  Bitacora(){
    String s="data/testing/test ";
    s=s+agregaFechaHora();
    s=s+".log";
    output=createWriter(s);
  }
  
  String agregaFechaHora(){
    return ""+month()+"-"+day()+"-"+year()+" "+hour()+" con "+minute();
  }
  
  void agregaDatosLn(String s){
    output.println(s);
    output.flush();
  }
  
  void agregaDatos(String s){
    output.print(s);
    output.flush();
  }
  
  void cierraBitacora(){
    String s="fin de test ";
    s=s+agregaFechaHora();
    output.println(s);
    output.flush();
    output.close();
  }
}
