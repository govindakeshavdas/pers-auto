# pers-auto

Personal automation scripts, mostly run on a schedule via GitHub Actions.

## Scripts

- [meetups/](meetups/) — weekly meetup finder, emailed via cron.

## Required secrets

Set in repo **Settings → Secrets and variables → Actions**:

- `OPENAI_API_KEY` — for the Responses API (with `web_search_preview` tool)
- `RESEND_API_KEY` — https://resend.com API key
- `MAIL_FROM` — sender, e.g. `pers-auto <auto@yourdomain.com>` (domain must be
  verified in Resend, or use `onboarding@resend.dev` for testing)
- `MAIL_TO` — recipient email
