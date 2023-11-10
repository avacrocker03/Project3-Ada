--  Author: Ava Crocker, acrocker2021@my.fit.edu
--  Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
--  Course: CSE 4250, Fall 2023
--  Project: Proj3, Can you hear me now?
--  Language implementation: GNAT Community 2021 (20210519-103)

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
      loop -- iterating through line while there's no space
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

      if End_Placement > Start_Placement
      then -- checking if end placement is greater than start placement
         Symb :=
           To_Unbounded_String
             (Ada.Strings.Unbounded.Slice
                (Line, Start_Placement,
                 End_Placement - 1)); -- slicing symbol & saving value
      else
         Symb         :=
           To_Unbounded_String
             (Ada.Strings.Unbounded.Slice
                (Line, End_Placement - 2,
                 Length_UB)); -- slicing symbol & saving value
         Second_Tower :=
           To_Unbounded_String
             (Ada.Strings.Unbounded.Slice
                (Second_Tower, 1,
                 ST_Length - 1)); -- true value for second tower
      end if;

      Ada.Text_IO.Unbounded_IO.Put_Line
        (Item => First_Tower); -- printing out vals
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => Second_Tower);
      Ada.Text_IO.Unbounded_IO.Put_Line (Item => Symb);

      if Symb = "." then
         Ada.Text_IO.Put_Line ("Ada Add New Connection");
      elsif Symb = "#" then
         Ada.Text_IO.Put_Line ("Ada Remove Connection");
      elsif Symb = "?" then
         Ada.Text_IO.Put_Line ("Ada Get Connection");
      end if;

      Ada.Text_IO.Put_Line ("=======");

   end loop;

end Hear;
