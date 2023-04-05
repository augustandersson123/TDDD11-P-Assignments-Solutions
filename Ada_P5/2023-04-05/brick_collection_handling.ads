--augan049 

package Brick_Collection_Handling is 
   
   -- Ordningen i specifikationsfilen: 
   -- Konstanter
   -- Deklaration av privata datatyper 
   -- Deklaration av underprogram som ska vara synliga utåt
   -- Undantag
  
     type Brick_Collection_Type is private; 
       
     procedure Get(Brick_Collection : out Brick_Collection_Type); 
     
     function Can_Build(Model, Available_Bricks : in Brick_Collection_Type) return Boolean; 
     
       
private 

   -- Definition av privata datatyper
   
      type Single_Brick_Collection is 
      record 
      X, Y   : Natural := 0; 
      Colour         : Character;
      Amount_Of_This : Natural := 0; 
     end record; 
   
   subtype Collection_Range is 
     Integer range 1..10; 
   
   type Brick_Collection_Type is 
     array (Collection_Range'Range) of Single_Brick_Collection; 
   
   
end Brick_Collection_Handling;

