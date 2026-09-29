from heapq import heappush, heappop


def a_star_search(graph, start, goal, heuristics):
    open_list = [(heuristics[start], 0, start)]  # (f = g + h, g, vertex)
    g_score = {start: 0}
    parent = {start: None}

    while open_list:
        f, g, vertex = heappop(open_list)

        # Skip stale heap entries; a cheaper path to this vertex was found after
        # it was queued. Reopening this way keeps A* optimal even when the
        # heuristic is admissible but not consistent.
        if g > g_score[vertex]:
            continue
        if vertex == goal:
            break

        for neighbour, cost in graph[vertex]:
            tentative_g = g + cost
            if neighbour not in g_score or tentative_g < g_score[neighbour]:
                g_score[neighbour] = tentative_g
                parent[neighbour] = vertex
                heappush(open_list, (tentative_g + heuristics[neighbour], tentative_g, neighbour))

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
    # graph[vertex] = list of (neighbour, edge_cost)
    graph = {
        "S": [("A", 1), ("B", 4)],
        "A": [("B", 2), ("C", 5), ("G", 12)],
        "B": [("C", 2)],
        "C": [("G", 3)],
        "G": [],
    }
    heuristics = {"S": 7, "A": 6, "B": 2, "C": 1, "G": 0}

    path, cost = a_star_search(graph, "S", "G", heuristics)
    print("A* path S -> G:", path)
    print("Total cost:", cost)
