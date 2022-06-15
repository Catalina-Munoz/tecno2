class Linea{
PImage imagen;
float x, y; 
Linea(){
x=random(0,width);
y=random(10, height);
imagen=loadImage("linea.png");

} 

  void dibujarlinea(float tam) {

image(imagen,x,y);
  }







}
