package Map_Handling is 
   
   -- Ordningen i specifikationsfilen: 
   -- Konstanter
   -- Deklaration av privata datatyper 
   -- Deklaration av underprogram som ska vara synliga utåt
   -- Undantag
   
   type Map_Type is private; 
   
   procedure Get(Map : out Map_Type); 
   
   procedure Put(Map : in Map_Type); 
   
   function Extract_Largest_Area(Map : in Map_Type) return Map_Type;  
   
private 
   
   subtype Map_Y_Range is 
     Positive range 1..10; 
   
   subtype Map_X_Range is 
     Positive range 1..10; 
   
   type Map_Type is 
     array(Map_Y_Range, Map_X_Range) of Character; 
   -- Definition av privata datatyper
   
   
end Map_Handling;
