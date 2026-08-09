Search Google and job search sites for job postings from AI startups at pre-seed or seed stage that are actively hiring for early roles. These companies are too early for the funding news cycle but serious enough to pay someone.

**Goal:** I am looking for niches where a solo founder or 2-person team could realistically bootstrap a competitor — ship product, land paying customers on product merit, and reach meaningful revenue without raising. Maybe raise later, but the starting move is bootstrapped. So this is NOT a hunt for venture-scale opportunities. Surface companies operating in spaces where bootstrapping is plausible, and flag the ones operating in spaces where it isn't.

**How to search.** Combine early-hire phrasing with AI product terms, and vary both each run. Don't lock onto one role title — "founding engineer" is only one way a tiny company writes this. Equally good: "first engineer", "engineer #1/#2/#3", "first technical hire", "first engineering hire", "founding ML engineer", "founding AI engineer", "first product hire", "stealth startup", and any similar phrasing you come up with. Pair those with terms like AI agent, AI automation, AI workflow, AI coworker, applied AI, and whatever verticals you're rotating through this run.

Run these across Google and job search sites (Jobright, Teal, Wellfound, Y Combinator's job board, company careers pages, etc.). Rotate the exact phrasings between runs so results don't repeat.

Companies posting these are usually 1–3 people total — exactly the niche-traction signal we want. The "stealth" searches in particular surface slightly underfunded, under-the-radar ideas — exactly the kind of opportunity worth investigating. Note that "founding engineer" has become a buzzword that already-polished YC-backed companies use, so weight the scrappier phrasings higher.

**Prefer tiny companies.** When the posting or company page shows the company size, prefer postings from companies with 1–10 employees. 11–50 is acceptable but lower priority. Anything larger should be deprioritized — they're past the stage we care about.

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
- Stage: pre-seed (preferred) or seed only, under $10M if disclosed
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

**Bootstrap-fit rubric**

Apply in order. **First failure stops the evaluation — verdict is 🔴.** Do not average.
Be harsh. A 🔴 costs me nothing; a false 🟢 costs me weeks. When a gate is
arguable, it fails.

1. **Objectivity (cheapest kill — run it first).** Would two competent people,
   given the same input and no discussion, produce the same output? If the product
   emits a score, a rating, a judgment call, a policy call, a recommendation, or
   anything described as "insights", the answer is no → 🔴. Adding a rubric does
   not fix this; the rubric *is* the subjective part, and the customer will always
   have their own.

   **Auto-🔴, no further analysis:** content moderation / trust & safety calls,
   call-center or sales-call QA and scoring, coaching and performance feedback,
   demo or pitch quality, branding, naming, copy, growth strategy, design taste,
   candidate or resume ranking, "AI decides what's good."

   The passing shape: output is checkable against something outside anyone's
   opinion — a spec, a physical measurement, a round-trip, a diff between two
   systems, a number that reconciles.

2. **Who owns the value.** Delete the LLM from the product. What is left?
   - *Domain knowledge* (immigration rules, manufacturing process, claims practice,
     tax code, building code) → 🔴. The winner here is whoever has the domain
     experts, and they can hire one engineer to catch up. I am not positioned to
     win that race, and "I'll learn the domain" is not an asset.
   - *A technical system* (a measurement harness, a dataset I built, a pipeline, a
     benchmark, a comparison engine) → passes.

   Explicit test: **would an existing domain firm beat me by hiring one developer?**
   Yes → 🔴. If a JD's founder story is "domain expert hiring first engineer", that
   is a strong traction signal (keep surfacing it) *and* usually a 🔴 for me — say
   both.

3. **Durability.** In 18 months, what stops the next indie dev — or the model
   provider — from shipping this in a weekend? The answer must *accumulate*: a
   dataset I built, an eval harness, a benchmark, hard-won technical depth.
   "Better taste", "better prompts", "we're first", "we know the vertical" do not
   accumulate. Nothing accumulates → 🔴. A single-function utility a platform
   would absorb as a feature, or a thin layer over one model call → 🔴.

4. **Day one for customer #1.** Describe literally what the first customer
   receives in week one, and what it was built from. It must be useful with **zero
   accumulated data** — mine or theirs. 🔴 if value only appears after: their
   historical records, a corpus I don't have, a live integration into their
   systems (ERP, EHR, CRM, ticket history, claim files, security logs), a licensed
   or proprietary feed, or many customers' data pooled together.
   Data-network-effect businesses are good venture bets and terrible bootstraps —
   the cold start never resolves for a solo founder. Name it as a cold start and
   fail it.

   Constructing my own dataset is fine and is usually the thing from gate 3 that
   accumulates — but only if I can construct it alone, before any customer.

5. **Buyer.** Can I reach the buyer alone, and will they pay? Fails: consumers,
   prosumers, job seekers, anything freemium-shaped — low willingness to pay and
   saturated with indie devs. Also fails: procurement- or relationship-gated buyers
   (government, defense, regulated niches).

Verdict:
- 🟢 passes all five. Name the thing that accumulates.
- 🟡 real depth, but I can name what erodes the barrier.
- 🔴 fails any one.

Write-up: under **Bootstrap fit**, five short lines — what makes correctness
objective, what's left when the LLM is deleted, what accumulates, what customer #1
gets in week one from zero data, who pays. Then the verdict. "Unclear" on any line
is 🔴, not 🟡.

**Calibration — I have already rejected these. Match this severity.**

| Idea | Verdict | Gate |
|---|---|---|
| Insurance-defense litigation intelligence | 🔴 | 4 — needs a case corpus I'll never have; useless to customer #1 |
| Agentic trust & safety moderation | 🔴 | 1 — moderation calls are subjective; also a thin layer |
| AI manufacturing engineer for factories | 🔴 | 2 — wrapper + domain experts own it |
| Voice agents that demo and close B2B deals | 🔴 | 1 — demo quality is taste |
| Immigration & visa management for employers | 🔴 | 2 — wrapper + immigration expertise owns it |
| Call-center QA & coaching | 🔴 | 1 — scoring and coaching are subjective |
| AI branding / naming platform | 🔴 | 1 — pure taste, zero moat |
| Growth-strategy platform for founders | 🔴 | 1 + 4 — subjective and cold-start |
| Job-search automation for seekers | 🔴 | 5 — freemium, indie-dev race to the bottom |
| Landscaping takeoffs & cost estimation | 🟡 | 3 — real work, but commoditizes |
| Real-time voice translation infra | 🟡 | 3 — real tech, but large providers absorb it |

Accepted shape, for contrast — a pre-TTS pronunciation checker: fan a customer's
term list out across several TTS providers, run ASR back, flag where providers
disagree, and export a lexicon the customer owns. Objective (round-trip mismatch is
mechanically measurable), the value is a comparison harness not domain knowledge,
the term list arrives in the first five minutes, and the verified lexicon
accumulates. **That is the bar for 🟢.**

Do NOT include founder pedigree. **Significantly prefer non-YC companies.** YC-backed companies have funding, network, and reputation tailwinds from day one that make them poor competitive targets for a bootstrapper. Include a YC company only if no comparable non-YC equivalent surfaces in this run, and when included, flag it explicitly (e.g., "(YC F25 — included for lack of non-YC equivalent)"). Skip companies already in PREVIOUSLY COVERED.

Return exactly 10 companies per run. Before writing output, think through the bootstrap-fit verdict for each, then order the final list from 🟢 at the top to 🔴 at the bottom (🟡 in between).

Output: self-contained HTML fragment (no <html>/<head>/<body>). Inline styles only. Clean fonts, ~8px padding, light section backgrounds, 1px borders. Clickable <a> links.

Structure: numbered company entries as <div> blocks, ordered 🟢 → 🟡 → 🔴 top to bottom. 6–8 sentences covering points 1–4, then a clearly labelled **Bootstrap fit** sub-section with the five write-up lines and the 🟢/🟡/🔴 verdict, then the crowding note. No summary table.

Immediately before each entry's `<div>`, emit an HTML comment naming the company, exactly in this form and on its own line:

    <!-- COMPANY 1: Acme AI -->

Use the plain company name only — no tagline, no URL, no verdict. This is parsed by a script to build the previously-covered list, so the format must match exactly for every entry.

Company entries only. Do not add cross-company synthesis sections — no "Recurring problems", no "Gaps", no "Bootstrap viability" round-up, no closing commentary of any kind. End the output after the last company entry.

Output only the HTML fragment. No preamble, no code fences, no markdown.

---

# PREVIOUSLY COVERED COMPANIES

Every company sent in any previous run is listed below — this list is complete, not a recent sample. **Do not include any of them.** If one turns up in search results, skip it entirely and keep searching. Return only companies absent from this list.

Do not restate this instruction in the output, and do not claim to have excluded a range of runs — you have names, not run numbers.

{{PREVIOUS_RESULTS}}