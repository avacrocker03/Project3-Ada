--  Author: Ava Crocker, acrocker2021@my.fit.edu
--  Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
--  Course: CSE 4250, Fall 2023
--  Project: Proj3, Can you hear me now?
--  Language implementation: GNAT Community 2021 (20210519-103)

--  Citations:
--  https://learn.adacore.com/
--  https://www2.seas.gwu.edu/~adagroup/adalib_html/ada-html/a-strunb.html

with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
use Ada.Strings.Unbounded;
with Graph;

procedure Hear is

   Line            : Unbounded_String; -- creating input as unbounded
   First_Tower     : Unbounded_String; -- variable to store first tower name
   Second_Tower    : Unbounded_String; -- var storing second tower name
   Start_Placement : Natural; -- index of the start of tower
   End_Placement   : Natural; -- index of the end of tower
   Length_UB       : Natural; -- length of input line
   ST_Length       : Natural; -- length for second tower
   Symb            : Unbounded_String; -- var to store the symbol
   Last_Char_UB    : Unbounded_String; -- last char 2nd tower unbounded
   Last_Char_ST    : Character; -- char version of last char 2nd tower

begin
   while not (Ada.Text_IO.End_Of_File) loop -- looping through the file
      Ada.Text_IO.Unbounded_IO.Get_Line
        (Ada.Text_IO.Standard_Input,
         Line); -- getting input storing it in Line var
      Length_UB := Length (Line); -- storing length of input line

      Start_Placement := 1; -- setting start placement
      End_Placement   := 1; -- setting end placement

      while Length_UB >= Start_Placement
        and then Element (Line, Start_Placement) = ' '
      loop -- iterating through line while there's a space
         Start_Placement :=
           Start_Placement + 1; -- increasing start placement for every space
      end loop;

      End_Placement := Start_Placement; -- setting end to the start

      while Length_UB >= End_Placement
        and then Element (Line, End_Placement) /= ' '
      loop -- iterating though line while there's no space
         End_Placement :=
           End_Placement + 1; -- increasing end placement for every space
      end loop;

      if Length_UB < Start_Placement
      then -- checking if placement is going over length of line
         exit; -- exiting program
      end if;

      First_Tower :=
        To_Unbounded_String
          (Ada.Strings.Unbounded.Slice -- slicing first tower out of line
             (Line, Start_Placement,
              End_Placement -
              1)); -- value of first tower -> send to graph

      Start_Placement :=
        End_Placement +
        1; -- setting the start placement to one index past the end placement

      while Length_UB >= Start_Placement
        and then Element (Line, Start_Placement) = ' '
      loop -- iterating through line while there's a space
         Start_Placement :=
           Start_Placement + 1; -- increasing start placement for every space
      end loop;

      End_Placement := Start_Placement; -- setting end to the start

      while Length_UB >= End_Placement
        and then Element (Line, End_Placement) /= ' '
           and then Element (Line, End_Placement - 1) /= '?'
              and then Element (Line, End_Placement - 1) /= '.'
                 and then Element (Line, End_Placement - 1) /= '#'
      loop -- iterating through line while there's no space & no symb
         End_Placement :=
           End_Placement + 1; -- increasing end placement for every space
      end loop;

      if Length_UB < Start_Placement
      then -- checking if placement is going over the length of line
         exit; -- exiting program
      end if;

      Second_Tower :=
        To_Unbounded_String
          (Ada.Strings.Unbounded.Slice -- slicing second tower out of line
             (Line, Start_Placement, End_Placement - 1));

      ST_Length := Length (Second_Tower); -- getting length of second tower

      --  getting last char of 2nd tower & converting to unbounded str
      Last_Char_UB := To_Unbounded_String ("");
      Last_Char_ST := Element (Second_Tower, ST_Length);
      Last_Char_UB := Last_Char_ST & Last_Char_UB;

      Start_Placement :=
        End_Placement +
        1; -- setting the start placement to one index past the end placement

      while Length_UB >= Start_Placement
        and then Element (Line, Start_Placement) = ' '
      loop -- iterating through line while there's a space
         Start_Placement :=
           Start_Placement + 1; -- increasing start placement for every space
      end loop;

      End_Placement := Start_Placement; -- setting end to the start

      while Length_UB >= End_Placement
        and then Element (Line, End_Placement) /= ' '
      loop -- iterating through line while there's no space
         End_Placement :=
           End_Placement + 1; -- increasing end placement for every space
      end loop;

      if Last_Char_UB = "." or Last_Char_UB = "#" or Last_Char_UB = "?"
      then -- checking last char symbol, saving value, & shortening 2nd tow
         Symb := Last_Char_UB; -- val of symb -> send to graph
         Second_Tower := To_Unbounded_String (Ada.Strings.Unbounded.Slice -- -
           (Second_Tower, 1, ST_Length - 1)); -- 2nd tower val -> send to graph
      else
         Symb := To_Unbounded_String (Ada.Strings.Unbounded.Slice -- -
          (Line, Start_Placement, Start_Placement)); -- saving symb val
      end if;

      --  Checking Symb & creating/removing graph connections
      if Symb = "." then
         Graph.Create_Connection_Unbound_Strings (First_Tower, Second_Tower);
      elsif Symb = "#" then
         Graph.Remove_Connection_Unbound_Strings (First_Tower, Second_Tower);
      elsif Symb = "?" then
         Graph.Check_Connection_Unbound_Strings (First_Tower, Second_Tower);
      end if;
   end loop;
end Hear;
