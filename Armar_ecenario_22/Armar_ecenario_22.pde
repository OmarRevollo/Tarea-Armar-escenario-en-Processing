PImage miImagen;

void setup() {
  size(800, 600); // Tamaño del lienzo
  miImagen = loadImage("data/fondoimg.jpg"); // Carga tu imagen
  miImagen.rezise(width,height);
  
}

void draw() {
  background(miImagen); // Establece la imagen como fondo
  // Resto de tu código aquí
}
