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
   Last_Char_UB : Unbounded_String; -- last char of second tower unbounded
   Last_Char_ST : Character; -- var storing char version of last char


begin

   --  looping through the file
   while not (Ada.Text_IO.End_Of_File) loop

      --  getting input storing it in Line var & storing length of Line
      Ada.Text_IO.Unbounded_IO.Get_Line (Ada.Text_IO.Standard_Input, Line);
      Length_UB := Length (Line);

      --  setting start & end placement at 1 initially
      Start_Placement := 1;
      End_Placement := 1;

      --  iterating through line while space & increasing start placement
      while Length_UB >= Start_Placement and -- -
       then Element (Line, Start_Placement) = ' ' loop -- -
         Start_Placement := Start_Placement + 1;
      end loop;

      --  setting end to the start
      End_Placement := Start_Placement;

      --  iterating through line while no space & increasing end placement
      while Length_UB >= End_Placement and -- -
       then Element (Line, End_Placement) /= ' ' loop -- -
         End_Placement := End_Placement + 1;
      end loop;

      --  checking if placement is going over line length & exiting if so
      if Length_UB < Start_Placement then
         exit;
      end if;

      --  slicing first tower out of line & storing value -> send graph
      First_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice  -- -
       (Line, Start_Placement, End_Placement - 1));

      --  setting the start placement to one index past the end placement
      Start_Placement := End_Placement + 1;

      --  iterating through line while space & increasing start placement
      while Length_UB >= Start_Placement and -- -
       then Element (Line, Start_Placement) = ' ' loop -- -
         Start_Placement := Start_Placement + 1;
      end loop;

      --  setting end to the start
      End_Placement := Start_Placement;

      --  iterating through line while no space & increasing end placement
      while Length_UB >= End_Placement and -- -
       then Element (Line, End_Placement) /= ' ' loop -- -
         End_Placement := End_Placement + 1;
      end loop;

      --  checking if placement is over line length & exiting if so
      if Length_UB < Start_Placement then
         exit;
      end if;

      --  slicing 2nd tower out of line & storing val -> send graph
      Second_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice
       (Line, Start_Placement, End_Placement - 1));

      --  storing length of second tower
      ST_Length := Length (Second_Tower);

      --  getting last char of 2nd tower and converting to unbounded str
      Last_Char_UB := To_Unbounded_String ("");
      Last_Char_ST := Element (Second_Tower, ST_Length);
      Last_Char_UB := Last_Char_ST & Last_Char_UB;

      --  setting the start placement to one index past the end placement
      Start_Placement := End_Placement + 1;

      --  iterating through line while space & increasing start placement
      while Length_UB >= Start_Placement and -- -
       then Element (Line, Start_Placement) = ' ' loop -- -
         Start_Placement := Start_Placement + 1;
      end loop;

      --  setting end to start
      End_Placement := Start_Placement;

      --  iterating through line while no space & increasing end placement
      while Length_UB >= End_Placement and -- -
       then Element (Line, End_Placement) /= ' ' loop -- -
         End_Placement := End_Placement + 1;
      end loop;

      --  checking last char symbol, saving value, & shortening 2nd tow
      if Last_Char_UB = "." or Last_Char_UB = "#" or Last_Char_UB = "?" then
         Symb := Last_Char_UB; -- val of symb -> send to graph
         Second_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice -- -
          (Second_Tower, 1, ST_Length - 1)); -- 2nd tower val -> send to graph
      else
         Symb := To_Unbounded_String (Ada.Strings.Unbounded.Slice -- -
          (Line, Start_Placement, End_Placement - 1)); -- saving symb val
      end if;

      --  printing values
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