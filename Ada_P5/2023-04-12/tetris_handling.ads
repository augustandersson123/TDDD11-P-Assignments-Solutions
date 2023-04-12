--augan049

package Tetris_Handling is 
     
   type Tetris_Type is private; 
   
   procedure Get(Board : out Tetris_Type); 
   
   procedure Put(Board : in Tetris_Type); 
   
   procedure Place_Piece(Board  : out Tetris_Type; 
   			 Column : in Integer); 
   
private 
   
   subtype Board_Range is 
     Positive range 1..10; 
   
   type Tetris_Type is 
     array(Board_Range, Board_Range) of Character; 
   
end Tetris_Handling;
