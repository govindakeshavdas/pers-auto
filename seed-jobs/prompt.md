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

The real question is not "is this a good business?" It is: ***can I, alone, at a laptop, this weekend, build a working v1 and know by myself whether it is any good?*** If the answer is no, nothing else about the company matters — it is not a target for me, however attractive the market is.

Run four tests. **Failing any one of them is an automatic 🔴** — do not average the tests out.

- **Cold-start build test (the primary gate — apply this first).** Could I get to a demoable v1 on my own, with no customer, no design partner, no domain expert, and no signed agreement? Two parts, and it must pass both:
  - *Build.* Can I code the thing end to end myself, with public data, synthetic data I generate, or data I can sign up for with a credit card? If the first step of building it is "get an enterprise to grant access," I cannot start. Not "it would be hard" — I literally cannot begin.
  - *Evaluate.* Once it produces an output, can **I** tell whether that output is right? If judging correctness requires a radiologist, a claims adjuster, a compliance officer, a structural engineer, or the customer's own internal policy context, then I have no feedback loop. I would be shipping blind and iterating on guesses. This is disqualifying on its own, even when the build part is easy.

  Say explicitly in the write-up what my weekend v1 would be and how I would know it worked. If you cannot describe both concretely, the verdict is 🔴.
- **Thin-wrapper test.** Is the product an obvious LLM-as-judge / thin-wrapper play (insurance adjudication, claims review, contract review, "AI grades X")? If yes → bad target. Reason: zero technical depth, the next bootstrapper or the foundation model providers themselves can replicate it trivially. Race to zero.
- **Insider-access test.** Does selling into this market require relationships an outsider can't build (government procurement, defense, niche regulated buyers where you need to know specific people)? If yes → bad target. Reason: the moat is years of relationship-building that a bootstrapper can't shortcut, regardless of product quality.
- **Data-access test (most important — apply this hardest).** Strip the LLM away. What is left? If what remains is *somebody else's data* that I cannot obtain on day one, it is a bad target. The pattern to reject is **"their data + an LLM layer on top"**. Ask specifically:
  - Does the product only work once it is *inside* a customer's systems — their policy corpus, ticket history, codebase, ERP, HRIS, EHR, cloud accounts, internal wiki, security logs? An outsider cannot build or demo this before a customer hands over access, and no enterprise hands that over to a one-person company.
  - Does it depend on licensed, scraped-at-scale, or otherwise proprietary third-party data (market data feeds, MLS, claims databases, permit records, regulatory corpora behind paywalls)?
  - Does the value only appear at scale — the product is useless until it has seen many customers' data (benchmarks, anomaly baselines, "how does my org compare")? Cold start kills a bootstrapper here.
  - Is it a **control plane / governance / observability layer** sitting over an enterprise's stack (AI safety and policy enforcement, compliance monitoring, real-time risk detection, security posture)? Reject these outright. They require deep integration, a security review, SOC 2, procurement, and an enterprise's trust before line one of value is delivered. There is no way to get a foot in the door as a solo builder — the product cannot even be *tried* without a signed enterprise.

  The inverse — what passes — is a product I could build and demo with **public data, data I can generate myself, or data the customer pastes/uploads in the first five minutes**. If a single user can get value on their own, alone, without an integration project, it passes.

Verdict scale:
- 🟢 = good bootstrap target. Passes all four. I could build a v1 alone and judge it myself, it has real product depth (not just an LLM wrapper), it is sellable on product merit to outsiders, and the data it needs is data I could get on day one.
- 🟡 = mixed. Passes all four but has one real concern (e.g., the space is crowded, or there's a mild insider angle, or the useful data takes some effort to assemble but is obtainable, or self-evaluation is possible but slow). Worth investigating but with caveats.
- 🔴 = bad target. Fails the cold-start build, thin-wrapper, insider-access, **or** data-access test. Skip as a competitive opportunity.

Write a short for/against under the Bootstrap fit sub-section, then the verdict. The for/against must cover, concretely:
- What my weekend v1 would be, and how I would know it worked without asking an expert.
- What the product looks like with the LLM removed.
- What data it depends on, and whether I could get that data on day one.

If any of those three cannot be answered concretely, say so plainly and mark it 🔴 — "unclear" is a fail, not a 🟡.

**Don't waste the run on red.** If more than ~3 of the 10 companies come out 🔴, go back and search more before writing output — rotate to different verticals and prefer companies selling to a single practitioner or a small team rather than to an enterprise. The point of the run is to surface targets I could actually attack, not to build a list of things I can't.

Do NOT include founder pedigree. **Significantly prefer non-YC companies.** YC-backed companies have funding, network, and reputation tailwinds from day one that make them poor competitive targets for a bootstrapper. Include a YC company only if no comparable non-YC equivalent surfaces in this run, and when included, flag it explicitly (e.g., "(YC F25 — included for lack of non-YC equivalent)"). Skip companies already in PREVIOUSLY COVERED.

Return exactly 10 companies per run. Before writing output, think through the bootstrap-fit verdict for each, then order the final list from 🟢 at the top to 🔴 at the bottom (🟡 in between).

Output: self-contained HTML fragment (no <html>/<head>/<body>). Inline styles only. Clean fonts, ~8px padding, light section backgrounds, 1px borders. Clickable <a> links.

Structure: numbered company entries as <div> blocks, ordered 🟢 → 🟡 → 🔴 top to bottom. 6–8 sentences covering points 1–4, then a clearly labelled **Bootstrap fit** sub-section with for/against and 🟢/🟡/🔴 verdict, then the crowding note. No summary table.

Company entries only. Do not add cross-company synthesis sections — no "Recurring problems", no "Gaps", no "Bootstrap viability" round-up, no closing commentary of any kind. End the output after the last company entry.

Output only the HTML fragment. No preamble, no code fences, no markdown.

---

# PREVIOUSLY COVERED COMPANIES

Every company sent in any previous run is listed below — this list is complete, not a recent sample. **Do not include any of them.** If one turns up in search results, skip it entirely and keep searching. Return only companies absent from this list.

Do not restate this instruction in the output, and do not claim to have excluded a range of runs — you have names, not run numbers.

{{PREVIOUS_RESULTS}}