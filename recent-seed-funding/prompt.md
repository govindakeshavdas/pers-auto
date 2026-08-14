**Goal.** I am not an investor. Each entry is a lead on a niche, not an
investment. I want a space where I could start a competitor for the **US market**
and raise a seed round on it. Judge every company by that one question: *if I
started this next month, would I get funded?* Raising is the plan, not
bootstrapping — venture scale is fine and wanted.

Search the web for AI startups that raised seed or pre-seed in the last 2 months.
Cast wide. Most good deals never get press, so lean on general searches, not the
big outlets. Vary the phrasing each run.

Filter:
* Under $8M, pre-seed (preferred) or seed only
* B2B AI tools, AI automation, AI infrastructure
* Exclude: consumer apps, crypto, biotech, hardware, PE workflow tools

For each company: what problem they solve (most bullets, technical, one concrete
example), the **Fit** verdict from the rubric below, and crowding — who else
does this for the same buyer, by name. Crowding is context, not a gate; it never
changes the verdict. No founder pedigree; I don't care and it stops me reading.

---

**The rubric.** Apply in order. **First failure stops the evaluation — verdict is
🔴.** Do not average, do not balance. A 🔴 costs me nothing; a false 🟢 costs me
weeks. When a gate is arguable, it fails.

**1. Objective?** (cheapest kill — run it first) Would two competent people, given
the same input and no discussion, produce the same output? If the product emits a
score, a rating, a judgment call, a recommendation, or anything sold as
"insights" — no → 🔴. Adding a rubric doesn't fix it; the rubric *is* the
subjective part.

Auto-🔴: agent/broker workflow tools, investment "intelligence", interview or
research quality, call scoring, coaching, moderation, branding, copy, design
taste, candidate ranking.

Passing shape: the output is checkable against something outside anyone's opinion
— a spec, a measurement, a part number, a round-trip, a price, a diff, a number
that reconciles.

**2. Can I start it?** Say what I build in week one, alone, before talking to
anyone. It must run on data I can get myself. 🔴 if the first move is booking
meetings for access, or if it only works once it sits inside their systems (ERP,
CRM, PMS, ticket history, claim files). Selling vaporware to earn an invite is not
a start.

**3. Moat, or just a tool?** Delete the LLM. What's left? A thin layer over one
model call, or a single function a bigger platform absorbs next year → it's a tool
→ 🔴. Something must accumulate: a dataset I build, a harness, a benchmark, a
comparison engine, real technical depth. Name it.

Verdict: 🟢 passes all three — name what accumulates. 🟡 passes, but I can name
the one thing that erodes it. 🔴 fails any one — name the gate.

**Calibration — I already judged these. Match this severity.**

| Idea | Verdict | Gate |
|---|---|---|
| AI workflow platform for real estate agents | 🔴 | 1 — fully subjective |
| AI investment analytics for real estate | 🔴 | 1 — "insights" |
| AI voice agent running 45-min research interviews | 🔴 | 1 — interview quality is taste |
| Custom AI for real estate owner-operators | 🔴 | 2 — lives inside their legacy systems; day one is begging for meetings |
| RL sandbox environments for training AI agents | 🟢 | technical, pass/fail is measurable |
| AI operating system for the spare parts supply chain | 🟢 | parts reconcile or they don't; the equivalence table compounds |

Return as many companies as you have analyzed ... 

---

**WRITING STYLE — this matters more than any formatting rule.** I read these fast.
Prose paragraphs are unreadable to me.

* **Bullets, never paragraphs.** Every fact its own `<li>`. Never chain three
  facts with commas and dashes.
* **One idea per bullet, max ~15 words.** If it needs a comma-spliced clause, it
  is two bullets.
* **Simple words.** No consultant vocabulary: cut *leverage, robust,
  comprehensive, holistic, end-to-end, seamlessly, at scale, landscape, solution,
  offering, defensible, straightforward, notably*.
* **No hedging.** Drop "it's worth noting", "essentially", "in practice".
* Never write a sentence longer than one line on screen.

---

**Output.** A self-contained HTML fragment — no `<html>`, `<head>`, `<body>`. It
gets embedded in a Gmail email. Inline `style="..."` only. Clickable `<a>` links.
Match the example below for styling.

Each company is a numbered `<div>`: header line (number, name, verdict emoji,
tagline), facts line (`domain · city · $Xm stage (date)`), `What they do` 3–4
bullets, `The problem they solve` 2–3 bullets with one concrete example, `Fit`
with its three labelled lines and verdict, `Crowding` 1–2 bullets naming
competitors. Each Fit line under 20 words. "Unclear" on any line is 🔴, not 🟡.

Immediately before each entry's `<div>`, emit an HTML comment naming the company,
exactly in this form, on its own line:

    <!-- COMPANY 1: Acme AI -->

Plain company name only — no tagline, no URL, no verdict. A script parses this, so
the format must match for every entry.

Company entries only. No cross-company synthesis — no "Recurring problems", no
"Gaps", no closing commentary. End after the last entry. Output only the HTML
fragment: no preamble, no code fences, no markdown.

---

# PREVIOUSLY COVERED COMPANIES

Every company sent in any previous run is listed below — this list is complete,
not a recent sample. **Do not include any of them.** If one turns up in search
results, skip it entirely and keep searching. Return only companies absent from
this list.

Do not restate this instruction in the output, and do not claim to have excluded
a range of runs — you have names, not run numbers.

{{PREVIOUS_RESULTS}}
