# Expert System (Prolog)

**AI Lab — Experiment 9: Develop an expert system using Prolog.**

`expert_system.pl` is a small backward-chaining **animal-identification** expert
system. Rules describe each animal in terms of characteristics (mammal,
carnivore, has stripes, …); Prolog's inference engine works backward from the
`animal/1` goal, asking the user about primitive facts only when it needs them
and remembering the answers.

## Knowledge base

- **Rules** — `animal(cheetah) :- mammal, carnivore, has(tawny_colour), has(dark_spots).`
- **Intermediate conclusions** — `mammal`, `bird`, `carnivore`, `ungulate`.
- **`ask/2`** — queries the user (`yes.`/`no.`), caching each reply with
  `assertz` so it is never asked twice.

## Run

Requires [SWI-Prolog](https://www.swi-prolog.org/).

```bash
swipl expert_system.pl
?- identify.
```

Answer the `yes.`/`no.` prompts (note the trailing period) and the system names
the animal, or reports that it cannot identify it.
