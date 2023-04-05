-- augan049 
package Abacus_Handling is 
   
   type Abacus_Type is private; 
   
   procedure Get(Abacus : out Abacus_Type); 
   
   procedure Put(Abacus : in Abacus_Type); 
   
private 
   
   type Pair is 
     array(1..2) of Integer; 
   
   type Pair_Array is 
     array(1..10) of Pair; 
   
   type Abacus_Type is 
      record
	 Width : Natural := 0;   
	 Pairs : Pair_Array; 
      end record; 
       
end Abacus_Handling;
