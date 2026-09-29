from heapq import heappush, heappop

GOAL = (1, 2, 3, 4, 5, 6, 7, 8, 0)  # 0 is the blank tile


def manhattan(state):
    """Sum of tile distances from their goal positions (admissible heuristic)."""
    distance = 0
    for index, tile in enumerate(state):
        if tile == 0:
            continue
        goal_index = tile - 1
        distance += abs(index // 3 - goal_index // 3) + abs(index % 3 - goal_index % 3)
    return distance


def neighbours(state):
    """Slide the blank up/down/left/right; yield the resulting states."""
    blank = state.index(0)
    row, col = blank // 3, blank % 3
    moves = []
    if row > 0:
        moves.append(blank - 3)
    if row < 2:
        moves.append(blank + 3)
    if col > 0:
        moves.append(blank - 1)
    if col < 2:
        moves.append(blank + 1)
    for swap in moves:
        new = list(state)
        new[blank], new[swap] = new[swap], new[blank]
        yield tuple(new)


def solve(start):
    """A* search over the 8-puzzle state space using the Manhattan heuristic."""
    open_list = [(manhattan(start), 0, start)]
    g_score = {start: 0}
    parent = {start: None}

    while open_list:
        f, g, state = heappop(open_list)
        if state == GOAL:
            break
        for nxt in neighbours(state):
            tentative_g = g + 1
            if nxt not in g_score or tentative_g < g_score[nxt]:
                g_score[nxt] = tentative_g
                parent[nxt] = state
                heappush(open_list, (tentative_g + manhattan(nxt), tentative_g, nxt))

    if GOAL not in parent:
        return None

    path = []
    node = GOAL
    while node is not None:
        path.append(node)
        node = parent[node]
    path.reverse()
    return path


def show(state):
    for r in range(0, 9, 3):
        print(" ".join(str(t) if t else "_" for t in state[r:r + 3]))


if __name__ == "__main__":
    start = (1, 2, 3, 4, 0, 6, 7, 5, 8)
    path = solve(start)
    if path is None:
        print("This configuration is unsolvable.")
    else:
        print(f"Solved in {len(path) - 1} moves:\n")
        for step, state in enumerate(path):
            print(f"Move {step}:")
            show(state)
            print()
