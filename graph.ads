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

   -- All Nodes
   All_Nodes : List_Package.List;

   -- Declare Node With Required Fields
   type Node is record
      Name      : Unbounded_String;
      Neighbors : List_Package.List;
   end record;

-- Creates A Node And Returns It (Also Adds It To All Nodes)
   function Create_Node (Name : Unbounded_String) return Node_Ptr;

-- Create Connection Adds The Name Of The New Connection To The Current Node And Vice Versa
   procedure Create_Connection (Current_Node : in out Node_Ptr; New_Connection_Node : in out Node_Ptr);

   -- Prints Neighbors Of Current_Node
   procedure Print_Neighbors (Node_A : in out Node_Ptr);

   -- Prints All Nodes 
   procedure Print_All_Nodes;

   -- Takes Unbound Strings (Names), And Checks The Whole List To Make Sure 
   -- That The Node Doesn't Exist. If It Doesn't Make A Node And Connect It
   procedure Create_Connection_Unbound_Strings(Old_Neighbor : in out Unbounded_String; New_Neighbor : in out Unbounded_String);

   -- Takes Unbound Strings (Names), And Checks The Whole List To Make Sure 
   -- That The Node Exists. If It Doesn't Make A Node And Add It To Graph
   procedure Remove_Connection_Unbound_Strings(Old_Neighbor : in out Unbounded_String; New_Neighbor : in out Unbounded_String);


-- Check Connection Goes Through The Current Node's List And Checks To See If It Is In There
  function Check_Connection (Current_Node : Node_Ptr; Comparable_Node : Node_Ptr) return Boolean;


-- Returns True If Node Exists
  function Does_Node_Exist (Name : Unbounded_String) return Boolean;

-- Returns The Node From List Of All Nodes
  function Get_Node_From_List (Name : Unbounded_String) return Node_Ptr;


-- Remove Node Connection
   procedure Remove_Connection(Node_A : in out Node_Ptr; Node_B : in out Node_Ptr);


end Graph;
