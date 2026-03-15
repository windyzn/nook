create table events (
  id          text primary key,
  name        text not null,
  duration    text,
  dates       jsonb not null,
  slots       jsonb not null,
  password    text,
  created_at  timestamptz default now()
);

create table responses (
  id          uuid primary key default gen_random_uuid(),
  event_id    text references events(id) on delete cascade,
  name        text not null,
  availability jsonb not null,
  created_at  timestamptz default now()
);

alter table events    enable row level security;
alter table responses enable row level security;

create policy "anyone can read events"
  on events for select using (true);

create policy "anyone can create events"
  on events for insert with check (true);

create policy "anyone can read responses"
  on responses for select using (true);

create policy "anyone can add responses"
  on responses for insert with check (true);
