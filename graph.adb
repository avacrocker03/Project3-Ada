--  Author: Ava Crocker, acrocker2021@my.fit.edu
--  Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
--  Course: CSE 4250, Fall 2023
--  Project: Proj3, Can you hear me now?
--  Language implementation: GNAT Community 2021 (20210519-103)

with Ada.Text_IO;
--  with Ada.Containers.Doubly_Linked_Lists;
--  with Ada.Strings.Unbounded;
--  use Ada.Strings.Unbounded;

package body Graph is

   use List_Package;

   --  Iterates Through Loop, Checks If Curr Node Neighbors Contain Comp_Node
   function Check_Connection (Current_Node : Node_Ptr;
      Comparable_Node : Node_Ptr) return Boolean is
         Cursor : List_Package.Cursor := List_Package.First
            (Current_Node.Neighbors);
   begin
      --  Iterate through the neighbors of Current_Node
      while List_Package.Has_Element (Cursor) loop
         declare
            Neighbor_Node : constant Node_Ptr := List_Package.Element (Cursor);
         begin
            --  Check if the Current_Neighbor matches Comparable_Node
            if Comparable_Node.Name = Neighbor_Node.Name then
               return True;
            end if;
         end;
         List_Package.Next (Cursor);
      end loop;
      return False;
   end Check_Connection;

