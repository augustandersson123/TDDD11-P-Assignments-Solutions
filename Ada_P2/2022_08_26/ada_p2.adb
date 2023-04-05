-- Gammal P2-uppgift, 2022-08-26
-- Löst av augan049, August Andersson

with Ada.Text_IO;                           use Ada.Text_IO; 
with Ada.Float_Text_IO;                     use Ada.Float_Text_IO; 
with Ada.Numerics.Elementary_Functions;     use Ada.Numerics.Elementary_Functions; 
with Ada.Integer_Text_IO;                   use Ada.Integer_Text_IO; 




-- Huvudprogrammet
procedure Ada_P2 is 
   
  -- Funktion som beräknar arean, deluppgift 1. 
  function Area(S : in Integer) return Float is 
      
   begin 
      
      return (Float(S) * (Float(S) * Sqrt(3.0) / 2.0) / 2.0);
   
   end Area; 
   
   -- Deluppgift 2. Inläsning av flyttal och sträng. Beräkning av kvoten dem emellan. 
  procedure SF_Kvot(F : out Float; 
		    Str: out String; 
		    Kvot : out Integer) is
   
  begin 
     
     Put("Mata in ett flyttal: "); 
     Get(F); 
     Put("Mata in en sträng med exakt 3 tecken: "); 
     Get(Str); 
     Kvot := Integer(Float'Ceiling(F / Float'Value(Str))); 
     
  end SF_Kvot; 
		     
  
  -- Egendefinierad operator. Deluppgift 3. 
  function "&"(Char : in Character; 
	       S    : in Integer) return Float is
     
     Float_Of_Char : Float; 
     
  begin 
     
     -- Character'Pos(Char) ger tecknets plats i ASCII-tabellen. 
     -- Subtraherar med 48 för att få den siffra som char är. 
     Float_Of_Char := Float(Character'Pos(Char)) - 48.0;
     
     return Float_Of_Char / Float(S); 
     
  end "&"; 
  
  
  
  
   S : Integer; 
   F : Float; 
   Str : String(1..3); 
   Kvot : Integer; -- Egentligen onödigt med två heltalsvariabler, men mer läsbart
   C : Character; 
   Kvot_2 : Float;  -- Egentligen onödigt med två flyttalsvariabler, men mer läsbart
   
   
begin 
   
  
   -- Deluppgift 1
   Put("Mata in längden: "); 
   Get(S); 
   Put("Den beräknade arean blev: "); 
   Put(Area(S), Fore => 0, Exp => 0, Aft => 1); 
   
   New_Line(2); 
   
   
   -- Deluppgift 2
   SF_Kvot(F, Str, Kvot); 
   Put("Du matade in flyttalet: "); 
   Put(F, Fore => 0, Aft => 1, Exp => 0); 
   Put(" och strängen: "); 
   Put(Str); 
   Put(" och kvoten blev"); 
   Put(Kvot); 
   
   New_Line(2); 
   
   
   -- Deluppgift 3
   Put("Mata in ett tecken: "); 
   Get(C);
   Put("Mata in ett heltal: "); 
   Get(S); 
   
   Kvot_2 := C & S; 
   
   Put("Den beräknade kvoten mellan "); 
   Put(C); 
   Put(" och "); 
   Put(S, Width => 0); 
   Put(" blir "); 
   Put(Kvot_2, Fore => 0, Aft => 1, Exp => 0); 
   
   
   
   
	      
end Ada_P2; 
