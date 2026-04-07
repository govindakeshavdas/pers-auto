
Here's the updated full prompt with everything appended:

Search the following sources for AI startups that have raised seed or pre-seed funding in the last 2 months:
Sources to search — these are just starting points, cast wide:
* TechCrunch (techcrunch.com)
* Y Combinator recent batches (ycombinator.com)
* Crunchbase (crunchbase.com)
* Axios Pro Rata
* The Information
* SeedScout
* Tracxn
* thesaasnews.com
* fundz.net
* producthunt.com
* indiehackers.com
* saastr.com
* getlatka.com
* dot.la
* VentureBeat
* aifundingtracker.com
Also run broad general web searches — this is critical for finding deals that don't get covered by major outlets. Search things like: "pre-seed AI B2B [month] [year]", "seed round AI automation [month]", "AI startup raises [amount] B2B [month]". Cast as wide a net as possible. Prioritize volume of verified deals over depth on any single one.
Filter criteria:
* Funding amount: under $5M
* Stage: pre-seed (preferred) or seed only
* Sector: B2B AI tools, AI automation, AI infrastructure
* Preferred sector: anything related to real estate (proptech, property
  management, real estate transactions, tenant/landlord tools, CRE analytics,
  etc.) — surface these even if they slightly stretch other filters
* Exclude: consumer apps, crypto, biotech, hardware
* Exclude: private equity deal analysis / PE workflow tools — skip entirely
For each startup found, extract these 8 things:
1. What specific problem they solve ( spend the most space explaining this --- showing example , stick to the technical details )
2. Very briefly discuss their moat 
3. Category crowding — Are there other funded startups solving the same problem for the same buyer? Name them. Flag if the category already has a well-funded incumbent at Series A or beyond.
4. Importantly dont go into the pedigree of the founders etc - i dont care and it puts me off from reading further ... 

Output format:

Return a self-contained **HTML fragment** (no `<html>`, `<head>`, or `<body>`
wrappers — it will be embedded into a Gmail email).

Requirements:
- Inline `style="..."` only. No `<style>` blocks. No external CSS.
- Style for Gmail readability: clean fonts, ~8px padding, light section
  backgrounds, 1px borders where helpful.
- Make links clickable with `<a href="...">`.

Structure the HTML as follows:

1. **Company entries** — Write every company as a numbered entry using `<div>`
   blocks. Aim for 20–30+ companies — do not stop early. For each company
   write 6–8 sentences covering points 1–6, then show the full moat reasoning
   (point 7) as its own clearly labelled sub-section with the for/against
   structure and a final verdict using the emoji indicators (🟢/🟡/🔴), then
   close with the crowding note (point 8). Skip a summary table.

2. **Recurring problems** — `<h3>` section. Which problems appear across 2 or
   more startups. Name the companies sharing each problem.

3. **Gaps** — `<h3>` section. Adjacent problems that nobody in this batch seems
   to be solving yet. Be specific — not "AI for X is underserved" but "nobody
   is solving Y for Z buyer even though X, W, and V are all solving adjacent
   problems."

4. **Opportunity assessment** — `<h3>` section. How worthwhile or easy is it
   for me to make a competitor in each space. My goal is to work on one of
   these spaces.
   - It's not worthwhile if there is no moat.
   - It's not as worthwhile if the amount of custom knowledge is the true
     differentiator — and it's too high — and cannot be learnt.

Output **only** the HTML fragment. No preamble, no explanation, no code
fences, no markdown.

---

# PREVIOUSLY COVERED COMPANIES

The following companies were already analyzed in recent runs. **Do not
re-analyze them.** If you find them again in search results, skip them
entirely. Focus only on NEW companies not listed below.

{{PREVIOUS_RESULTS}}
