-- Author: Ava Crocker, acrocker2021@my.fit.edu 
-- Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu 
-- Course: CSE 4250, Fall 2023 
-- Project: Proj3, Can you hear me now? 
-- Language implementation: GNAT Community 2021 (20210519-103) 

with Ada.Text_IO;
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
use Ada.Strings.Unbounded;

package body Graph is

   use List_Package;

   -- Creates A Node And Returns It (Also Adds It To All Nodes)
   function Create_Node (Name : Unbounded_String) return Node is
      New_Node : Node;
   begin
      New_Node.Name      := Name; -- Sets Nodes Name
      return New_Node; -- Returns Node
   end Create_Node;
end Graph;
