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
   Start_Placement : Natural;
   End_Placement : Natural;
   Length_UB : Natural;
   ST_Length : Natural;
   Symb : Unbounded_String;

begin

   while not (Ada.Text_IO.End_Of_File) loop
      Ada.Text_IO.Unbounded_IO.Get_Line (Ada.Text_IO.Standard_Input, Line);
      Length_UB := Length (Line);

      Start_Placement := 1;
      End_Placement := 1;

      while Length_UB >= Start_Placement and then Element (Line, Start_Placement) = ' ' loop
         Start_Placement := Start_Placement + 1;
      end loop;

      End_Placement := Start_Placement;

      while Length_UB >= End_Placement and then Element (Line, End_Placement) /= ' ' loop
         End_Placement := End_Placement + 1;
      end loop;

      if Length_UB < Start_Placement then
         exit;
      end if;

      First_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice -- blah
       (Line, Start_Placement, End_Placement - 1));

      Start_Placement := End_Placement + 1;

      while Length_UB >= Start_Placement and then Element (Line, Start_Placement) = ' ' loop
         Start_Placement := Start_Placement + 1;
      end loop;

      End_Placement := Start_Placement;

      while Length_UB >= End_Placement and then Element (Line, End_Placement) /= ' ' loop
         End_Placement := End_Placement + 1;
      end loop;

      if Length_UB < Start_Placement then
         exit;
      end if;

      Second_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice -- blah
       (Line, Start_Placement, End_Placement - 1));

      ST_Length := Length (Second_Tower);

      Start_Placement := End_Placement + 1;

      while Length_UB >= Start_Placement and then Element (Line, Start_Placement) = ' ' loop
         Start_Placement := Start_Placement + 1;
      end loop;

      End_Placement := Start_Placement;

      while Length_UB >= End_Placement and then Element (Line, End_Placement) /= ' ' loop
         End_Placement := End_Placement + 1;
      end loop;

      if End_Placement > Start_Placement then
         Symb := To_Unbounded_String(Ada.Strings.Unbounded.Slice(Line, Start_Placement, End_Placement - 1));
      else
        Symb := To_Unbounded_String (Ada.Strings.Unbounded.Slice (Line, End_Placement - 2, Length_UB));
        Second_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice (Second_Tower, 1, ST_Length - 1));
      end if;
       
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => First_Tower);
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => Second_Tower);
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => Symb);   

      Ada.Text_IO.Put_Line ("--");

    -- commented out so it can run

    --    if Symb = "." then
    --       -- do sum stuff
    --    else if Symb = "#" then
    --       -- do sum other stuff
    --    else if Symb = "?" then
    --       -- do sum more stuf
    --    end if;

   end loop;

end Hear;