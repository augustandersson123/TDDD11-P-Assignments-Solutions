-- Löst av augan049, August Andersson

with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO; 


package body Route_Handling is
   
  
   
   procedure Get(Route_Info : out Route_Type) is 
      
   begin 
      
      for Stop_Place in Number_Of_Places loop
	 Get(Route_Info(Stop_Place).X); 
	 Get(Route_Info(Stop_Place).Y); 
	 Get(Route_Info(Stop_Place).Gifts); 
	 
	 Skip_Line; -- Kanske inte ska vara på sista... 
	 
      end loop; 
      
   end Get; 
   
   procedure Put_Workshop_Coordinates is 
      
   begin 
      
      Put("(  0  0)"); 
      
   end Put_Workshop_Coordinates; 
   
   
   procedure Put_Next_Stop(Next_Stop : in Stop) is 
      
   begin 
      
      Put("("); 
      Put(Next_Stop.X, Width => 3); 

      Put(Next_Stop.Y, Width => 3); 
      Put(")"); 
      
   end Put_Next_Stop; 
   
   procedure Print_Route(Route_Info : in Route_Type) is 
      
      Gifts_In_Bag : Natural := 50; 
      Recently_Restocked : Boolean := True; 
      
   begin 
      
      -- Loopar igenom varje plats
      for Stop_Place in Number_Of_Places loop
	 
	 loop
	 
	    -- Om vi nyss fyllde på var vi i verkstaden 
	    if Recently_Restocked then 
	       Put_Workshop_Coordinates; 
	       
	       -- Annars var vi på förra platsen 
	    else
	       Put_Next_Stop(Route_Info(Stop_Place - 1)); 
	    end if; 
	    
	    Put(" -> "); 
	    
	    -- Om vi har tillräckligt med paket för nästa stopp ska vi dit
	    if Gifts_In_Bag >= Route_Info(Stop_Place).Gifts then 
	       Put_Next_Stop(Route_Info(Stop_Place));
	       Put(" Delivering "); 
	       Put(Route_Info(Stop_Place).Gifts, Width => 0); 
	       Put(" gifts."); 
	       
	       Gifts_In_Bag := Gifts_In_Bag - Route_Info(Stop_Place).Gifts; 
	       Recently_Restocked := False; 
	       
	       exit; 
	       -- Annars ska vi till verkstaden 
	    else
	       
	       Put_Workshop_Coordinates; 
	       Gifts_In_Bag := 50; 
	       Put(" Restocking."); 
	       Recently_Restocked := True; 
	       New_Line; 
	       
	     
	    end if; 
	    
	 end loop; 
	 
	 New_Line; 
	 
	 if Stop_Place = Number_Of_Places'Last then
	    Put_Next_Stop(Route_Info(Stop_Place)); 
	    Put(" -> "); 
	    Put_Workshop_Coordinates; 
	    Put(" Done!"); 
	 end if; 
	 
	 
	 
      end loop; 
	
     
	 
   end Print_Route; 
   
end Route_Handling; 
