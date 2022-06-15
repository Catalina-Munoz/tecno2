/*Ana Paez
 Catalina Muñoz
 Samuel 
 Comision Lisandro
 */
 
 //para que se mueva si hay sonido
 boolean haySonido = false;
 boolean terminoElSonido = false;
 boolean antesHabiaSonido = false;
 float UMBRAL_AMPLITUD = 55;
 
//CONECTANDO LOS DOS SISTEMAS

import oscP5.*;  //1- importamos la libreria

OscP5 osc;       //2- declarar el objeto osc

//=============================
//  Variables calibración
float minimoAmp = 30;  //MIN_AMP
float maximoAmp = 95;   //MAX_AMP

float minimoPitch = 56;    //MIN_PITCH
float maximoPitch = 80;    //MAX_PITCH

float f = 0.9;

boolean monitor = true;
//=============================

GestorSenial gestorAmp;
GestorSenial gestorPitch;

float amp = 0.0;
float pitch = 0.0;



cuadro c;
Linea l;
void setup() {
  size(800, 800);
  
  gestorAmp = new GestorSenial ( minimoAmp, maximoAmp, f);
gestorPitch = new GestorSenial ( minimoPitch, maximoPitch, f);  

//3- inicializar el objeto osc
osc = new OscP5(this, 12345);
//this = modo de comunicar la libreria externa de osc con  entorno de processing
//segundo dato (12345) es el puerto de entrada del software
  
  c= new cuadro();
  l= new Linea();
}

void draw() {
  background(#985A20);
  //===============================
  //en cada fotograma hay que actualizar
  gestorAmp.actualizar( amp );
  gestorPitch.actualizar( pitch );

  
  if(monitor){
  gestorAmp.imprimir( 150, 150 );
  gestorPitch.imprimir( 150, 350, 500, 100, false, true);
  }
   antesHabiaSonido = haySonido;
  //=================================
  
  //==================== Dibujamos un circulo que se va a mover con parametros
  //float tam =40;
  //float posX = width/2 + 50;
  //float posY = map (gestorAmp.filtradoNorm (), 0, 1, height-40/2, 0);
  //fill (0,255,0);
  //ellipse (posX, posY, tam, tam);
  //======================
  
  
  haySonido = amp > UMBRAL_AMPLITUD;
  terminoElSonido = antesHabiaSonido && !haySonido;
  c.dibujarCuadro();
  
  //se mueve si hay sonido
  if (haySonido) {
  c.moverCuadro();
  }
  if (terminoElSonido) {
    l.x=random(0, width);
    l.y=random(10, height);
    l.dibujarlinea(1200);
    }
  }



void oscEvent ( OscMessage m){
 
  if(m.addrPattern().equals("/amp")){
    amp = m.get(0).floatValue();
    println("amp:" + amp);
  }
  
  if(m.addrPattern().equals("/pitch")){
    pitch = m.get(0).floatValue();
    println("pitch:" + pitch);
  }
 
}
