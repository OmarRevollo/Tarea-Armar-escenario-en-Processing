PImage miImagen;
PImage imagenCursor;
PImage jefeFinal; // Nueva imagen para el jefe final
float imgX, imgY;

void setup() {
  size(1000, 800); // Tamaño del lienzo
  miImagen = loadImage("data/fondoimg.jpg"); // Carga tu imagen de fondo
  miImagen.resize(width, height); // Ajusta el tamaño de la imagen
  
  imagenCursor = loadImage("data/nave.png"); // Carga tu imagen que seguirá el cursor
  imagenCursor.resize(150, 100); // Ajusta el tamaño de la imagen del cursor
  
  jefeFinal = loadImage("data/94791.png"); // Carga la imagen del jefe final
  jefeFinal.resize(1000, 300); // Ajusta el tamaño del jefe final
  
  imgX = width / 2; // Inicializa la posición de la imagen del cursor
  imgY = height / 2;
}

void draw() {
  background(miImagen); // Establece la imagen de fondo
  
  // Actualiza la posición de la imagen del cursor según el cursor del mouse
  imgX = mouseX;
  imgY = mouseY;
  
  // Dibuja la imagen del cursor en la posición actual
  image(imagenCursor, imgX, imgY);
  
  // Dibuja al jefe final en la parte superior
  image(jefeFinal, width / 2 - jefeFinal.width / 2, -10);
}
