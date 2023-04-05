with Ada.Text_IO;         use Ada.Text_IO; 
-- with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 

package body Map_Handling is 
   
   procedure Get(Map : out Map_Type) is 
      
   begin 
      
      for Y_Index in Map_Y_Range'Range loop -- behövs 'Range? 
	 for X_Index in Map_X_Range'Range loop
	    Get(Map(Y_Index, X_Index)); 
	    
	    if X_Index = 10 then
	       Skip_Line; 
	    end if; 
	   
	 end loop; 
      end loop; 
      
   end Get; 
   
   
   procedure Put(Map : in Map_Type) is 
      
   begin 
      
      for Y_Index in Map_Y_Range'Range loop
	 for X_Index in Map_X_Range'Range loop
	    
	    Put(Map(Y_Index, X_Index)); 
	    
	    if X_Index = 10 and Y_Index /= 10 then 
	       New_Line; 
	    end if; 
	    
	 end loop; 
     end loop; 
	    
      
   end Put; 
   
   
   function Extract_Largest_Area(Map : in Map_Type) return Map_Type is 
      
      Number_Of_Occurences :  array(Character range 'A'..'Z') of Natural; 
      Current_Letter : Character; 
      Highest_Number_Of_Occurences : Natural := 1; 
      Largest_Area_Map : Map_Type; 
      
      
   begin 
      
      -- Kan man lösa detta genom defaultvärde på något sätt?
      for Letter in Number_Of_Occurences'Range loop
	 Number_Of_Occurences(Letter) := 0; 
      end loop; 
      
      -- Först räkna hur många det är av varje bokstav, spara i hjälparray
      for Y_Index in Map_Y_Range'Range loop 
	 for X_Index in Map_X_Range'Range loop 
	    
	    Current_Letter := Map(Y_Index, X_Index); 
	    Number_Of_Occurences(Current_Letter) := Number_Of_Occurences(Current_Letter) + 1; 
	    
	 end loop; 
      end loop; 
      
      -- Se vad det högsta antalet var genom att loopa igenom hjälparrayen 
      for Letter in Character range Number_Of_Occurences'Range loop
	 if Number_Of_Occurences(Letter) > Highest_Number_Of_Occurences then 
	    Highest_Number_Of_Occurences := Number_Of_Occurences(Letter); 
	 end if; 
      end loop; 
      
      
     --  Put(Highest_Number_Of_Occurences); 
      
      -- Ändra sedan alla bokstäver förutom den vanligaste till punkter
      for Y_Index in Map_Y_Range'Range loop
	 for X_Index in Map_X_Range'Range loop
	    
	    Current_Letter := Map(Y_Index, X_Index); 
	    
	    if Number_Of_Occurences(Current_Letter) < Highest_Number_Of_Occurences then 
	       Largest_Area_Map(Y_Index, X_Index) := '.'; 
	       
	    else
	       Largest_Area_Map(Y_Index, X_Index) := Current_Letter; 
	    end if; 
	    
	 end loop; 
      end loop; 
      
      -- Returnera map_typen 
      return Largest_Area_Map; 
      
      
   end Extract_Largest_Area; 
      
   
end Map_Handling; 
