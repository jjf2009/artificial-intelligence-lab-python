#1.Create a graph with five nodes , give the edges some cost ,one is the source node and other target node , find neigbour of the first node


graph = {
        "S": [("A", 1), ("B", 4)],
        "A": [("B", 2), ("C", 5), ("G", 12)],
        "B": [("C", 2)],
        "C": [("G", 3)],
        "G": [],
    }

print(graph)

print(graph["S"])
g = input("Goal Node:")
print(graph[g])

#path from start to goal 
path = ""
visited =[5]*False
def bfs(node,path,goal,visited):
 if node == goal:
   path.append(goal)
   return
 visited[node] = True;
 for u in graph[node]:
   if visited[u]==False:
      path.append(u)
      bfs[u,path,visited]
     

