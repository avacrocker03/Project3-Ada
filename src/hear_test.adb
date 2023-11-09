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

   Line : Unbounded_String; -- creating input as unbounded
   First_Tower : Unbounded_String; -- variable to store first tower name
   Second_Tower : Unbounded_String; -- var storing second tower name
   Start_Placement : Natural; -- index of the start of tower
   End_Placement : Natural; -- index of the end of tower
   Length_UB : Natural; -- length of input line
   ST_Length : Natural; -- length for second tower
   Symb : Unbounded_String; -- var to store the symbol
   Last_Char_ST : Unbounded_String; -- var to store last char of second tower
   

begin

   while not (Ada.Text_IO.End_Of_File) loop -- looping through the file
      Ada.Text_IO.Unbounded_IO.Get_Line (Ada.Text_IO.Standard_Input, Line); -- getting input storing it in Line var
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
       (Line, Start_Placement, End_Placement - 1)); -- value of first tower -> send to graph

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
       (Line, Start_Placement, End_Placement - 1)); -- not true value of second tower -> true value lower in code
      
      ST_Length := Length (Second_Tower);
      
      Last_Char_ST := To_Unbounded_String(To_String(Element (Second_Tower, ST_Length)));
      Start_Placement := End_Placement + 1;

      while Length_UB >= Start_Placement and then Element (Line, Start_Placement) = ' ' loop
         Start_Placement := Start_Placement + 1;
      end loop;

      End_Placement := Start_Placement;

      while Length_UB >= End_Placement and then Element (Line, End_Placement) /= ' ' loop
         End_Placement := End_Placement + 1;
      end loop;

    --    Ada.Text_IO.Put (Integer'Image (Start_Placement));
    --    Ada.Text_IO.Put (Integer'Image (End_Placement));
    --    Ada.Text_IO.Put (Integer'Image (ST_Length));

      Ada.Text_IO.Unbounded_IO.Put_Line (Second_Tower & "+test");

      if Last_Char_ST = "." or Last_Char_ST = "#" or Last_Char_ST = "?" then
        Symb := Last_Char_ST; -- value of symbol being saved
        Second_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice (Second_Tower, 1, ST_Length - 1)); -- true value of second tower -> send to graph
      else
        Symb := To_Unbounded_String(Ada.Strings.Unbounded.Slice(Line, Start_Placement, End_Placement - 1)); -- value of symbol being saved
      end if;
       
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => First_Tower);
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => Second_Tower);
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => Symb);   

      Ada.Text_IO.Put_Line ("====");

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