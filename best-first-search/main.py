from heapq import heappush, heappop


def neighbours(graph, vertex):
    return graph[vertex]


def best_first_search(graph, start, goal, heuristics):
    open_list = [(heuristics[start], start)]  
    closed_list = {}                         
    closed_list[start] = None

    while open_list:
        h, vertex = heappop(open_list)

        if vertex == goal:
            break

        for neighbour in neighbours(graph, vertex):
            if neighbour not in closed_list:
                closed_list[neighbour] = vertex
                heappush(open_list, (heuristics[neighbour], neighbour))

    path = []
    node = goal
    while node is not None:
        path.append(node)
        node = closed_list.get(node)
    path.reverse()
    return path


if __name__ == "__main__":
    adjacency_list = {
        "S": ["A", "B", "C"],
        "A": ["D"],
        "B": ["D", "H"],
        "C": ["G"],
        "D": ["F"],
        "F": [],
        "G": ["H"],
        "H": ["E"],
        "E": [],
    }
    heuristics = {
        "S": 0, "A": 9, "B": 7, "C": 8,
        "D": 8, "E": 0, "F": 6, "G": 6, "H": 3,
    }

    print("Best-First Search S -> E:",best_first_search(adjacency_list, "S", "E", heuristics),)
