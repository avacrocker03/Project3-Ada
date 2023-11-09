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
   First_Tower : Unbounded_String;
   Second_Tower : Unbounded_String;
   Pos1 : Natural;
   Pos2 : Natural;
   Length_UB : Natural;

begin

   while not (Ada.Text_IO.End_Of_File) loop
      Ada.Text_IO.Unbounded_IO.Get_Line (Ada.Text_IO.Standard_Input, Line);
      Length_UB := Length (Line);

      Pos1 := 1;
      Pos2 := 1;

      while Length_UB >= Pos1 and then Element (Line, Pos1) = ' ' loop
         Pos1 := Pos1 + 1;
      end loop;

      Pos2 := Pos1;

      while Length_UB >= Pos2 and then Element (Line, Pos2) /= ' ' loop
         Pos2 := Pos2 + 1;
      end loop;

      if Length_UB < Pos1 then
         exit;
      end if;

    --    Ada.Text_IO.Put (Integer'Image (Pos1));
    --    Ada.Text_IO.Put (Integer'Image (Pos2));
      First_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice -- blah
       (Line, Pos1, Pos2 - 1));
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => First_Tower);
      Pos1 := Pos2 + 1;

      while Length_UB >= Pos1 and then Element (Line, Pos1) = ' ' loop
         Pos1 := Pos1 + 1;
      end loop;

      Pos2 := Pos1;

      while Length_UB >= Pos2 and then Element (Line, Pos2) /= ' ' loop
         Pos2 := Pos2 + 1;
      end loop;

      if Length_UB < Pos1 then
         exit;
      end if;

      Second_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice -- blah
       (Line, Pos1, Pos2 - 1));
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => Second_Tower);

      Ada.Text_IO.Put_Line ("--");

   end loop;

end Hear;