/* Ball.pde 
* Description: All the features that your ball needs 
* to be able to enjoy a nice game of Pong!
* 
*/
public class Ball{ 
 
  private float posX; 
  private float posY; 
  private float velocityX;
  private float velocityY = 0;
  
  private float ballLength = width/60;
  //private float velocityY = 1;

  Ball(float posX,float posY, float velocity){
    this.posX = posX;
    this.posY = posY; 
    this.velocityX = velocity;
  } 

  
  float getX(){ 
    return posX; 
  }
  
  float getY(){ 
   return posY; 
  }
  
  void setX(float pX){ 
    posX = pX; 
  }
  
  void setY(float pY){ 
    posY = pY; 
  }
  
  float getVelocityX(){ 
    return velocityX;
  }
  
  float getVelocityY(){ 
    return velocityY;
  }
  
  void setVelocityX(float veloX){ 
    velocityX = veloX;
  }
  
  
  void setVelocityY(float veloY){ 
    velocityY = veloY;
  }
  
  void displayBall(){ 
     fill(255);
     rect(posX,posY,ballLength,ballLength); 
  } 
  
  /*  Below we use the update to detect collision to paddle*/
  void updateXPos(){ 
   posX = posX + velocityX;
   
   if(posX > width || posX < 0){
      velocityX = -velocityX; 
   } 
  } 
  
  void updateYPos(){ 
   posY = posY + velocityY;
   
   if(posY > height || posY < 0){
      velocityY = -velocityY; 
   } 
  } 
  

  
  
}
