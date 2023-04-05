with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Route_Handling;      use Route_Handling;

procedure Santa_Route_Program is
   
   Route_Info : Route_Type;
   
begin
   
   Put_Line("Enter route info:");
   Get(Route_Info);
   
   Put_Line("Santas route:");
   Print_Route(Route_Info);

end Santa_Route_Program;
