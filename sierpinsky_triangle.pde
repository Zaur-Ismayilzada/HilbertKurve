/*
Programmcode gehört vollständig mir. n steht für Anzahl von Iterationen(Wiederholung)
Man muss für n nur gerade Zahlen eingeben. Das steht auch auf Wikipedia.
Variabel len steht für den Abstand zwischen 2 Liniepunkte.
Je größer n ist, desto kleiner len ist.
Um durschnittliche Betrag von len zu finden, habe ich eine Gleichung von newtonischem 
Abkühlungsverfahren abgeleitet.
Nach dieser Regel len soll wie folgende: len <= 100 * e^(-0.6 * (n - 2))

In method getStr() erhalte ich String Kette nach n. Damit kann man ein Figur erzeugen.

Um  das bestimmen, ob man 60 Grad nach rechts oder 60 Grad links oder eine Geradelinie 
zeichen soll, habe ich letzte Lage von Punkte beobachtet.

Feld coords speichert x1, y1 in coords[0], coords[1]; x2, y2 in coords[2], coords[3] bzw.

Bitte ändern Sie nur Betrag von n also Zeile 20.
*/

int     n      = 6;
float   len    = (float)(100 * Math.pow(Math.E, -0.6 * (n - 2)));
float[] coords = {70, 570, 70 + len, 570};

void setup(){
size(800, 600);
stroke(0, 0, 255);
strokeWeight(2);
}
void draw(){
  String str = getStr(n);
  println(str);
  //println(len);
  
  draw_forward();
  
  for(int i = 0; i < str.length(); i++){
    if(str.charAt(i) == '-')
      turn_right();
    else if(str.charAt(i) == '+')
      turn_left();
    draw_forward();
  }
  noLoop();
  
}

public String getStr(int num){
  if(num == 0)
    return "A";
  String ans  = "A";
  String temp = "";
  
  while(num > 0){
    for(int i = 0; i < ans.length(); i++){
      if(ans.charAt(i) == 'A')
        temp += "B-A-B";
      else if(ans.charAt(i) == 'B')
        temp += "A+B+A";
      else
        temp += ans.charAt(i);
    }
    ans  = temp;
    temp = "";
    num--;
  }
  
  return ans;
}

public void turn_left(){
  
  //0, 2---1, 3
  if(coords[2] < coords[0] && coords[3] == coords[1])
  {swap(); coords[2] -= len * cos(PI / 3); coords[3] += len * sin(PI / 3);}
  else if(coords[2] < coords[0] && coords[3] > coords[1])
  {swap(); coords[2] += len * cos(PI / 3); coords[3] += len * sin(PI / 3);}
  else if(coords[2] > coords[0] && coords[3] > coords[1])
  {swap(); coords[2] += len;}
  else if(coords[2] > coords[0] && coords[3] == coords[1])
  {swap(); coords[2] += len * cos(PI / 3); coords[3] -= len * sin(PI / 3);}
  else if(coords[2] > coords[0] && coords[3] < coords[1])
  {swap(); coords[2] -= len * cos(PI / 3); coords[3] -= len * sin(PI / 3);}
  else if(coords[2] < coords[0] && coords[3] < coords[1])
  {swap(); coords[2] -= len;}
}
public void turn_right(){
  //0, 2---1, 3
  if(coords[2] > coords[0] && coords[3] == coords[1])
  {swap(); coords[2] += len * cos(PI / 3); coords[3] += len * sin(PI / 3);}
  else if(coords[2] > coords[0] && coords[3] > coords[1])
  {swap(); coords[2] -= len * cos(PI / 3); coords[3] += len * sin(PI / 3);}
  else if(coords[2] < coords[0] && coords[3] > coords[1])
  {swap(); coords[2] -= len;}
  else if(coords[2] < coords[0] && coords[3] == coords[1])
  {swap(); coords[2] -= len * cos(PI / 3); coords[3] -= len * sin(PI / 3);}
  else if(coords[2] < coords[0] && coords[3] < coords[1])
  {swap(); coords[2] += len * cos(PI / 3); coords[3] -= len * sin(PI / 3);}
  else if(coords[2] > coords[0] && coords[3] < coords[1])
  {swap(); coords[2] += len;}
}


public void draw_forward(){
  line(coords[0], coords[1], coords[2], coords[3]);
}
public void swap(){
  coords[0] = coords[2];
  coords[1] = coords[3];
}
