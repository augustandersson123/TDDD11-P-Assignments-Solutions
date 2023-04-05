with Ada.Text_IO;         use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 
with Ada.Float_Text_IO;   use Ada.Float_Text_IO; 


procedure Ada_P2 is 
   
   
   -- Deluppgift 1, operator
   function "&"(Str : in String; 
		Num : in Integer) return Integer is
      
   begin 
      
      return Integer'Value(Str) + Num; 
      
      
   end "&";  
   
   -- Deluppgift 2, funktion 
   function Area(Str : in String) return Float is 
      
   begin 
      
      return Float'Value(Str) * Float'Value(Str); 
      
   end Area; 
   
   -- Deluppgift 3, procedure 
   procedure Mult(Char : in Character; 
		  F : out Float) is 
      
   begin 
      
      -- Närmaste heltal avrundat nedåt i flyttalsform
      F := Float'Floor(Float(Character'Pos(Char) - 48) * 32.7);
      
   end Mult; 
   
   
   
   Str : String(1..3); 
   Num : Integer; 
   F : Float; 
   Char : Character; 
   
begin 
   
   -- Deluppgift 1
   Put("Mata in en sträng: "); 
   Get(Str); 
   Put("Mata in ett heltal: "); 
   Get(Num); 
   Put("Den beräknade summan av "); 
   Put(Str); 
   Put(" och "); 
   Put(Num, Width => 0); 
   Put(" blir "); 
   Put(Str & Num, Width => 0); 
   
   New_Line(2); 
   
   -- Deluppgift 2
   Put("Mata in längden: "); 
   Get(Str); 
   Put("Den beräknade arean blev: "); 
   F := Area(Str); 
   Put(F, Fore => 0, Aft => 1, Exp => 0); 
   
   New_Line(2); 
   
   -- Deluppgift 3
   Put("Mata in ett tecken: "); 
   Get(Char); 
   Mult(Char, F); 
   Put("produkten av "); 
   Put(Char); 
   Put(" och 32.7 blir "); 
   Put(F, Fore => 0, Aft => 1, Exp => 0); 
   
   
end Ada_P2; 
