/*
  - Generiere ein Raster aus gleichgroßen Formen
  - Ändere die Formen per Zufall (Kreis oder Quadrate)
  - Variiere die Größe der Formen (aber alle Formen sollen die gleiche Größe haben)
  - Ändere die Farbe einer Form pro Reihe (zufällig ausgewählt)
  - Und wähle hierfür zufällig eine Farbe aus einer vordefinierten Farbpalette
*/

int shapeSize = 20;
int updateRate = 100;

int num = 0;
int counter = 0;

color basicShapeCol = color(8, 103, 134);
color colors[];
color randCol;  


void setup(){
  size(600,600);
  
  grid();
  
  colors = new color[3];
  
  colors[0] = color(182, 222, 223);
  colors[1] = color(237, 104, 121);
  colors[2] = color(251, 188, 13);
  
}

void draw(){
  
  
  if(frameCount % updateRate == 0) {
    col();
    grid();
  }
  
}

void col(){
  
 // random color choice
 int randColIndex = (int)random(colors.length);
 randCol = colors[randColIndex];
 
}

void grid(){
  background(255);
    
  
  shapeSize = (int)random(20,60);
  
  num = width/shapeSize;       //Anzahl der Kästchen in einer Reihe
 
 
  if (random(1) > 0.5){
    
    //Rechteck-Raster
  
    for(int y = 0; y<height; y+= shapeSize){
      
      int randNum = (int)random(num);             //beliebiges Kästchen aus der Reihe
      
      for (int x = 0; x<width; x+= shapeSize){    // Reihe horizontal
         stroke(255);
         fill(basicShapeCol );
         if (randNum == counter){                 //wenn die Scheife beim zufällig ausgewähten Kästchen angekommen ist
           fill(randCol);                         //Farbe hier ändern
           //col();                               
         }
         rect(0+x,0+y,shapeSize,shapeSize);   
         counter +=1;  
      }
      counter = 0;
    }
    
  }
  else{
    noStroke();
    
    // Kreis-Raster
    
    for(int y = 0; y<height; y+= shapeSize){
  
      int randNum = (int)random(num);             //beliebiges Kästchen aus der Reihe
      
      for (int x = 0; x<width; x+= shapeSize){
         fill(basicShapeCol);
         
         if (randNum == counter){                 //wenn die Scheife beim zufällig ausgewähten Kästchen angekommen ist
           //col();                           
           fill(randCol);                         //Farbe hier ändern
         }
         ellipseMode(CORNER);
         ellipse(0+x,0+y, shapeSize, shapeSize); 
         counter +=1;
      }
      counter = 0;
    } 
    
  }
  
}

void mouseReleased(){
  saveFrame("data/line-######.png");
}
