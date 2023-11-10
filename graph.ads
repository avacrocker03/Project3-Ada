-- Author: Ava Crocker, acrocker2021@my.fit.edu
-- Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
-- Course: CSE 4250, Fall 2023
-- Project: Proj3, Can You Hear Me Now?
-- Language implementation: GNAT Community 2021 (20210519-103)

-- graph.ads

with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Graph is

   type Node; -- Intitalize Node
   type Node_Ptr is access Node; -- Pointer To Node
   package List_Package is new Ada.Containers.Doubly_Linked_Lists
     (Element_Type => Node_Ptr);

   -- Declare Node With Required Fields
   type Node is record
      Name      : Unbounded_String;
      Neighbors : List_Package.List;
   end record;

   -- All Nodes In List
   All_Nodes : List_Package.List;

-- Creates A Node And Returns It (Also Adds It To All Nodes)
   function Create_Node (Name : Unbounded_String) return Node;

-- Create Connection Adds The Name Of The New Connection To The Current Node And Vice Versa
--   function Create_Connection
--     (Current_Node : Node; New_Connection_Node : Node) return Boolean;

-- Check Connection Goes Through The CurrentNode's List And Checks To See If It Is In There
--   function Check_Connection
--     (Current_Node : Node; Comparable_Node : Node) return Boolean;

end Graph;
