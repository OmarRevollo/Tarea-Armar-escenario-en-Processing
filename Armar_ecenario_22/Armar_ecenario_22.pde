PImage miImagen;
PImage imagenCursor;
PImage jefeFinal;
PImage imagenDisparo; // Nueva imagen para los disparos
ArrayList<Disparo> disparos; // Lista de disparos
float imgX, imgY;

void setup() {
  size(1000, 800);
  miImagen = loadImage("data/fondoimg.jpg");
  miImagen.resize(width, height);
  
  imagenCursor = loadImage("data/nave.png");
  imagenCursor.resize(150, 100);
  
  jefeFinal = loadImage("data/94791.png");
  jefeFinal.resize(1000, 300);
  
  imagenDisparo = loadImage("data/disparo.png"); // Carga la imagen del disparo
  imagenDisparo.resize(100, 100); // Ajusta el tamaño del disparo
  
  imgX = width / 3;
  imgY = height / 3;
  
  disparos = new ArrayList<Disparo>(); // Inicializa la lista de disparos
}

void draw() {
  background(miImagen);
  imgX = mouseX;
  imgY = mouseY;
  
  image(imagenCursor, imgX, imgY);
  image(jefeFinal, width / 2 - jefeFinal.width / 2, -10);
  
  // Genera disparos aleatoriamente
  if (random(1) < 0.05) { // Ajusta la frecuencia de disparo
    Disparo nuevoDisparo = new Disparo(imgX, -10); // Inicializa el disparo arriba del jefe
    disparos.add(nuevoDisparo);
  }
  
  // Mueve y muestra los disparos
  for (int i = disparos.size() - 1; i >= 0; i--) {
    Disparo d = disparos.get(i);
    d.mover();
    d.mostrar();
    if (d.y > height) {
      disparos.remove(i); // Elimina los disparos fuera de la pantalla
    }
  }
}

class Disparo {
  float x, y;
  float velocidad = 4; // Velocidad hacia abajo
  
  Disparo(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void mover() {
    y += velocidad;
  }
  
  void mostrar() {
    image(imagenDisparo, x, y);
  }
}
