with Ada.Text_IO;         use Ada.Text_IO; 
with Ada.Float_Text_IO;   use Ada.Float_Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 

procedure Ada_P2 is 
   
   -- Del 1 funktion 
   function Area(S : in Character) return Float is 
      
      Area : Float; 
      
   begin 
      
      Area := Float((Character'Pos(S) - 48) * (Character'Pos(S) - 48)); 
      
      return Area; 
     
   end Area; 
   
   -- Deluppgift 2
   procedure Get_And_Subtract(Num_1         : out Integer; 
			      Num_2         : out Character;
			      Difference    : out Integer) is 
      
   begin 
      
      Put("Mata in ett heltal: "); 
      Get(Num_1); 
      Skip_Line; 
      
      Put("Mata in ett tecken: "); 
      Get(Num_2); 
      Skip_Line; 
      
      Difference := Num_1 - (Character'Pos(Num_2) - 48); 
      
   end Get_And_Subtract; 
   
   -- Operator, löser deluppgift 3
   function "+"(Num_1 : in Integer; 
		Num_2 : in Character) return Float is 
      
      Sum : Float; 
      
   begin 
      
      Sum := Float(Num_1 + Character'Pos(Num_2) - 48); 
      return Sum; 
      
   end "+"; 
   
   -- Huvudprogrammets variabler
   Int_1, Int_2 : Integer; 
   Char : Character;
   F : Float; 
   
begin 
   
   -- Deluppgift 1
   Put("Mata in längden: "); 
   Get(Char); 
   F := Area(Char); 
   Put("Den beräknade arean blev: "); 
   Put(F, Fore => 0, Aft => 1, Exp => 0); 
   New_Line(2); 
   
   -- Deluppgift 2
   Get_And_Subtract(Int_1, Char, Int_2); 
   Put("Du matade in heltalet: "); 
   Put(Int_1, Width => 0); 
   Put(" och tecknet: "); 
   Put(Char); 
   Put(" och differensen blev"); 
   Put(Int_2); 
   New_Line(2); 
   
   -- Deluppgfit 3
   -- Inläsning och beräkning
   Put("Mata in ett heltal: "); 
   Get(Int_1);
   Skip_Line; 
   
   Put("Mata in ett tecken: "); 
   Get(Char); 
   Skip_Line; 
   F := Int_1 + Char;
   
   -- Utskrift
   Put("Den beräknade summan av "); 
   Put(Int_1, Width => 0); 
   Put(" och "); 
   
   Put(Char); 
   Put(" blir "); 
   Put(F, Fore => 0, Aft => 1, Exp => 0); 
   
end Ada_P2; 
