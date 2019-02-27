         
        float agirlik= -0.5;
        int  toplarSayisi=5;
        toplar[] toplarim=new toplar[toplarSayisi];
        void setup() {
          size(800, 650);
          int capi=60;
        for(int i=0;i<toplarSayisi;i++){
          if(i==1){
            capi=85;
          }
          else
           capi=60;
           
          toplarim[i]=new toplar(random(width),random(height),capi,i,toplarim);
        }
         
          
        }
        
        void draw() {
          background(0);
          
           for(int i=0;i<toplarSayisi;i++){
             
                 
                 toplarim[i].display();
                 toplarim[i].hareket();
                 if(i==0){ // eger birinci top ise
                   fill(#FFCC00); //yellow
                   toplarim[i].carpis(0);
                   
                 } 
                 else 
                   fill(#ffffff);
                   toplarim[i].carpis(i);
                  
                   
                   
                 /*
                 else if(i==1){ 
                   fill(#413bf7); //blue
                   toplarim[i].carpis();
                 }
                 
                 else if(i==2){ 
                   fill(#ed0018);  //red
                   toplarim[i].carpis();
                 }
                 else if(i==3){ 
                   fill(#217c3d);  //green
                   toplarim[i].carpis();
                 }
                 else if(i==4){ 
                   fill(#ffffff); //white
                   toplarim[i].carpis();
                 }
                 
                 */
               
           }
        
        
         
        }
        
        
        
        class toplar{
        float x;
        float y;
        float yaricapi;
        
        float speedX = 10;
        float speedY = 10;
        toplar[] diger;
        
        int ide;
        
        
        toplar(float xx,float yy,float yari,int id,toplar[] tops){
         x=xx;
         y=yy;
         ide=id;
         yaricapi=yari;
         diger=tops;
        }
        
        void carpis(int top){
         for(int i=0;i<toplarSayisi;i++){
           
               float dx=diger[i].x-x;
               float dy=diger[i].y-y;
               float distance =sqrt(dx*dx+dy*dy);
               float kdistance=diger[i].yaricapi/2+yaricapi/2;
               
               int hiz_artma=1;
               if(top==1){
                hiz_artma=2;
               }
               else
               {
                 hiz_artma=1;
               }
               if( distance<kdistance ){
                  float kordinat=atan2(dy,dx);
                  
                  float hedefX=x+cos(kordinat)*(kdistance*hiz_artma);
                  float hedefY=y+sin(kordinat)*(kdistance*hiz_artma);
                  
                  float ax=(hedefX-diger[i].x);
                  float ay=(hedefY-diger[i].y);
                      speedX -= ax;
                      speedY -= ay;
                      diger[i].speedX += ax;
                      diger[i].speedY += ay;
               } 
         }
        }
        
                      /* void carpis2(int d){
                       for(int i=d;i<toplarSayisi;i++){
                         
                             float dx=diger[i].x-x;
                             float dy=diger[i].y-y;
                             float distance =sqrt(dx*dx+dy*dy);
                             float kdistance=diger[i].yaricapi/2+yaricapi/2;
                             
                             
                             if( distance<kdistance ){
                                float kordinat=atan2(dy,dx);
                                
                                float hedefX=x+cos(kordinat)*(kdistance*2);
                                float hedefY=y+sin(kordinat)*(kdistance*2);
                                
                                float ax=(hedefX-diger[i].x);
                                float ay=(hedefY-diger[i].y);
                                    speedX -= ax;
                                    speedY -= ay;
                                    diger[i].speedX += ax;
                                    diger[i].speedY += ay;
                                   
                                  
                             } 
                         
                       }
                      }
                      */
        
        
        void hareket() {
         
            x += speedX;
            y += speedY;
            
            if (x + yaricapi/2 > width) {
              x = width - yaricapi/2;
              speedX *= agirlik;     
            }
            else if (x - yaricapi/2 < 0) {
              x = yaricapi/2;
              speedX *= agirlik;
            }
            if (y + yaricapi/2 > height) {
              y = height - yaricapi/2;
              speedY *= agirlik; 
            } 
            else if (y - yaricapi/2 < 0) {
              y = yaricapi/2;
              speedY *= agirlik;
            }
          }
          
          void display() {
            ellipse(x, y, yaricapi, yaricapi);
          }
        
        
        }