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
* Funding amount: under $8M
* Stage: pre-seed (preferred) or seed only
* Sector: B2B AI tools, AI automation, AI infrastructure
* Preferred sector: anything related to real estate (proptech, property
  management, real estate transactions, tenant/landlord tools, CRE analytics,
  etc.) — but cap proptech at ~25% of total results. Fill the rest with
  non-proptech B2B AI companies
* Exclude: consumer apps, crypto, biotech, hardware
* Exclude: private equity deal analysis / PE workflow tools — skip entirely
For each startup found, extract these 8 things:
1. What specific problem they solve (give this the most bullets — show an example, stick to the technical details)
2. Very briefly discuss their moat 
3. Category crowding — Are there other funded startups solving the same problem for the same buyer? Name them. Flag if the category already has a well-funded incumbent at Series A or beyond.
4. Importantly dont go into the pedigree of the founders etc - i dont care and it puts me off from reading further ... 

Output format:

Return a self-contained **HTML fragment** (no `<html>`, `<head>`, or `<body>`
wrappers — it will be embedded into a Gmail email).

**WRITING STYLE — this matters more than any other formatting rule.**

I read these fast, and there are 20–30 of them. Prose paragraphs are unreadable
to me. Write in short bullets.

- **Bullets, never paragraphs.** Every fact is its own `<li>`. Never chain three
  facts into one sentence with commas and dashes.
- **One idea per bullet. Max ~15 words.** If a bullet needs a comma-spliced
  clause to fit, it is two bullets.
- **Simple words.** No consultant vocabulary: cut *leverage, robust,
  comprehensive, holistic, end-to-end, seamlessly, at scale, landscape,
  solution, offering, defensible, straightforward, notably, architecturally*.
- **No ALL-CAPS shouting.** Not for emphasis, not for headers, not ever. One
  🚨 at most per entry, and only for a genuine standout.
- **No hedging filler.** Drop "it's worth noting", "essentially", "in practice".
- **Numbers go alone.** A metric gets its own bullet, not a subordinate clause.
- Never write a sentence longer than one line on screen.

When an entry has 2+ comparable numbers (pricing tiers, customer counts,
benchmark scores), render them as a small `<pre>` monospace table instead of
bullets. One per entry at most. Skip it when there's nothing to line up.

Requirements:
- Inline `style="..."` only. No `<style>` blocks. No external CSS.
- Style for Gmail readability: clean fonts, ~8px padding, light section
  backgrounds, 1px borders where helpful.
- Make links clickable with `<a href="...">`.
- Bulleted `<ul>` with tight margins and ~18px left padding.

Structure the HTML as follows:

**Company entries** — Write every company as a numbered entry using `<div>`
blocks. Aim for 20–30+ companies — do not stop early. Each entry, in this order:

1. Header line: number, company name, one-line tagline. Sentence case.
2. Facts line: `domain · city · $Xm stage (date)`. Links here.
3. `What they do` — 3–4 bullets.
4. `The problem they solve` — 2–3 bullets, including one concrete example.
5. Optional `<pre>` number table (see above).
6. `Traction` — 1–3 bullets. Skip the section if there's nothing real.
7. `Money` — 1–2 bullets: revenue model, investors.
8. `Moat` sub-section — `For:` 2–3 bullets, `Against:` 2–3 bullets, then a
   one-line `Verdict:` with 🟢/🟡/🔴.
9. `Crowding` — 1–2 bullets. Name the competitors.

Section headers are bold labels on their own line. Skip a summary table.

Immediately before each entry's `<div>`, emit an HTML comment naming the
company, exactly in this form and on its own line:

    <!-- COMPANY 1: Acme AI -->

Use the plain company name only — no tagline, no URL, no verdict. This is
parsed by a script to build the previously-covered list, so the format must
match exactly for every entry.

Company entries only. Do not add cross-company synthesis sections — no
"Recurring problems", no "Gaps", no "Opportunity assessment", no closing
commentary of any kind. End the output after the last company entry.

Output **only** the HTML fragment. No preamble, no explanation, no code
fences, no markdown.

**Worked example — match this density and sentence length exactly.**

```html
<!-- COMPANY 1: Cascade -->
<div style="font-family: 'Segoe UI', Arial, sans-serif; background: #f8f9fa; border: 1px solid #dee2e6; border-radius: 6px; padding: 10px; margin-bottom: 16px;">
<strong style="font-size: 15px;">1. Cascade</strong> — <span style="color: #555;">Finds construction projects before the RFP exists</span><br>
<span style="font-size: 13px; color: #666;"><a href="https://usecascade.ai" style="color: #2563eb;">usecascade.ai</a> · New York / London · $3.5M seed (Jul 2026)</span>

<div style="font-size: 13px; color: #333; margin-top: 6px;">
<strong>What they do</strong>
<ul style="margin: 2px 0 8px; padding-left: 18px;">
<li>Sell to firms that design and build airports, hospitals, data centers.</li>
<li>Scrape bond filings, permits, property sales, county capital plans.</li>
<li>Score each project for fit. Show who to call.</li>
</ul>

<strong>The problem they solve</strong>
<ul style="margin: 2px 0 8px; padding-left: 18px;">
<li>Big projects leave a paper trail months before the RFP.</li>
<li>Nobody aggregates those records. They sit in thousands of county databases.</li>
<li>Example: a state announces a $100M housing grant. Cascade names the five developers likely to win it.</li>
</ul>

<strong>Traction</strong>
<ul style="margin: 2px 0 8px; padding-left: 18px;">
<li>Clients built JFK, LaGuardia, Four Seasons hotels.</li>
<li>$10B+ in project opportunities surfaced.</li>
</ul>

<strong>Money</strong>
<ul style="margin: 2px 0 8px; padding-left: 18px;">
<li>B2B SaaS, per-seat.</li>
<li>Led by a16z Speedrun. Ada Ventures, Snowball, Indico also in.</li>
</ul>
</div>

<div style="background: #fff; border: 1px solid #e0e0e0; border-radius: 4px; padding: 8px; font-size: 13px;">
<strong>Moat</strong>
<div style="margin-top: 4px;"><strong>For:</strong></div>
<ul style="margin: 2px 0 6px; padding-left: 18px;">
<li>Public records, but fragmented across thousands of databases.</li>
<li>Whoever structures them first owns the dataset.</li>
<li>Win/loss outcomes accumulate per firm. Later entrants can't buy that.</li>
</ul>
<div><strong>Against:</strong></div>
<ul style="margin: 2px 0 6px; padding-left: 18px;">
<li>Dodge and ConstructConnect already sell project lead databases.</li>
<li>"Predict before RFP" is hard to verify. False positives kill trust.</li>
<li>Dual HQ in NYC and London may split focus.</li>
</ul>
<strong>Verdict: 🟢</strong> Real moat. The structured records compound.
</div>

<div style="font-size: 13px; color: #666; margin-top: 6px;">
<strong>Crowding</strong>
<ul style="margin: 2px 0 0; padding-left: 18px;">
<li>Dodge Construction Network (acquired, $500M+), ConstructConnect, BidScript, ContraVault.</li>
<li>Moderate for project intelligence. Low for pre-RFP prediction.</li>
</ul>
</div>
</div>
```

---

# PREVIOUSLY COVERED COMPANIES

Every company sent in any previous run is listed below — this list is
complete, not a recent sample. **Do not include any of them.** If one turns up
in search results, skip it entirely and keep searching. Return only companies
absent from this list.

Do not restate this instruction in the output, and do not claim to have
excluded a range of runs — you have names, not run numbers.

{{PREVIOUS_RESULTS}}
