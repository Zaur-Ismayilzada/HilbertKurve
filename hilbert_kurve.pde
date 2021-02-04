/*
Programmcode gehört vollständig mir. n steht für Anzahl von Iterationen(Wiederholung)
Variabel len steht für den Abstand zwischen 2 Liniepunkte.
Wenn n >= 7 ist es schwer, ein ganzes Bild zu sehen. Deswegen man muss niedriger Wert
für len einsetzen.

In method getStr() erhalte ich String Kette nach n. Damit kann man ein Figur erzeugen.

Um das bestimmen, in welche Richtung  Linie gezeichnet werden soll, speichere ich letzte 
gedrehte Richtung in String Variabel dir.

mit turn_right und turn_left ändere ich Zeichungrichtung nach in dir gespeichertem Wert.

Feld coords speichert x1, y1 in coords[0], coords[1]; x2, y2 in coords[2], coords[3] bzw.

Bitte ändern Sie nur Betrag von n also Zeile 19.
*/

int   n   = 6;
float len = 7;
float[] coords = {0, 590, 0 + len, 590};

String dir = "right";


void setup(){
  size(800, 600);
  stroke(0, 0, 255);
  strokeWeight(2);    
}

void draw(){

  String str = getStr(n);
  println(str);
  
  for(int i = 0; i < str.length(); i++){
    
    if(str.charAt(i) == '+')
      turn_right();
    else if(str.charAt(i) == '-')
      turn_left();
    else if(str.charAt(i) == 'F')
      {setCoords(); line(coords[0], coords[1], coords[2], coords[3]);}
  }
  
  noLoop();
}

public String getStr(int n){
  
  if(n == 0)return "A";
  
  String ans  = "A";
  String temp = "";
  
  while(n > 0){
    
    for(int i = 0; i < ans.length(); i++){
      if(ans.charAt(i) == 'A')
        temp += "-BF+AFA+FB-";
      else if(ans.charAt(i) == 'B')
        temp += "+AF-BFB-FA+";
      else
        temp += ans.charAt(i);
    }
    
    ans  = temp;
    temp = "";
    
    n--;
  }
  
  
  return ans;  
}

public void turn_right(){
  
  if(dir.equals("right"))
    dir = "down";
  else if(dir.equals("down"))
    dir = "left";
  else if(dir.equals("left"))
    dir = "up";
  else if(dir.equals("up"))
    dir = "right";
}

public void turn_left(){

  if(dir.equals("right"))
    dir = "up";
  else if(dir.equals("up"))
    dir = "left";
  else if(dir.equals("left"))
    dir = "down";
  else if(dir.equals("down"))
    dir = "right";
}

public void setCoords(){

  if(dir.equals("right"))
    {swap(); coords[2] += sin(PI / 2) * len;}
  else if(dir.equals("left"))
    {swap(); coords[2] += -sin(PI / 2) * len;}
  else if(dir.equals("up"))
    {swap(); coords[3] += -sin(PI / 2) * len;}
  else if(dir.equals("down"))
    {swap(); coords[3] += sin(PI / 2)  * len;}
}

public void swap(){

  coords[0] = coords[2];
  coords[1] = coords[3];
}
