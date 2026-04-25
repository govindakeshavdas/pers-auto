Search LinkedIn job postings (via Google site search) and general web search for AI startups at pre-seed or seed stage that are actively hiring founding engineers, founding ML engineers, or first engineers. These companies are too early for the funding news cycle but serious enough to pay someone.

**Goal:** I am looking for niches where a solo founder or 2-person team could realistically bootstrap a competitor — ship product, land paying customers on product merit, and reach meaningful revenue without raising. Maybe raise later, but the starting move is bootstrapped. So this is NOT a hunt for venture-scale opportunities. Surface companies operating in spaces where bootstrapping is plausible, and flag the ones operating in spaces where it isn't.

Run searches like:
- site:linkedin.com/jobs "founding engineer" "AI automation"
- site:linkedin.com/jobs "founding engineer" "AI agent"
- site:linkedin.com/jobs "founding engineer" "AI coworker"
- site:linkedin.com/jobs "founding engineer" "AI workflow"
- site:linkedin.com/jobs "first engineer" "AI automation"
- site:linkedin.com/jobs "founding ML engineer" "AI agent"
- General web searches on Jobright, Teal, Wellfound for the same

**Bias toward earlier-stage hiring phrasing.** "Founding engineer" has become a buzzword that already-polished YC-backed companies use. The smaller, earlier companies you actually want use phrases like:
- site:linkedin.com/jobs "engineer #1" AI
- site:linkedin.com/jobs "engineer #2" AI
- site:linkedin.com/jobs "engineer #3" AI
- site:linkedin.com/jobs "first technical hire" AI
- site:linkedin.com/jobs "first engineering hire" AI
- site:linkedin.com/jobs "stealth" AI engineer
- site:linkedin.com/jobs "stealth startup" AI

Run several of these alongside the "founding engineer" searches each run. Companies posting these are usually 1–3 people total — exactly the niche-traction signal we want. The `"stealth"` searches in particular surface slightly underfunded, under-the-radar ideas — exactly the kind of opportunity worth investigating.

**Prefer tiny companies.** When LinkedIn shows the company size, prefer postings from companies with 1–10 employees. 11–50 is acceptable but lower priority. Anything larger should be deprioritized — they're past the stage we care about.

Cast wide across industries. Pick a handful of different verticals on your own each run and rotate through them so results don't skew toward a single sector or toward the YC/SF infra cluster. Applied/vertical AI companies are as important as horizontal infra — don't let the first pass be all one kind.

**Use the job description itself as the primary traction signal.** This is the highest-signal cue available — much higher than press releases or social posts. When reading a JD, look for and weight heavily:
- Named design partners or named customers ("design partners include [Fortune 500 name]", "working with 3 named GCs", "shipping with [specific company]")
- Concrete customer counts in a vertical ("first 10 paying customers in healthcare", "12 mid-market logistics customers")
- Revenue or contract specifics mentioned casually
- Founder backgrounds rooted in the **vertical** (ex-construction PM, ex-insurance broker, ex-radiologist) rather than ex-Stripe / ex-OpenAI / ex-FAANG
- Non-technical founders hiring their first engineer — this is often a domain expert who saw a real problem in their industry and is now building

Companies showing these JD signals should rise to the top of the list, even if their funding/press footprint is small.

**Deprioritize already-hyped companies.** If a company has prominent TechCrunch, VentureBeat, Axios Pro Rata, or Forbes coverage, deprioritize it — the goal here is to find niches *before* they're crowded by hype-followers. The inverse of normal signal: less press = better fit for what we're hunting.

Apply stage and recency as a POST-FILTER (not as search keywords). For each company that looks promising, do a follow-up search to confirm:
- Stage: pre-seed (preferred) or seed only, under $5M if disclosed
- Sector: B2B AI tools, AI automation, AI infrastructure, or vertical applied AI
- Company founded 2025 or 2026 (2026 preferred)
- Job posted in the last 2 months
- Exclude: consumer apps, crypto, biotech, hardware, PE workflow tools

For each company, extract:
1. What specific problem they solve — spend the most space here, stick to technical details, give a concrete example
2. Who the customer is (job title, industry)
3. Why now — what made this possible in 2025/2026 (real capability shift vs. GPT wrapper)
4. Revenue model
5. **Bootstrap fit** — apply the rubric below and produce a 🟢/🟡/🔴 verdict
6. Category crowding — who else is in this space, how many, how mature. Skip the "well-funded Series A+ incumbent" framing; that's venture-flavored. Just describe the competitive landscape briefly.

**Bootstrap-fit rubric** (this replaces moat analysis):

The question is: *could a solo founder or small bootstrapped team realistically enter and win in this space?* Run two tests:

- **Thin-wrapper test.** Is the product an obvious LLM-as-judge / thin-wrapper play (insurance adjudication, claims review, contract review, "AI grades X")? If yes → bad target. Reason: zero technical depth, the next bootstrapper or the foundation model providers themselves can replicate it trivially. Race to zero.
- **Insider-access test.** Does selling into this market require relationships an outsider can't build (government procurement, defense, niche regulated buyers where you need to know specific people)? If yes → bad target. Reason: the moat is years of relationship-building that a bootstrapper can't shortcut, regardless of product quality.

Verdict scale:
- 🟢 = good bootstrap target. Real product depth (not just an LLM wrapper) AND sellable on product merit to outsiders. A small team could plausibly land paying customers.
- 🟡 = mixed. One real concern (e.g., space is crowded, or there's some insider angle but most sales are still product-led). Worth investigating but with caveats.
- 🔴 = bad target. Fails either the thin-wrapper test or the insider-access test. Skip as a competitive opportunity.

Write a short for/against under the Bootstrap fit sub-section, then the verdict.

Do NOT include founder pedigree. **Significantly prefer non-YC companies.** YC-backed companies have funding, network, and reputation tailwinds from day one that make them poor competitive targets for a bootstrapper. Include a YC company only if no comparable non-YC equivalent surfaces in this run, and when included, flag it explicitly (e.g., "(YC F25 — included for lack of non-YC equivalent)"). Skip companies already in PREVIOUSLY COVERED.

Return exactly 10 companies per run. Before writing output, think through the bootstrap-fit verdict for each, then order the final list from 🟢 at the top to 🔴 at the bottom (🟡 in between).

Output: self-contained HTML fragment (no <html>/<head>/<body>). Inline styles only. Clean fonts, ~8px padding, light section backgrounds, 1px borders. Clickable <a> links.

Structure:
1. Numbered company entries as <div> blocks, ordered 🟢 → 🟡 → 🔴 top to bottom. 6–8 sentences covering points 1–4, then a clearly labelled **Bootstrap fit** sub-section with for/against and 🟢/🟡/🔴 verdict, then the crowding note. No summary table.
2. <h3> Recurring problems — problems appearing across 2+ startups, name the companies.
3. <h3> Gaps — specific adjacent problems nobody is solving. Not "AI for X is underserved" but "nobody is solving Y for Z buyer even though X, W, V are solving adjacent problems."
4. <h3> Bootstrap viability — for each promising space, could a solo founder or 2-person team realistically land paying customers and reach ~$10K MRR without raising? What's the most plausible wedge? Skip spaces that fail the thin-wrapper or insider-access tests.

Output only the HTML fragment. No preamble, no code fences, no markdown.

---

# PREVIOUSLY COVERED COMPANIES

The following companies were already analyzed in recent runs. **Do not re-analyze them.** If you find them again in search results, skip them entirely. Focus only on NEW companies not listed below.

{{PREVIOUS_RESULTS}}