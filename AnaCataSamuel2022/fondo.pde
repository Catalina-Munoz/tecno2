class Fondo{
  PImage fondo;
Fondo(){
fondo = loadImage ("fondo.jpg");
}
void dibujar() {
image(fondo,width/2,height/2);
}
}
