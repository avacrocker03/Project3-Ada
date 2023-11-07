-- Author: Ava Crocker, acrocker2021@my.fit.edu
-- Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
-- Course: CSE 4250, Fall 2023
-- Project: Proj3, Can you hear me now?
-- Language implementation: GNAT Community 2021 (20210519-103)

-- graph.ads
package Graph is

    type Vertex_Type;
    Name : String;
    procedure Initialize (Graph : out Graph_Type);
    procedure Add_Link
       (Graph : in out Graph_Type; Source, Destination : Vertex_Type);
    procedure Remove_Link
       (Graph : in out Graph_Type; Source, Destination : Vertex_Type);
    function Has_Link
       (Graph : Graph_Type; Source, Destination : Vertex_Type) return Boolean;
    -- Add other procedures/functions as needed.
end Graph;
