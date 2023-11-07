-- Author: Ava Crocker, acrocker2021@my.fit.edu
-- Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
-- Course: CSE 4250, Fall 2023
-- Project: Proj3, Can you hear me now?
-- Language implementation: GNAT Community 2021 (20210519-103)

with Ada.Text_IO;

package Graph is
    package Node is
        Name : String;
        type String_Array is array (0 .. 50) of String;
        End_Of_Index : Integer := 0;
    end Node;

    -- Adds Connections Between 2 Nodes
    function Create_Connection
       (Current_Node : Node; New_Connection_Node : Node) return Boolean
    is
    begin
        Current_Node.String_Array (Current_Node.End_Of_Index)               :=
           New_Connection_Node.Name;
        Current_Node.End_Of_Index := Current_Node.End_Of_Index + 1;
        New_Connection_Node.String_Array (New_Connection_Node.End_Of_Index) :=
           Current_Node.Name;
        New_Connection_Node.End_Of_Index                                    :=
           New_Connection_Node.End_Of_Index + 1;
        return True;
    end Create_Connection;

-- Checks Connection Between 2 Nodes
    function Check_Connection
       (Current_Node : Node; Comparable_Node : Node) return Boolean
    is
        doesContain : Boolean := False;
    begin
        for i in Current_Node.String_Array'Range loop
            if (Current_Node.String_Array (i) = Comparable_Node.Name) then
                doesContain := True;
            end if;
        end loop;
        return doesContain;
    end Check_Connection;

end Graph;
