with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Text_IO; 

procedure Ada_P3 is 
   
   -- Ytterst Post
   -- Sedan Matris med arrayer 
   -- Samt Array med strängar
   -- Sedan
   
   -- OBS ska använda flera rader för deklaration av datatyper
   -- Innersta datatypen 
   -- ex:  type Matrix is 
   --           array(24..27, 'w'..'x') of Float; 
   
   -- Nästa datatyp
   -- ex: 
   --  type Post_Type is 
   --     record
   --  	 H : Matrix; 
   --  	 R : Matrix; 
   --     end record; 
   
   -- Yttersta datatypen
   --  type T_Type is 
   --           array('K'..'N') of Post_Type; 
   
   -- Huvudprogrammets variabel
-- ex:   T : T_Type; 
   
   -- Tänk på mellanslagen - Kan vara Get för annat än Integer och Float, tänk på mellanslagen innan i så fall 
   
   -- Data Error: Ex när man kör Get för integer på en sträng
   
   type Matrix_Array_Type is 
     array(-35..-33) of Integer; 
   
   subtype Y_Character_Range is 
     Character range '3'..'5';
   
   subtype X_Character_Range is 
     Character range 'O'..'R'; 
     
   type Matrix_Type is 
     array(X_Character_Range, Y_Character_Range) of Matrix_Array_Type; 
   
   type Post_Array_Type is 
     array(67..70) of String(1..3); 
   
   type Post_Type is 
      record
	 U : Matrix_Type; 
	 X : Post_Array_Type; 
      end record; 
   
   
   procedure Get(Post_Array : out Post_Array_Type) is 
      
      Whitespace_Char : Character; 
      
   begin 
      
      for Index in reverse Post_Array_Type'Range loop 
   	 Get(Whitespace_Char); 
   	 Get(Post_Array(Index)); 
      end loop; 
      
   end Get; 
   
   procedure Put(Post_Array : in Post_Array_Type) is 
      
   begin 
      
      for Index in Post_Array_Type'Range loop
	 Put(Post_Array(Index)); 
	 
	 if not (Index = Post_Array_Type'Last) then 
	    Put(" "); 
	 end if; 
	 
      end loop; 
      
   end Put; 
   
   procedure Get(Inner_Array : out Matrix_Array_Type) is 
      
   begin 
      
      for Index in Matrix_Array_Type'Range loop 
	 Ada.Integer_Text_IO.Get(Inner_Array(Index)); 
      end loop; 
      
   end Get; 
   
   
   procedure Put(Inner_Array : in Matrix_Array_Type) is 
      
   begin 
      
      for Index in Matrix_Array_Type'Range loop 
	 
	 Ada.Integer_Text_IO.Put(Inner_Array(Index), Width => 0); -- Varför måste vi hårdkoda?
	 
	 if not (Index = Matrix_Array_Type'Last) then 
	    Put(" "); 
	 end if; 
	 
     end loop; 
      
   end Put; 
      
   
   procedure Get(Matrix : out Matrix_Type) is 
      
   begin 
      
      for X_Index in X_Character_Range'Range loop 
	 
	 for Y_Index in reverse Y_Character_Range'Range loop
	    
	    Get(Matrix(X_Index, Y_Index)); -- Det kommer alltid att vara integers
	    
	 end loop; 
      end loop; 
      
   end Get; 
   
   procedure Put(Matrix : in Matrix_Type) is 
      
   begin 
      
      for Y_Index in Y_Character_Range'Range loop
	 for X_Index in reverse X_Character_Range'Range loop 
	    Put(Matrix(X_Index, Y_Index)); 
	    
	    if not (Y_Index = Y_Character_Range'Last and X_Index = X_Character_Range'First) then 
	       Put(" "); 
	    end if; 
	    
	 end loop; 
     end loop; 
	     
   
   end Put; 
   
   procedure Get(T : out Post_Type) is 
      
   begin 
      
      Get(T.U); 
      Get(T.X); 
      
   end Get; 
      
   procedure Put(T : in Post_Type) is 
      
   begin 
      
      Put(T.U); 
      Put(" "); 
      Put(T.X); 
      
   end Put; 
   
   
   T : Post_Type; 
   
begin 
   
   Put("Mata in datamängd: "); 
   Get(T); 
   
   
   Put("Inmatad datamängd: "); 
   Put(T);
   
   
end Ada_P3; 
