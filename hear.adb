--  Author: Ava Crocker, acrocker2021@my.fit.edu
--  Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
--  Course: CSE 4250, Fall 2023
--  Project: Proj3, Can you hear me now?
--  Language implementation: GNAT Community 2021 (20210519-103)

with Ada.Text_IO;

procedure Hear is

   Line   :   String (1 .. 150);
   Length :   Natural;
   

begin

   while not (Ada.Text_IO.End_Of_File) loop
      Ada.Text_IO.Get_Line (Ada.Text_IO.Standard_Input, Line, Length);
      Ada.Text_IO.Put (Item => Line (1 .. Length));
      Ada.Text_IO.New_Line;
   end loop;

end Hear;