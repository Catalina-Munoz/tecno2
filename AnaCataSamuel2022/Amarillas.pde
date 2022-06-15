class FiguraAmarilla{
  
//Atributos
  PVector pos, vel;
  int radio;
  color tono;
  int maxImages = 3;
  int imageIndex = 0;
  PImage [] images = new PImage[maxImages];
  
  
 //Constructor
 FiguraAmarilla(PVector P_pos, int P_radio){
  pos = P_pos;
  radio = P_radio;
  vel = new PVector(random(-2,2), random(-2,2));
    
    for (int i =0; i < images.length; i++) {
  images[i] = loadImage("ama_" + i + ".png");
  }
  imageMode(CENTER);
  }
 
  void dibujar (){
   stroke(255);
    fill(255);
    ellipseMode(RADIUS);
    ellipse (pos.x, pos.y, radio, radio);
    
    image(images[imageIndex], pos.x, pos.y);
    println(frameCount,frameCount%60,frameCount%60==0);
    if(frameCount%5==0){
    imageIndex = (imageIndex+1)%images.length;
    }
  }
  
 void mover (boolean condicion ){
    pos.add(vel);
    
    if (pos.x < 0 || pos.x > width) {
      pos.x-= vel.x;
      vel.x *=-1;
    }
    if (pos.y < 0 || pos.y>height) {
      pos.y-= vel.y;
      vel.y*=-1;
    }
  }
  
  boolean ColisionoConOtro(FiguraAmarilla otro) {
  float sumaRadios = radio + otro.radio;
  float dist = dist(pos.x, pos.y, otro.pos.x, otro.pos.y);
  
  if (dist < sumaRadios +100){
    return true;
  } else {
    return false;
}
}
}
