Today is {{TODAY}}.

Search Google and job search sites for job postings from AI startups at pre-seed or seed stage that are actively hiring for early roles. These companies are too early for the funding news cycle but serious enough to pay someone.

**This is a discovery pass only.** Collect names. Do not evaluate them, do not verify them, do not write analysis. A second pass does all of that.

**Goal:** I am looking for niches where a solo founder or 2-person team could realistically bootstrap a competitor — ship product, land paying customers on product merit, and reach meaningful revenue without raising. Maybe raise later, but the starting move is bootstrapped. So this is NOT a hunt for venture-scale opportunities.

**How to search.** Combine early-hire phrasing with AI product terms, and vary both each run. Don't lock onto one role title — "founding engineer" is only one way a tiny company writes this. Equally good: "first engineer", "engineer #1/#2/#3", "first technical hire", "first engineering hire", "founding ML engineer", "founding AI engineer", "first product hire", "stealth startup", and any similar phrasing you come up with. Pair those with terms like AI agent, AI automation, AI workflow, AI coworker, applied AI, and whatever verticals you're rotating through this run.

Run these across Google and job search sites (Jobright, Teal, Wellfound, Y Combinator's job board, company careers pages, etc.). Rotate the exact phrasings between runs so results don't repeat.

Companies posting these are usually 1–3 people total — exactly the niche-traction signal we want. The "stealth" searches in particular surface slightly underfunded, under-the-radar ideas — exactly the kind of opportunity worth investigating. Note that "founding engineer" has become a buzzword that already-polished YC-backed companies use, so weight the scrappier phrasings higher.

**Three hard requirements. A candidate that fails any one is worthless downstream — drop it.**

1. **A real, named company.** You must be able to name the actual company. Anonymous listings are not candidates: never emit "Stealth AI Startup", "Stealth Startup (London)", "Unnamed healthcare AI", or a name you invented to label a posting. A script matches these names against every company sent in previous runs, so an invented label defeats that check and the same listing resurfaces every run. Stealth *searches* are still worth running — they surface under-the-radar companies — but only keep a result when the search reveals who the company actually is. If a posting is genuinely anonymous, skip it and spend the slot on one you can name.
2. **A live job posting for an early role.** The whole thesis is companies hiring their first engineers right now. You must have seen an actual posting — a real opening, for an early/founding role, that exists today. Curated startup directories, "awesome-AI-startups" GitHub lists, VC portfolio pages, funding-announcement roundups, and company indexes are **not** hiring signals: they list companies regardless of whether anyone is hiring, and a candidate sourced from one is off-thesis even if the company looks good. Use them at most to recognise a name you found in a real posting. If you cannot point to a posting, skip the company.
3. **A URL that points at that posting or the company.** A company site, careers page, or a single job posting. Never an aggregator search-results page (`indeed.com/q-...`, `ziprecruiter.com/Jobs/...`, a LinkedIn jobs *search*) and never a directory or list page. The next pass has to verify from this link.

**Filter loosely otherwise, on what the search result already shows you.** Skip obvious misses — consumer apps, crypto, biotech, hardware, PE workflow tools, recruiters and VC firms rather than startups, and anything described as well-funded, expansion-stage, growth-stage, or Series A or later. Prefer non-YC companies. Do NOT run follow-up searches to confirm funding stage, founding date, or posting date; the second pass does that. Past those exclusions, when a named company is plausible, include it — the next pass filters hard.

Return up to 50 candidates. Over-collect: a later pass shortlists them and only then researches the survivors, so a weak candidate costs almost nothing while a missed one is gone for the run. But volume never justifies breaking the three requirements — 20 companies with real postings beat 50 scraped off a directory, and padding the list with names you did not see hiring makes the run worse, not better. Companies from previous runs are removed by script before the next pass sees them.

**Output format.** One line per company and nothing else:

    CANDIDATE: <company name> | <url> | <one line on what they do>

Use the plain company name only — this is parsed by a script.

**The one-liner must say what the product does.** It is the only thing the second pass sees before deciding whether a company is worth researching, and a vague line gets the company dropped unread. "AI platform for legal intake and medical-records review" is usable. "Seed-stage startup hiring a founding engineer in San Francisco" is not — that describes the job posting, not the product. If a listing tells you nothing about the product, say what little it does reveal about the domain rather than describing the role.

No preamble, no numbering, no markdown, no commentary, no closing summary.
