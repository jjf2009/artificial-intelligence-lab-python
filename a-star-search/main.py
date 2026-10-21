from heapq import heappush, heappop


def a_star_search(graph, start, goal, heuristics):
    open_list = [(heuristics[start], 0, start)] 
    closed_list = []
    g_score = {start: 0}
    parent = {start: None}

    while open_list:
        f, g, vertex = heappop(open_list)
        if g > g_score[vertex]:
            continue
        closed_list.append((vertex, parent[vertex], f))
        if vertex == goal:
            break

        for neighbour, cost in graph[vertex]:
            tentative_g = g + cost
            if neighbour not in g_score or tentative_g < g_score[neighbour]:
                g_score[neighbour] = tentative_g
                parent[neighbour] = vertex
                heappush(open_list, (tentative_g + heuristics[neighbour], tentative_g, neighbour))

    final_open_list = [
        (node, parent.get(node), f)
        for f, g, node in open_list
        if g == g_score[node]
    ]
    print("Final open list:", final_open_list)
    print("Final closed list:", closed_list)

    if goal not in parent:
        return None, float("inf")

    path = []
    node = goal
    while node is not None:
        path.append(node)
        node = parent[node]
    path.reverse()

    return path, g_score[goal]


if __name__ == "__main__":
 graph = {
    "S": [("A", 1), ("B", 4)],
    "A": [("B", 2), ("C", 5), ("D", 7)],
    "B": [("C", 2), ("E", 6)],
    "C": [("F", 3), ("G", 8)],
    "D": [("G", 9)],
    "E": [("G", 5), ("H", 2)],
    "F": [("G", 3)],
    "H": [("G", 1)],
    "G": [],
}

heuristics = {"S": 9, "A": 8, "B": 6, "C": 4, "D": 7,
              "E": 2, "F": 2, "H": 1, "G": 0}

path, cost = a_star_search(graph, "S", "G", heuristics)
print("A* path S -> G:", path)
print("Total cost:", cost)
