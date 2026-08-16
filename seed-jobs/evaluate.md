Today is {{TODAY}}.

Two earlier passes produced the shortlist at the bottom of this prompt: one searched job postings and collected candidates, a second read their descriptions and kept the most promising. Companies covered in earlier runs were removed by script — every company below is new. Your job is to research them, judge them, and write up the ones worth my time.

**Goal:** I am looking for niches where a solo founder or 2-person team could realistically bootstrap a competitor — ship product, land paying customers on product merit, and reach meaningful revenue without raising. Maybe raise later, but the starting move is bootstrapped. So this is NOT a hunt for venture-scale opportunities. Surface companies operating in spaces where bootstrapping is plausible, and flag the ones operating in spaces where it isn't.

**Work in this order.**

1. **Research the shortlist.** The list is short because a triage pass already dropped the obvious failures — these are the companies worth spending searches on, so search them rather than re-judging them from their one-liners. Verify for each:
   - Stage: pre-seed (preferred) or seed only, under $10M if disclosed
   - Sector: B2B AI tools, AI automation, AI infrastructure, or vertical applied AI
   - Company founded 2025 or 2026 (2026 preferred)
   - Job posted in the last 2 months
   - Exclude: consumer apps, crypto, biotech, hardware, PE workflow tools
2. **Then apply the full rubric** — all five gates — and write up whatever is left.

Spend your searches evenly rather than exhausting them on the first few companies. If the budget runs out before the list does, judge the remainder on what you already know and say what is unverified — do not silently drop them.

The shortlist is unverified — earlier passes worked from job-posting text without checking any of the above. Treat every claim in it as a lead, not a fact. Dropping a good share of the list is the expected outcome; a triage pass filtered on the description alone, which is thin evidence, so expect some to fail once you see the real product.

For each surviving company, extract:
1. What specific problem they solve — give this the most bullets, stick to technical details, give a concrete example
2. Who the customer is (job title, industry)
3. Why now — what made this possible in 2025/2026 (real capability shift vs. GPT wrapper)
4. Revenue model
5. **Bootstrap fit** — apply the rubric below and produce a 🟢/🟡/🔴 verdict
6. Category crowding — who else is in this space, how many, how mature. Skip the "well-funded Series A+ incumbent" framing; that's venture-flavored. Just describe the competitive landscape briefly.

**Bootstrap-fit rubric**

Apply in order. **First failure stops the evaluation — verdict is 🔴.** Do not average.
Be harsh. A 🔴 costs me nothing; a false 🟢 costs me weeks. When a gate is
arguable, it fails.


**1. Highly subjective / Taste / Judgement  : If the result is some report that is subjective , design content . Another example is some expert using their insight into a prompt like a lawyer adding their insight into cases into a product . This is too subjective and im not that expert with taste . There are a lot of products builnt on expert taste or judgement . -> Auto-🔴 

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
   Also: is the grader mine, physical, or a public standard — or rented from a
   third party who can change or kill it? Rented → 🔴.

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

Write-up: under **Bootstrap fit**, five labelled lines — Grader, LLM deleted,
Accumulates, Week one, Buyer. One line each, under 20 words. Then the verdict.
"Unclear" on any line is 🔴, not 🟡.

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

Do NOT include founder pedigree. **Significantly prefer non-YC companies.** YC-backed companies have funding, network, and reputation tailwinds from day one that make them poor competitive targets for a bootstrapper. Include a YC company only if no comparable non-YC equivalent surfaces in this run, and when included, flag it explicitly (e.g., "(YC F25 — included for lack of non-YC equivalent)").

Return up to 10 companies per run, minimum 4. If fewer than 10 survive the filters, return fewer — do not substitute weaker candidates to hit a count, and do not mention the shortfall in the output.

Decide the bootstrap-fit verdict as you write each entry, not before. Write each entry once and move on — do not redraft an entry you have already written, and do not draft HTML in your thinking. Order the final list from 🟢 at the top to 🔴 at the bottom (🟡 in between).

**WRITING STYLE — this matters more than any other formatting rule.**

I read these fast. Prose paragraphs are unreadable to me. Write in short bullets.

- **Bullets, never paragraphs.** Every fact is its own `<li>`. Never chain three
  facts into one sentence with commas and dashes.
- **One idea per bullet. Max ~15 words.** If a bullet needs a comma-spliced clause
  to fit, it is two bullets.
- **Simple words.** "report card", not "third-party evaluation infrastructure".
  "picks a model", not "model selection methodology". No consultant vocabulary:
  cut *leverage, robust, comprehensive, holistic, end-to-end, seamlessly, at scale,
  landscape, solution, offering, straightforward, notably, concretely*.
- **No hedging filler.** Drop "it's worth noting", "essentially", "in practice".
- **Numbers go alone.** A metric gets its own bullet, not a subordinate clause.
- Never write a sentence longer than one line on screen.

When an entry has 2+ comparable numbers (model scores, pricing tiers, customer
counts), render them as a small `<pre>` monospace table instead of bullets. One
per entry at most. Skip it when there's nothing to line up.

Output: self-contained HTML fragment (no <html>/<head>/<body>). Inline styles only. Clean fonts, ~8px padding, light section backgrounds, 1px borders. Clickable <a> links. Bulleted `<ul>` with tight margins and ~18px left padding.

Structure: numbered company entries as <div> blocks, ordered 🟢 → 🟡 → 🔴 top to bottom. Each entry, in this order:

1. Header line: number, company name, verdict emoji, one-line tagline.
2. Facts line: `domain · city · founded · stage (~$X) · ~N people`. Links here.
3. `What they do` — 3–4 bullets.
4. `The problem they solve` — 2–3 bullets, including one concrete example.
5. Optional `<pre>` number table (see above).
6. `Money` — 2–3 bullets: revenue model, any revenue/headcount figures.
7. `Why now` — 1–2 bullets.
8. `Bootstrap fit` sub-section — the five labelled lines and the 🟢/🟡/🔴 verdict.
9. `Crowding` — 1–2 bullets.

Section headers are bold labels on their own line. No summary table.

Immediately before each entry's `<div>`, emit an HTML comment naming the company, exactly in this form and on its own line:

    <!-- COMPANY 1: Acme AI -->

Use the plain company name only — no tagline, no URL, no verdict. This is parsed by a script to build the previously-covered list, so the format must match exactly for every entry.

Company entries only. Do not add cross-company synthesis sections — no "Recurring problems", no "Gaps", no "Bootstrap viability" round-up, no closing commentary of any kind. End the output after the last company entry.

Output only the HTML fragment. No preamble, no code fences, no markdown.

# SHORTLIST

Unverified. Names and one-liners came from job postings; a triage pass ranked them on those descriptions alone. Verify before trusting, and drop freely.

{{CANDIDATES}}
