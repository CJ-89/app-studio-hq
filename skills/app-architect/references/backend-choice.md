# Backend choice

**User default: read `studio.config.md` (Stack → Backend).** If it isn't set, recommend self-hosting on any VPS with a self-hosting platform such as Coolify. Managed Supabase/Firebase are fallbacks, offered only when an app clearly needs what self-hosting can't safely give (e.g. very large scale, or the user doesn't want to run ops for that app).

## Decision tree
1. No accounts, no sync, no shared data? → **No backend (local-first).** Cheapest, fastest, simplest Data Safety form. Always prefer this when the brief allows.
2. Simple data (users, a few collections, files), small team of one → **PocketBase, self-hosted.** Single container, built-in auth, file storage, realtime, admin UI; official Dart SDK (`pocketbase`). Lowest ops burden.
3. Relational data, SQL, row-level security, server functions → **Supabase, self-hosted** (platforms such as Coolify have a Supabase template). Official Flutter SDK (`supabase_flutter`). Heavier: many containers, more RAM, more to update.
4. Automations around the app (emails, AI pipelines, scheduled jobs, webhooks) → **n8n** on the same server, called from the backend — never directly from the app with secrets.
5. Calls a paid AI API → always server-side (PocketBase hook / Supabase Edge Function / n8n webhook with auth). **Never ship a paid API key inside the app.**

Keep **Firebase only for Crashlytics + Analytics** (free; also links to AdMob reporting), even with a self-hosted backend.

## Production checklist for self-hosting (must be in TECH_SPEC §5)
| Item | Minimum |
|---|---|
| Separate instances | dev and prod are different services/containers with different domains (e.g. `api-dev.` / `api.`) |
| TLS | HTTPS on every endpoint (e.g. Let's Encrypt via your reverse proxy) |
| Backups | Automated daily DB backup to **off-server** storage (S3-compatible bucket or your VPS provider's storage box), keep ≥14 days |
| Restore test | Restore a backup to dev once before launch, then quarterly |
| Monitoring | Uptime check (e.g. Uptime Kuma) on the API health endpoint with alerts to phone; disk-space alert |
| Updates | Monthly update window for the backend image and the OS; read release notes first |
| Firewall | Only 80/443 (and SSH restricted) open; admin UIs behind auth, ideally not public |
| Rate limiting | On auth and any costly endpoint |
| Resources | Check RAM/CPU headroom before adding an app; one bad app shouldn't take down n8n and the others |
| Data location | Note the server region — goes into the privacy policy |

## Must-haves when there is a backend
- Access rules on every collection/table: PocketBase API rules; Supabase RLS on every table. Write them in the spec.
- Account deletion: in-app path + web URL that deletes the user's data (Play requirement for apps with accounts).
- The app talks to the API by HTTPS domain, never by IP; make the base URL a flavor setting.
