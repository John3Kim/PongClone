/* ScoreTrack.pde
* Description:  Tracks the score of the game
* 
* 
*/

class ScoreTrack{
   private int[] score = new int[]{0,0}; 
   
   ScoreTrack(){ 
     
   }
   
   // Current Score
   int getScore(int playerNum){ 
       if(playerNum == 1 || playerNum == 2){ 
          return score[playerNum - 1]; 
       } 
       
       return 0;
   }
   
   // Set score only if player scores and increment by one only
   void setPoint(int playerNum){ 
       if(playerNum == 1 || playerNum == 2){ 
          score[playerNum - 1]++; 
       } 
   }
}
