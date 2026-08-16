Today is {{TODAY}}.

A discovery pass collected the candidate companies listed at the bottom. A later pass will research the survivors in depth — that research is expensive and its budget is small, so your job is to choose which companies are worth spending it on.

**You have no search tool and you do not need one.** Judge from the one-line descriptions alone. You are not producing verdicts, write-ups, or analysis — only a shortlist.

**Return the 12–15 most promising candidates.** Fewer than 12 only if the list is genuinely that thin. Never more than 15 — every extra name steals research budget from a better one.

**Goal:** I am looking for niches where a solo founder or 2-person team could realistically bootstrap a competitor — ship product, land paying customers on product merit, and reach meaningful revenue without raising. This is NOT a hunt for venture-scale opportunities.

**How to choose.** Apply gates 1–3 below to each description. Then:

- **Drop** the ones whose description is specific enough to be conclusive *and* clearly fails a gate. Taste/judgement products, domain-knowledge wrappers, and thin single-function layers are usually visible from one line. The calibration table shows the severity — several rows there are recognisable from a one-liner alone.
- **Keep** the ones that look like a technical system: a measurement harness, a dataset, a pipeline, a benchmark, a comparison engine. These are the point of the exercise.
- **A vague description is missing information, not a failure.** The one-liners come from job postings and are often uninformative. Rank a vague candidate in the middle — above anything that clearly fails, below anything that clearly looks like a technical system. Do NOT apply "Unclear → 🔴" here; that rule belongs to the finished write-up, after research. Dropping a company for a thin one-liner is the worst mistake you can make at this stage, because nothing downstream can recover it.

**1. Highly subjective / Taste / Judgement  : If the result is some report that is subjective , design content . Another example is some expert using their insight into a prompt like a lawyer adding their insight into cases into a product . This is too subjective and im not that expert with taste . There are a lot of products builnt on expert taste or judgement . -> Auto-🔴 

2. **Who owns the value.** Delete the LLM from the product. What is left?
   - *Domain knowledge* (immigration rules, manufacturing process, claims practice,
     tax code, building code) → 🔴. The winner here is whoever has the domain
     experts, and they can hire one engineer to catch up.
   - *A technical system* (a measurement harness, a dataset I built, a pipeline, a
     benchmark, a comparison engine) → passes.

   Explicit test: **would an existing domain firm beat me by hiring one developer?**
   Yes → 🔴.

3. **Durability.** In 18 months, what stops the next indie dev — or the model
   provider — from shipping this in a weekend? The answer must *accumulate*: a
   dataset I built, an eval harness, a benchmark, hard-won technical depth.
   "Better taste", "better prompts", "we're first", "we know the vertical" do not
   accumulate. Nothing accumulates → 🔴. A single-function utility a platform
   would absorb as a feature, or a thin layer over one model call → 🔴.

**Calibration — I have already rejected these. Match this severity.**

| Idea | Verdict | Gate |
|---|---|---|
| Insurance-defense litigation intelligence | 🔴 | 4 — needs a case corpus I'll never have |
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
disagree, and export a lexicon the customer owns. Objective, the value is a
comparison harness not domain knowledge, and the verified lexicon accumulates.
**That is the bar.** Rank candidates by how close they look to that shape.

Prefer non-YC companies where the choice is otherwise close.

**Output format.** One line per kept company and nothing else:

    KEEP: <company name>

Copy the company name exactly as it appears in the candidate list — this is matched by a script, and a renamed or reworded company is silently dropped. No preamble, no ranking numbers, no reasons, no markdown, no closing summary.

# CANDIDATES

{{CANDIDATES}}
