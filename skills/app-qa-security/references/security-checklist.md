# Security checklist

## Secrets
- [ ] No paid/admin API keys in the app or repo (search the repo for "sk-", "key", "secret", "token")
- [ ] Paid API calls (AI etc.) go through a server function with auth + rate limits
- [ ] Public keys (Supabase anon key, Firebase config) are fine in the app ONLY if backend rules protect data
- [ ] Keystore, key.properties, google-services.json, .env are gitignored; check git history too

## Self-hosted server (e.g. Coolify on a VPS)
- [ ] Off-server daily backups working; a restore was tested
- [ ] Only 80/443 public; SSH key-only; Coolify dashboard and backend admin UIs not openly reachable (or strong auth + 2FA)
- [ ] Backend image and OS patched within the last month
- [ ] Uptime + disk alerts reach your phone
- [ ] Dev and prod are separate instances with separate credentials

## Backend
- [ ] PocketBase: API rules set on every collection (no empty "anyone" rules for private data)
- [ ] Supabase: RLS enabled on every table; policies restrict rows to `auth.uid()`; service-role key never in the app
- [ ] Firebase: security rules deny by default; tested with the emulator/rules playground
- [ ] Storage buckets private unless content is meant to be public
- [ ] Server validates inputs; never trust client-sent prices/entitlements (verify purchases server-side or via RevenueCat)

## On device
- [ ] Tokens stored with flutter_secure_storage, not shared_preferences
- [ ] No personal data in logs or analytics event parameters
- [ ] HTTPS only (no cleartext traffic)
- [ ] Release build obfuscated
- [ ] Deep links / intents validated

## Dependencies
- [ ] `flutter pub outdated` reviewed; no abandoned packages for security-sensitive features
- [ ] Each package from a reputable publisher (check pub.dev verified publisher + popularity)
