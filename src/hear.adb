--  Author: Ava Crocker, acrocker2021@my.fit.edu
--  Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
--  Course: CSE 4250, Fall 2023
--  Project: Proj3, Can you hear me now?
--  Language implementation: GNAT Community 2021 (20210519-103)

with Ada.Text_IO;
with Ada.Containers;
with Ada.Containers.Vectors;
use Ada.Containers;

procedure Hear is

   Line   : String (1 .. 150);
   Length : Natural;

   type Constrained_String is new String (1 .. 150);

   package Vector_Package is new Ada.Containers.Vectors -- defines package
    (Index_Type => Positive, -- defines index
    Element_Type => Constrained_String); -- defines type
   Input_Vector : Vector_Package.Vector;

   function Convert_Constrained (Str : String) return Constrained_String;

   function Convert_Constrained (Str : String) return Constrained_String is
      Result : Constrained_String := (others => ' ');
   begin
      for I in Str'Range loop
         Result (I) := Str (I);
      end loop;
      return Result;
   end Convert_Constrained;

begin

   Vector_Package.Clear (Input_Vector);

   while not (Ada.Text_IO.End_Of_File) loop
      Ada.Text_IO.Get_Line (Ada.Text_IO.Standard_Input, Line, Length);
      Vector_Package.Append (Input_Vector, Convert_Constrained (Line));
   end loop;


--     for I in Vector_Package.Iterate (Input_Vector) loop
--        Ada.Text_IO.Put (Vector_Package.Element (Input_Vector, I));
--        Ada.Text_IO.New_Line;
--     end loop;
end Hear;
