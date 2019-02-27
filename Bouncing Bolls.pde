 
float friction = -0.085;
int  toplarSayisi=5;
toplar[] toplarim=new toplar[toplarSayisi];
void setup() {
  size(800, 650);
for(int i=0;i<toplarSayisi;i++){
  toplarim[i]=new toplar(random(width),random(height),60,i,toplarim);
}
 
  
}

void draw() {
  background(0);
  
   for(int i=0;i<toplarSayisi;i++){
     toplarim[i].carpis();
     toplarim[i].hareket();
     toplarim[i].display();
   }


 
}



class toplar{
float x;
float y;
float yaricapi;

float vx = 5;
float vy = 5;
toplar[] diger;

int ide;


toplar(float xx,float yy,float yari,int id,toplar[] tops){
 x=xx;
 y=yy;
 ide=id;
 yaricapi=yari;
 diger=tops;
}

void carpis(){
 for(int i=0;i<toplarSayisi;i++){
   float dx=diger[i].x-x;
   float dy=diger[i].y-y;
   float distance =sqrt(dx*dx+dy*dy);
   float kdistance=diger[i].yaricapi/2+yaricapi/2;
   
   
   if(distance<kdistance){
    float kordinat=atan2(dy,dx);
    float hedefX=x+cos(kordinat)*kdistance;
    float hedefY=y+sin(kordinat)*kdistance;
    float ax=(hedefX-diger[i].x);
    float ay=(hedefY-diger[i].y);
        vx -= ax;
        vy -= ay;
        diger[i].vx += ax;
        diger[i].vy += ay;
        
   } 
   
 }
}


void hareket() {
 
    x += vx;
    y += vy;
    if (x + yaricapi/2 > width) {
      x = width - yaricapi/2;
      vx *= friction;     
    }
    else if (x - yaricapi/2 < 0) {
      x = yaricapi/2;
      vx *= friction;
    }
    if (y + yaricapi/2 > height) {
      y = height - yaricapi/2;
      vy *= friction; 
    } 
    else if (y - yaricapi/2 < 0) {
      y = yaricapi/2;
      vy *= friction;
    }
  }
  
  void display() {
    ellipse(x, y, yaricapi, yaricapi);
  }


}