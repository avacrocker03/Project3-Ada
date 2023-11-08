--  Author: Ava Crocker, acrocker2021@my.fit.edu
--  Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
--  Course: CSE 4250, Fall 2023
--  Project: Proj3, Can you hear me now?
--  Language implementation: GNAT Community 2021 (20210519-103)

with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
use Ada.Strings.Unbounded;

procedure Hear is

   Line : Unbounded_String;
   First_Tower : String (1 .. 50);
   Second_Tower : String (1 .. 50);

begin

   while not (Ada.Text_IO.End_Of_File) loop
      Ada.Text_IO.Unbounded_IO.Get_Line (Ada.Text_IO.Standard_Input, Line);
      First_Tower := Ada.Strings.Unbounded.Slice (Line, 1, 50);
      Ada.Text_IO.Put_Line (Item => Slice_Str);
      Ada.Text_IO.Put_Line ("-");
   end loop;

end Hear;