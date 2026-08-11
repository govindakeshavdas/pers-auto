# CONTEXT

I live in the SF Bay Area. Once a week I want a full picture of what is
happening in the local tech / startup / builder scene in the week ahead.

I am deliberately not telling you what I work on or what I am interested in.
Do not guess, and do not optimize the list toward any topic. Every event is
worth at least looking at. My job is to decide; your job is to show me the
board and tell me what each thing actually is.

---

# YOUR JOB

Every run:

1. Search the web fresh and find as many real, dated, in-person events as you
   can in the Bay Area (SF, peninsula, East Bay, South Bay) that start on or
   after {{TODAY}} and fall within the following 7 days.
2. Classify each event — what kind of thing it is, and who is actually in the
   room.
3. Score each event on the rubric below.
4. Return **everything you found**, ranked by score. Do not filter. Do not
   trim the list to the good ones. A low score is information, not a reason
   to hide an event from me.

Treat {{TODAY}} as the authoritative current date.

No files. No memory of previous runs. Just search, classify, score, rank.

---

# HOW TO SEARCH

Work out your own approach. I am not giving you queries, sites, or
communities on purpose — a fixed recipe returns a fixed answer, and I want
the search itself to vary run to run. Come at it from several different
angles rather than one.

Be exhaustive, not efficient. Use your full search budget. Keep searching
until new searches stop surfacing events you have not already found. A short
list means you stopped early, not that the week was quiet.

Hard rules:

- Only include events whose start date you can actually confirm. If you
  cannot confirm the date after searching, drop the event rather than guess.
- Every link must be a page you actually saw in search results. Never
  construct, guess, or pattern-match a URL.
- Exclude virtual-only events, and anything that has already happened.
- Exclude nothing else. Not pitch nights, not recruiting events, not big
  corporate ones. Tag them and score them instead.

---

# CLASSIFY

For each event, give me three things:

**Type** — pick the closest:
hack night / workshop · demo night · talk or panel · conference or summit ·
dinner or salon · mixer or social · pitch or investor event · hiring event ·
recurring user group · other (say what)

**Room** — one short, honest phrase on who actually shows up. Specific beats
flattering: "~20 people, working engineers", "mostly recruiters and vendors",
"large and mixed", "new event, unknown crowd".

**Scale** — rough expected headcount if you can tell, otherwise "unknown".

---

# RUBRIC

Four axes, max 17. Score the event on its own merits. You have no information
about my interests — do not invent any and do not score for fit to a topic.

1. **Crowd** (1-5) — Are the people in the room doing the work (builders,
   operators, researchers), or spectating (recruiters, vendors, tourists,
   professional networkers)?
2. **Substance** (1-5) — Will real products, real numbers, and real problems
   get discussed, or is it surface-level takes and small talk?
3. **Friction** (1-5) — Cost, timing, travel, RSVP difficulty. Free or cheap,
   evening, and reachable anywhere in the Bay scores high. Do not penalise an
   event for being outside San Francisco — South Bay, peninsula and East Bay
   are all fine.
4. **Novelty** (0-2) — Is this new, unusual, or hard to stumble across? A
   recurring series that runs every single week scores 0; a one-off or a first
   edition scores 2. This is a small tiebreaker only, not a main signal.

Show the four sub-scores. Do not collapse them into a total only.

---

# OUTPUT

Return a self-contained **HTML fragment** (no `<html>`, `<head>`, or `<body>`
wrappers — it will be embedded into a Gmail email).

Structure:

1. One short `<p>` reading the week at a glance — how many events you found,
   and any pattern worth noting (e.g. "unusually heavy on hiring events",
   "three separate hardware nights").
2. An inline-styled `<table>`, sorted by score descending, with columns:
   **Event | Date & time | Type | Room | Score /17 | Link**
   - Score cell shows the total and the breakdown, e.g. `13` then a smaller
     line `crowd 4 · substance 5 · friction 3 · novelty 1`.
   - Link text is the domain only, not the full URL.
   - Bold the top row.
3. After the table, one `<p>` each for the top three: what it is and why it
   scored where it did. Two sentences max each.

Formatting requirements:

- Inline `style="..."` only. No `<style>` blocks. No external CSS.
- Gmail-safe table: border-collapse, ~8px cell padding, light header
  background, simple 1px borders.
- Include every event you found, however low it scored.

Output **only** the HTML fragment. No preamble, no explanation, no code
fences, no markdown.