--  Returns The Node From List Of All Nodes
   function Get_Node_From_List (Name : Unbounded_String) return Node_Ptr is
      Cursor : List_Package.Cursor := List_Package.First (All_Nodes);
      The_Node : Node_Ptr;
   begin
   --  Iterate through the neighbors of Current_Node
      while List_Package.Has_Element (Cursor) loop
         declare
            Current_Node : constant Node_Ptr := List_Package.Element (Cursor);
         begin
            if (To_String (Current_Node.Name) = Name) then
               The_Node := Current_Node;
            end if;
         end;
         List_Package.Next (Cursor);
      end loop;
      return The_Node;
   end Get_Node_From_List;

   --  Returns True If Node Exists
   function Does_Node_Exist (Name : Unbounded_String) return Boolean is
      Cursor : List_Package.Cursor := List_Package.First (All_Nodes);
   begin
   --  Iterate through the neighbors of Current_Node
      while List_Package.Has_Element (Cursor) loop
         declare
            Current_Node : constant Node_Ptr := List_Package.Element (Cursor);
         begin
            if (To_String (Current_Node.Name) = Name) then
               return True;
            end if;
         end;
         List_Package.Next (Cursor);
      end loop;
      return False;
   end Does_Node_Exist;

   --  Prints All Nodes
   procedure Print_All_Nodes is
      Cursor : List_Package.Cursor := List_Package.First (All_Nodes);
   begin
   --  Iterate through the neighbors of Current_Node
      while List_Package.Has_Element (Cursor) loop
         declare
            Current_Node : constant Node_Ptr := List_Package.Element (Cursor);
         begin
            Ada.Text_IO.Put_Line ("Node " & To_String (Current_Node.Name));
         end;
         List_Package.Next (Cursor);
      end loop;
   end Print_All_Nodes;

   --  Creates A Node And Returns It (Also Adds It To All Nodes)
   function Create_Node (Name : Unbounded_String) return Node_Ptr is
      New_Node_Pointer : constant Node_Ptr :=
         new Node'(Name => Name, Neighbors => List_Package.Empty_List);
   begin
      --  Add Nodes To All_Nodes
      List_Package.Append (All_Nodes, New_Node_Pointer);
      return New_Node_Pointer;
   end Create_Node;

   --  Remove Node Connection
   procedure Remove_Connection (Node_A : in Node_Ptr; Node_B :
      in Node_Ptr) is
         Cursor_A : List_Package.Cursor :=
            List_Package.First (Node_A.Neighbors);
            Cursor_B : List_Package.Cursor :=
               List_Package.First (Node_B.Neighbors);
   begin
   --  Iterate through the neighbors of Current_Node
      while List_Package.Has_Element (Cursor_A) loop
         declare
            Current_Node_In_List : constant Node_Ptr :=
               List_Package.Element (Cursor_A);
         begin
            if (To_String (Current_Node_In_List.Name) =
               To_String (Node_B.Name))
            then
                  List_Package.Delete (Node_A.Neighbors, Cursor_A);

            end if;
         end;
         List_Package.Next (Cursor_A);
      end loop;

      while List_Package.Has_Element (Cursor_B) loop
         declare
            Current_Node_In_List : constant Node_Ptr :=
               List_Package.Element (Cursor_B);
         begin
            if (To_String (Current_Node_In_List.Name) =
               To_String (Node_A.Name))
            then
                  List_Package.Delete (Node_B.Neighbors, Cursor_B);
            end if;
         end;
         List_Package.Next (Cursor_B);
      end loop;
   end Remove_Connection;

   --  Creates Connection Btwn 2 Nodes By Adding The Nodes To Each Others Lists
   procedure Create_Connection (Current_Node :
      in Node_Ptr; New_Connection_Node : in Node_Ptr) is
         --  Node_Pointer_To_A : Node_Ptr := Current_Node;
         Node_Pointer_To_B : constant Node_Ptr := New_Connection_Node;
   begin
      List_Package.Append (Current_Node.Neighbors, Node_Pointer_To_B);
   end Create_Connection;

   --  Prints Neighbors of Given Node
   procedure Print_Neighbors (Node_A : in Node_Ptr) is
      Cursor_A : List_Package.Cursor := List_Package.First (Node_A.Neighbors);
   begin
   --  Iterate through the neighbors of Current_Node
      while List_Package.Has_Element (Cursor_A) loop
         declare
            Current_Node_In_List : constant Node_Ptr :=
               List_Package.Element (Cursor_A);
         begin
            Ada.Text_IO.Put_Line ("Neighbor " &
               To_String (Current_Node_In_List.Name));
         end;
         List_Package.Next (Cursor_A);
      end loop;
   end Print_Neighbors;


   procedure Create_Connection_Unbound_Strings (Old_Neighbor : in out
      Unbounded_String; New_Neighbor : in out Unbounded_String) is
         First_Node_Bool : Boolean;
         Second_Node_Bool : Boolean;
         First_Node : Node_Ptr;
         Second_Node : Node_Ptr;
         Is_Connected : Boolean;
   begin
      --  Checks If Node Exists, If It Does; Get It
      --  Else Make It
      First_Node_Bool := Does_Node_Exist (Old_Neighbor);
      Second_Node_Bool := Does_Node_Exist (New_Neighbor);
      if First_Node_Bool = False then
         First_Node := Create_Node (Old_Neighbor);
      else
         First_Node := Get_Node_From_List (Old_Neighbor);
      end if;
      if Second_Node_Bool = False then
         Second_Node := Create_Node (New_Neighbor);
      else
         Second_Node := Get_Node_From_List (New_Neighbor);
      end if;

      --  Are They Connected?
      Is_Connected := Check_Connection (First_Node, Second_Node);

      if Is_Connected = False then
         Create_Connection (First_Node, Second_Node);
      end if;
   end Create_Connection_Unbound_Strings;

   procedure Remove_Connection_Unbound_Strings (Old_Neighbor :
      in out Unbounded_String; New_Neighbor : in out Unbounded_String) is
         First_Node_Bool : Boolean;
         Second_Node_Bool : Boolean;
         First_Node : Node_Ptr;
         Second_Node : Node_Ptr;
         Is_Connected : Boolean;
   begin
      --  Checks If Node Exists, If It Does; Get It
      --  Else Make It
      First_Node_Bool := Does_Node_Exist (Old_Neighbor);
      Second_Node_Bool := Does_Node_Exist (New_Neighbor);
      if First_Node_Bool = False then
         return;
      else
         First_Node := Get_Node_From_List (Old_Neighbor);
      end if;
      if Second_Node_Bool = False then
         return;
      else
         Second_Node := Get_Node_From_List (New_Neighbor);
      end if;

      --  Are They Connected?
      Is_Connected := Check_Connection (First_Node, Second_Node);

      if Is_Connected then
         Remove_Connection (First_Node, Second_Node);
      end if;

   end Remove_Connection_Unbound_Strings;

   --  Takes Unbound Strings (Names), And Checks The Whole List To Make Sure
   --  That The Node Exists. Then Checks If They're Connected
   procedure Check_Connection_Unbound_Strings (Node_A : in out
      Unbounded_String; Node_B : in out Unbounded_String) is
         First_Node_Bool : Boolean;
         Second_Node_Bool : Boolean;
         First_Node : Node_Ptr;
         Second_Node : Node_Ptr;
         Is_Connected : Boolean;
         Visited : List_Package.List;
   begin
      --  Checks If Node Exists, If It Does; Get It
      --  Else Make It
      First_Node_Bool := Does_Node_Exist (Node_A);
      Second_Node_Bool := Does_Node_Exist (Node_B);
      if First_Node_Bool = False then
         Ada.Text_IO.Put_Line ("- " & To_String (Node_A)
            & " => " & To_String (Node_B));
         return;
      else
         First_Node := Get_Node_From_List (Node_A);
      end if;
      if Second_Node_Bool = False then
         Ada.Text_IO.Put_Line ("- " & To_String (Node_A)
            & " => " & To_String (Node_B));
         return;
      else
         Second_Node := Get_Node_From_List (Node_B);
      end if;

      --  Are They Connected?
      Is_Connected := Check_Connection (First_Node, Second_Node);

      if Is_Connected then
         Ada.Text_IO.Put_Line ("+ " & To_String (First_Node.Name)
            & " => " & To_String (Second_Node.Name));
      else
         List_Package.Append (Visited, First_Node);
         Is_Connected := Breadth_First_Search
            (First_Node, Second_Node, Visited);
         if Is_Connected then
            Ada.Text_IO.Put_Line ("+ " & To_String (First_Node.Name)
               & " => " & To_String (Second_Node.Name));
         else
            Ada.Text_IO.Put_Line ("- " & To_String (First_Node.Name)
               & " => " & To_String (Second_Node.Name));
         end if;
      end if;
   end Check_Connection_Unbound_Strings;


