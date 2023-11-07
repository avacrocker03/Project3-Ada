-- Author: Ava Crocker, acrocker2021@my.fit.edu
-- Author: Tommy Gingrelli, tgingrelli2021@my.fit.edu
-- Course: CSE 4250, Fall 2023
-- Project: Proj3, Can you hear me now?
-- Language implementation: GNAT Community 2021 (20210519-103)

-- graph.ads
package Graph is

-- Create Connection Adds The Name Of The New Connection To The Current Node And Vice Versa
    function Create_Connection
       (Current_Node : Node; New_Connection_Node : Node) return Boolean;

-- Check Connection Goes Through The CurrentNode's List And Checks To See If It Is In There
    function Check_Connection
       (Current_Node : Node; Comparable_Node : Node) return Boolean;

end Graph;
