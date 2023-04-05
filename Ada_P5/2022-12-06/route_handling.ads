package Route_Handling is 
   
   -- Ordningen i specifikationsfilen: 
   -- Konstanter
   -- Deklaration av privata datatyper 
   -- Deklaration av underprogram som ska vara synliga utåt
   -- Undantag
   
   
   type Route_Type is private; 
   
   procedure Get(Route_Info : out Route_Type); 
   
   procedure Print_Route(Route_Info : in Route_Type); 
   
private 

   -- Definition av privata datatyper
   
   subtype Number_Of_Places is 
     Positive range 1..5; 
   
   type Stop is 
      record
	 X, Y : Integer; 
	 Gifts : Natural;
      end record; 
	 
   
   type Route_Type is 
     array(Number_Of_Places) of Stop; 
   
end Route_Handling;