--  Breadth First Search The Graph
   function Breadth_First_Search (Node_A : Node_Ptr; Target_Node :
      Node_Ptr; Visited : List_Package.List) return Boolean is
         Cursor_A : List_Package.Cursor :=
            List_Package.First (Node_A.Neighbors);
            Visited_Nodes : List_Package.List := Visited;
   begin
      --  Checks Direct Connections
      while List_Package.Has_Element (Cursor_A) loop
         declare
            Current_Node_In_List : constant Node_Ptr :=
               List_Package.Element (Cursor_A);
         begin
            if (To_String (Current_Node_In_List.Name) =
               To_String (Target_Node.Name))
            then
                  return True;
            end if;
         end;
         List_Package.Next (Cursor_A);
      end loop;

      Cursor_A :=  List_Package.First (Node_A.Neighbors);
      while List_Package.Has_Element (Cursor_A) loop
         declare
            Current_Node_In_List : constant Node_Ptr :=
               List_Package.Element (Cursor_A);
         begin
            if List_Package.Contains (Visited, Current_Node_In_List)
               = False
            then
                  List_Package.Append (Visited_Nodes, Node_A);
                  return Breadth_First_Search (Current_Node_In_List,
                     Target_Node, Visited);
            end if;
         end;
         List_Package.Next (Cursor_A);
      end loop;


      return False;
   end Breadth_First_Search;

end Graph;
