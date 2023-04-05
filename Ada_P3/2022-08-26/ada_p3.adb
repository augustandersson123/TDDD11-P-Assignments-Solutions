with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Text_IO; 
with Ada.Float_Text_IO; use Ada.Float_Text_IO; 




procedure Ada_P3 is 
   
   -- Ytterst array 
   -- Sedan post 
   -- Sedan matris
   
   
   -- Skapa subtypes för ranges? 
   
   --  subtype Integer_Range_Type is 
   --    24..27;
   
   subtype Character_Range_Type is 
     Character range 'w'..'x'; 
   
   type Matrix_Type is 
     array(24..27, Character range 'w'..'x') of Float; 
   
 
   
   type Post_Type is 
      record
	 H : Matrix_Type; 
	 R : Matrix_Type; 
      end record; 
   
   type T_Type is 
     array(Character range 'K'..'N') of Post_Type; 
   

   
   
   procedure Put(Matrix : in Matrix_Type) is 
      
   begin 
      
      for X_Index in reverse 24..27 loop -- Gör generell
      	 for Y_Index in Character range 'w'..'x' loop 
      	    Put(Matrix(X_Index, Y_Index), Fore => 1, Aft => 1, Exp => 0);
	    
      	    -- Ett mellanslag ska endast skrivas ut mellan datan, inte efter sista datat
	    
      	    if (X_Index /= 24) and (Y_Index /= 'x') then 
      	       Put(" "); -- Möjligen inte ett mellanslag efter sista, lös med villkor
      	    end if; 
	    
      	 end loop;

	 
      end loop; 
	    	   
   end Put; 
   
   procedure Get(Matrix : out Matrix_Type) is 
      
      Whitespace_Char : Character; 
      
   begin 
      
      for X_Index in 24..27 loop -- Hur gör jag denna generell? 
	 for Y_Index in reverse Character range 'w'..'x' loop 
	    Get(Matrix(X_Index, Y_Index)); -- Get för float, ignorerar blanksteg	
	    
	    --  if not End_Of_Line then  -- Om vi hämtar något annat än Floats eller Integers
	    --     Get(Whitespace_Char); 
	    --  end if; 
	    
	 end loop;
      end loop; 	    
      
   end Get; 
      
   
   procedure Put(Post : in Post_Type) is 
      
   begin 
      
      Put(Post.H);
      Put(" "); 
      Put(Post.R); 
      
   end Put; 
      
   
   procedure Get(Post : out Post_Type) is 
      
   begin 
      
      Get(Post.H); 
      Get(Post.R); 
      
   end Get; 
   
  
   
   procedure Put(T : in T_Type) is 
      
   begin 
      
      for Post in Character range T_Type'Range loop 
	 Put(T(Post));
      end loop; 
      
   end Put; 
   
   
   procedure Get(T : out T_Type) is
      
   begin 
      
      for Index in reverse Character range T_Type'Range loop 
	 Get(T(Index)); 
      end loop; 
      
   end Get; 
      
      -- Huvudprogrammets variabel
   T : T_Type; 
   
begin 
   
   Put("Mata in datamängd: "); 
   Get(T); 
   Skip_Line; 
   
   Put("Inmatad datamängd: "); 
   Put(T);
   
   
end Ada_P3; 
			  

