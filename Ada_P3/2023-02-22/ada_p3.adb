-- Gammal P3-uppgift, från 2023-02-22. Löst av augan049, August Andersson. 

with Ada.Text_IO;       use Ada.Text_IO; 
with Ada.Float_Text_IO; use Ada.Float_Text_IO; 

procedure Ada_P3 is 
   
   
   -- Ytterst post med L och K 
   -- Sedan Matris med integers och characters
   -- Sedan arrays med index False, True som innehåller characters
   
   
   type Array_Type is 
     array(Boolean range Boolean'Range) of Character; 
   
   type Matrix is 
     array(-9..-6, Character range 'i'..'l') of Array_Type; 
   
   type T_Type is 
      record 
	 L : Matrix; 
	 K : Float; 
      end record; 
   
   
   -- Get för innersta arrayen 
   procedure Get(Inside_Array : out Array_Type) is 
      
      Whitespace_Char : Character; 
      
   begin 
      
      for Boolean_Index in Boolean'Range loop
	 Get(Inside_Array(Boolean_Index)); 
	 Get(Whitespace_Char); 
      end loop; 
	 
      
   end Get; 
      
   -- Put för innersta arrayen 
   procedure Put(Inside_Array : in Array_Type) is 
      
      
   begin 
      
      for Boolean_Index in reverse Boolean'Range loop
	 Put(Inside_Array(Boolean_Index)); 
	 Put(' '); 
      end loop; 
      
   end Put; 
   
   -- Get för matrisen 
   procedure Get(L : out Matrix) is 
      
   begin 
      
      for Integer_Index in reverse -9..-6 loop 
	 for Character_Index in Character range 'i'..'l' loop 
	   Get(L(Integer_Index, Character_Index)); 
	 end loop; 
      end loop; 
      
   end Get; 
	
   -- Put för matrisen L 
   procedure Put(L : in Matrix) is 
      
   begin 
      
      for Integer_Index in reverse -9..-6 loop 
	 for Character_Index in Character range 'i'..'l' loop
	    Put(L(Integer_Index, Character_Index)); 
	 end loop; 
      end loop; 
      
   end Put; 
   
   
   -- Get för T_Type
   procedure  Get(T : out T_Type) is 
      
   begin 
      
      Get(T.L); 
      Get(T.K); 
      
   end Get; 
   
   -- Put för T_Type
   procedure Put(T : in T_Type) is 
      
   begin 
      
      Put(T.L); 
      Put(T.K. Fore => 0, Aft => 1, Exp => 0);
      
   end Put; 
   
  
  T_Variable : T_Type; 
     
begin 
   
   Ada.Text_IO.Put("Mata in datamängd: "); 
   Get(T_Variable); 
   Skip_Line; 
   
   Ada.Text_IO.Put("Inmatad datamängd: "); 
   Put(T_Variable); 
   
end Ada_P3; 

