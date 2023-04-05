-- augan049
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 
with Ada.Text_IO;         use Ada.Text_IO; 
			   

package body Abacus_Handling is
   
   -- Procedur som läser datat för en abakus
   procedure Get(Abacus : out Abacus_Type) is 
      
      Current_Width : Natural; 
      
   begin
      
      for Row in Pair_Array'Range loop
	 
	 Current_Width := 0; 
	 
	 for I in 1..2 loop
	    Get(Abacus.Pairs(Row)(I)); 
	    Current_Width := Current_Width + Abacus.Pairs(Row)(I); 
	    
	 end loop; 
	 
	 if Current_Width > Abacus.Width then 
	    Abacus.Width := Current_Width; 
	 end if; 
	    
         
      end loop; 
      
   end Get; 
   
   -- Procedur som skriver ut abakusen 
   procedure Put(Abacus : in Abacus_Type) is 
      
      Spaces, Left, Right : Integer; 
      
   begin 
      
      for Row in Pair_Array'Range loop
	 
	 Left := Abacus.Pairs(Row)(1); 
	 Right := Abacus.Pairs(Row)(2); 
	 
	 Spaces := Abacus.Width - Left - Right; 
	 
	 Put("|"); 
	 
	 for I in 1..Left loop
	    Put("*"); 
	 end loop; 
	 
	 for Space in 1..Spaces loop
	    Put("-"); 
	 end loop; 
	 
	 for I in 1..Right loop 
	    Put("*"); 
	 end loop; 
	 
	 Put("|"); 
	 
	 if Row /= Pair_Array'Last then 
	    New_Line; 
	 end if; 
	 
      end loop; 
      
      
   end Put; 
   
   
end Abacus_Handling; 
