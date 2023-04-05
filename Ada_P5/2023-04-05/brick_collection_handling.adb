--augan049
with Ada.Text_IO;         use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 

-- Felet var att jag tänkte att det var som mest 10 rader. 
-- Det är som mest 10 typer. Därför behöver man ha en loop-loop. 

package body Brick_Collection_Handling is
   
  
  -- Hjälpfunktion som returnerar sant om bitar av denna typ finns i vår samling. 
   function Brick_In_Collection(Brick_Collection : in Brick_Collection_Type;
				X, Y           : in Positive;
			        Colour           : in Character) return Integer is 
      
      Current_Brick : Single_Brick_Collection; 
      
      begin
	 
      for Brick in Brick_Collection'Range loop
	 Current_Brick := Brick_Collection(Brick); 
	 
	 if Current_Brick.Colour = Colour and ((Current_Brick.X = X and Current_Brick.Y = Y) or (Current_Brick.Y = X and Current_Brick.X = Y)) then 							      
	    return Brick;  
	 end if; 
      end loop; 
      
      return -1; 
      
     end Brick_In_Collection; 

  
   -- Funktion som returnerar sant om vi har de bitar som krävs för att bygga modellen, annars falskt  
   function Can_Build(Model, Available_Bricks : in Brick_Collection_Type) return Boolean is
      
      Index : Integer; 
      
   begin 
      
      for Brick in 1..10 loop
	  
	 if Model(Brick).X = 0 then 
	    exit;   
	 end if; 
	 
	 Index := Brick_In_Collection(Available_Bricks, Model(Brick).X, Model(Brick).Y, Model(Brick).Colour);
	 if  Index = -1 then  
	    return False;
	    
	 elsif Model(Brick).Amount_Of_This > Available_Bricks(Index).Amount_Of_This then 
	    
	    return False; 
	 end if; 
      end loop; 
      
      return True; 
	
   end Can_Build; 
   
   -- Procedur som fyller ut vår array med "tomma" bitar
   procedure Fill_Out(Brick_Collection : out Brick_Collection_Type;
		      Start_Index       : in Positive) is 
      
      No_Brick : Single_Brick_Collection; 
      
      begin 
	 
	 No_Brick.Colour := 'Q'; 
	 
	 for I in Start_Index..Brick_Collection'Last loop
	    Brick_Collection(I) := No_Brick; 
	 end loop; 
	 
      end Fill_Out; 
      
      -- Hjälpfunktion som ger första lediga plats i arrayen 
      function Next_Index(Brick_Collection : in Brick_Collection_Type) return Integer is 
	 
      begin 
	 
	 for I in Brick_Collection'Range loop
	    
	    if Brick_Collection(I).X = 0 then 
	       return I;
	    end if; 
	       
	 end loop; 
	 
	 return -1; 
	 
      end Next_Index; 
      
   -- Underprogram som läser in bitar från terminalen och sparar i en datastruktur
   procedure Get(Brick_Collection : out Brick_Collection_Type) is 
      
      Amount, Index, Ind   : Integer; 
      X, Y                 : Positive; 
      Char                 : Character; 
      Number_Of_Types      : Natural := 0; 
      
      
   begin 
      
      
      loop
	 
	 Get(Amount); 
	 
	 if Amount = - 1 then 
	    Fill_Out(Brick_Collection, Number_Of_Types + 1); 
	    exit; 
	 
	  -- Annars, hämta resterande data för biten 
	 else
	    Get(X); 
	    Get(Char); -- x
	    Get(Y); 
	    Get(Char); -- Whitespace
	    Get(Char); -- Colour
	    
	    -- Finns den i samlingen? 
	    Index := Brick_In_Collection(Brick_Collection, X, Y, Char); 
	    
	    -- Ny bit, lägg till i samlingen 
	    if Index = -1 then 
	       Ind := Next_Index(Brick_Collection); 
	       Brick_Collection(Ind).X := X; 
	       Brick_Collection(Ind).Y := Y; 
	       Brick_Collection(Ind).Colour := Char; 
	       Brick_Collection(Ind).Amount_Of_This := Amount; 
	       
	       Number_Of_Types := Number_Of_Types + 1; 
	       
	    -- Existerande bit, uppdatera amount 
	    else 
	       Brick_Collection(Index).Amount_Of_This := Brick_Collection(Index).Amount_Of_This + Amount;  
	       
	    end if;
	    
	 end if; 
	 
      end loop; 
	    
   end Get; 

end Brick_Collection_Handling; 
   

     
   
