--augan049

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Tetris_Handling;     use Tetris_Handling;

procedure Tetris_Program is
   
   Board : Tetris_Type;
   Column : Integer;
   
begin
   Put_Line("Enter board:");
   Get(Board);
   
   Put("Enter column: ");
   Get(Column);
   
   Place_Piece(Board, Column);
   
   Put_Line("Result:");
   Put(Board);
   
end Tetris_Program;
