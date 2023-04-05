with Ada.Text_IO;               use Ada.Text_IO;

with Brick_Collection_Handling; use Brick_Collection_Handling;

procedure Brick_Model_Program is
   
   Model, Available_Bricks : Brick_Collection_Type;
   
begin
   
   Put_Line("Enter bricks required for model:");
   Get(Model);
   
   Put_Line("Enter available bricks:");
   Get(Available_Bricks);
   
   Put("You can");
   if not Can_Build(Model, Available_Bricks) then
      Put("not");
   end if;
   Put_Line(" build the model.");
     
end Brick_Model_Program;
