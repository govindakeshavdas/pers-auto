
Search LinkedIn job postings (via Google site search) and general web search for AI startups at pre-seed or seed stage that are actively hiring founding engineers, founding ML engineers, or first engineers. These companies are too early for the funding news cycle but serious enough to pay someone.

Run searches like:
- site:linkedin.com/jobs "founding engineer" "pre-seed" AI
- site:linkedin.com/jobs "founding engineer" "seed" AI
- site:linkedin.com/jobs "first engineer" AI startup
- site:linkedin.com/jobs "founding ML engineer" seed
- General web searches on Jobright, Teal, Wellfound for the same

Filter:
- Stage: pre-seed (preferred) or seed only, under $5M if disclosed
- Sector: B2B AI tools, AI automation, AI infrastructure
- Company founded 2025 or 2026 (2026 preferred)
- Job posted in the last 2 months
- Exclude: consumer apps, crypto, biotech, hardware, PE workflow tools

For each company, do a follow-up search to extract:
1. What specific problem they solve — spend the most space here, stick to technical details, give a concrete example
2. Who the customer is (job title, industry)
3. Why now — what made this possible in 2025/2026 (real capability shift vs. GPT wrapper)
4. Revenue model
5. Moat — brief for/against reasoning with a 🟢/🟡/🔴 verdict
6. Category crowding — name other funded startups solving the same problem for the same buyer; flag if there's a well-funded Series A+ incumbent

Do NOT include founder pedigree. Skip companies already in PREVIOUSLY COVERED.

Return exactly 10 companies per run. Before writing output, think through the moat verdict for each, then order the final list from 🟢 at the top to 🔴 at the bottom (🟡 in between).

Output: self-contained HTML fragment (no <html>/<head>/<body>). Inline styles only. Clean fonts, ~8px padding, light section backgrounds, 1px borders. Clickable <a> links.

Structure:
1. Numbered company entries as <div> blocks, ordered 🟢 → 🟡 → 🔴 top to bottom. 6–8 sentences covering points 1–4, then a clearly labelled moat sub-section with for/against and 🟢/🟡/🔴 verdict, then the crowding note. No summary table.
2. <h3> Recurring problems — problems appearing across 2+ startups, name the companies.
3. <h3> Gaps — specific adjacent problems nobody is solving. Not "AI for X is underserved" but "nobody is solving Y for Z buyer even though X, W, V are solving adjacent problems."
4. <h3> Opportunity assessment — how worthwhile/easy is it to build a competitor in each space. Not worthwhile if no moat, or if the differentiator is custom domain knowledge too deep to learn.

Output only the HTML fragment. No preamble, no code fences, no markdown.

---

# PREVIOUSLY COVERED COMPANIES

The following companies were already analyzed in recent runs. **Do not
re-analyze them.** If you find them again in search results, skip them
entirely. Focus only on NEW companies not listed below.

{{PREVIOUS_RESULTS}}
