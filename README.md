# Artificial Intelligence Lab (Python)

Python implementations of classic AI search and optimization algorithms, done as
college lab practicals for **CMP-305 Artificial Intelligence Lab**, B.E. Computer
Engineering (Goa University, NEP 2024-25 curriculum).

## Contents

| Exp | Folder | Algorithm |
|---|---|---|
| 1 | [water-jug-problem](water-jug-problem) | Water Jug Problem — classical AI problem, solved via BFS and DFS |
| 2 | [depth-first-search](depth-first-search) | Depth-First Search (adjacency list, connectivity, reachability, distance) |
| 3 | [breadth-first-search](breadth-first-search) | Breadth-First Search (adjacency list & matrix, connectivity, reachability) |
| 4 | [best-first-search](best-first-search) | Greedy Best-First Search (heuristic-guided) |
| 5 | [hill-climbing](hill-climbing) | Simple Hill Climbing (continuous optimization) |
| 6 | [hill-climbing-variation](hill-climbing-variation) | Steepest-ascent and random-restart Hill Climbing |
| 7 | [a-star-search](a-star-search) | A\* Search (`f = g + h`, optimal informed search) |
| 8 | [eight-puzzle](eight-puzzle) | Eight-Puzzle solver — A\* with Manhattan distance (game playing) |
| 9 | [expert-system-prolog](expert-system-prolog) | Animal-identification Expert System (Prolog) |
| 10 | [resolution-prolog](resolution-prolog) | Logical inference by Resolution (Prolog) |
| — | [python-basics](python-basics) | Python fundamentals (prerequisite exercises) |

Each folder is self-contained, has its own README, and runs with
`python3 main.py`.

## Syllabus reference

Covers all ten CMP-305 experiments and the four course outcomes: state-space
search (Exp 1), uninformed vs. informed search (Exp 2–4, 7), local optimization
search (Exp 5–6), game playing (Exp 8), and knowledge-based systems and inference
in Prolog (Exp 9–10).

## Requirements

Experiments 1–8 use **Python 3** only — no third-party packages (standard-library
`collections.deque`, `heapq`). Experiments 9–10 are Prolog and need
[SWI-Prolog](https://www.swi-prolog.org/) (`swipl`).
