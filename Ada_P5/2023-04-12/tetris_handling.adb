-- augan049 
with Ada.Text_IO; use Ada.Text_IO; 

package body Tetris_Handling is
   
   -- Get procedure for a Tetris Type
   procedure Get(Board : out Tetris_Type) is 
      
   begin 
      
      for Y in Board_Range loop
	 for X in Board_Range loop
	    
	    Get(Board(Y, X)); 	    
	 end loop;
	 Skip_Line; 
      end loop; 
      
   end Get; 
   
   -- Put procedure for a Tetris Type
   procedure Put(Board : in Tetris_Type) is
      
   begin 
      
      for Y in Board_Range loop
	 for X in Board_Range loop
	    Put(Board(Y, X)); 
	 end loop; 
	 
	 if Y /= Board_Range'Last then 
	    New_Line; 
	 end if; 
      end loop; 
      
   end Put; 
   
   -- Help function that calculates where the piece will hit something in a column
   function Column_Hit(Board  : in Tetris_Type; 
		       Column : in Integer) return Integer is 
      
   begin 
      
      -- Return the Y-coordinate where the first blocking piece is 
      for Y in 4..Board_Range'Last loop	 
	 if Board(Y, Column) /= '.' then 
	    return Y; 
	    
	 end if; 
      end loop; 
      
      return Board_Range'Last; 
	 
   end Column_Hit; 
      
   -- Procedure that places the given piece at the right place on the board.  
   procedure Place_Piece(Board  : out Tetris_Type; 
			 Column : in Integer) is 
      
      -- Variables for readability. Bottom_Y is the Y-coordinate where the piece will be placed. 
      Left_Column_Hit, Right_Column_Hit, Bottom_Y : Integer; 
      
   begin 
      
      -- Calculate the position where the piece will land.
      -- It will either hit with its left column first or its right column first. 
      Left_Column_Hit := Column_Hit(Board, Column); 
      Right_Column_Hit := Column_Hit(Board, Column + 1); 
      
      -- Left column restricts first
      if (Left_Column_Hit - Right_Column_Hit) < 3 then 
	 
	 -- Edge case when the column is empty 
	 if Left_Column_Hit = Board_Range'Last and (Board(Board_Range'Last, Column) = '.') then 
	    Bottom_Y := Left_Column_Hit; 
	 else 
	    Bottom_Y := Left_Column_Hit - 1; 
	 end if; 
	 
      -- Right column restricts first
      else 
	 Bottom_Y := Right_Column_Hit + 1;
      end if; 
      
      -- The piece's left column 
      for Y in (Bottom_Y - 2)..Bottom_Y loop
	 Board(Y, Column) := 'B'; 
      end loop;
      
      -- The piece's right column 
      Board(Bottom_Y - 2, Column + 1) := 'B'; 
         
   end Place_Piece; 
      
end Tetris_Handling; 
