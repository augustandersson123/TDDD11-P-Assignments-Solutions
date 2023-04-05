-- Gammal P2-uppgift från 2022-09-15. Löst av augan049, August Andersson 

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 
with Ada.Float_Text_IO;   use Ada.Float_Text_IO; 

procedure Ada_P2 is 
   
   

   
   -- Deluppg 1 procedur
   procedure Get_Add(Str  :   out    String; 
		     Char :   out Character;
		     Sum  :   out   Integer) is
      
      
      
   begin 
      
      Put("Mata in en sträng med exakt tre tecken: "); 
      Get(Str); 
      Put("Mata in ett tecken: "); 
      Get(Char); 
      Sum := Integer'Value(Str) + (Character'Pos(Char) - 48); 
      
      
      
   end Get_Add; 
      
      
   
   -- Deluppg 2 funktion 
   function Subtract(Num : in Integer) return Float is
      
      Difference : Float; -- Variabel för ökad läsbarhet
      
   begin 
      
      Difference := Float'Rounding(Float(Num) - 32.7); 
      
      return Difference; 
      
      
   end Subtract; 
   
   
   -- Deluppg 3 operator. Logiskt val av operator.
   function "+"(Str  : in String; 
		 F   : in  Float) return Float is 
      
      Sum : Float; -- Variabel för ökad läsbarhet
      
   begin 
      
      Sum := Float'Ceiling(Float'Value(Str) + F);
      
      return Sum; 
	
       
   end "+"; 
   
   
   
   Str : String(1..3); 
   Char : Character; 
   Int : Integer; 
   F : Float;     
       
   begin 
      
      -- Deluppgift 1
      Get_Add(Str, Char, Int); 
      Skip_Line; 
      
      Put("Du matade in strängen: "); 
      Put(Str); 
      Put(" och tecknet "); 
      Put(Char); 
      Put(" och summan blev"); 
      Put(Int); 
      
      New_Line(2); 
      
      -- Deluppgift 2
      Put("Mata in ett heltal: "); 
      Get(Int); 
      Skip_Line; 
      F := Subtract(Int); 
      
      Put("differensen mellan "); 
      Put(Int, Width => 0); 
      Put(" och 32.7 blir "); 
      Put(F, Fore => 0, Aft => 1, Exp => 0); 
      
      New_Line(2); 
      
      -- Deluppgift 3
      Put("Mata in en sträng: "); 
      Get(Str); 
      Skip_Line; 
      Put("Mata in ett flyttal: "); 
      Get(F); 
      Skip_Line; 
      
      
      Put("Den beräknade summan av "); 
      Put(Str); 
      Put(" och "); 
      Put(F, Fore => 0, Aft => 1, Exp => 0); 
      Put(" blir ");
      F:= Str + F; 
      Put(F, Fore => 0, Aft => 1, Exp => 0); 
      
      -- Vanlig operation med plustecknet fungerar fortfarande
      Put(4 + 3); 
      
   
end Ada_P2; 
