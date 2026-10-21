-- On-device SQLite schema
create table documents (
  id text primary key,
  kind text,                 -- letter | bill | denial | eob | form | other
  title text,
  captured_at text not null,
  file_path text not null,   -- local encrypted file
  language text,
  summary_plain text,
  key_facts text,            -- JSON: sender, amount_due, deadline, reference_numbers
  deadline text
);

create table tasks (
  id text primary key,
  document_id text references documents(id) on delete set null,
  title text not null,
  detail text,
  due_at text,
  status text not null default 'todo',  -- todo | doing | done | snoozed
  step_order int default 0,
  created_at text not null
);

create table call_preps (
  id text primary key,
  task_id text references tasks(id) on delete cascade,
  script text, bring_list text, questions text,
  notes_taken text,
  created_at text not null
);

create table helpers (
  id text primary key,
  name text, relationship text,
  can_view_tasks int default 0,
  can_view_documents int default 0
);

create table settings (
  key text primary key, value text
);

-- Advocate additions
create table playbook_runs (
  id text primary key,
  playbook_id text not null,           -- e.g. nyc-eviction
  document_id text references documents(id) on delete set null,
  situation_label text,                -- e.g. notice_of_petition
  urgency text,                        -- emergency | this_week | later
  started_at text not null,
  completed_at text
);

create table directory_cache (
  id text primary key,                 -- matches directory entry id
  payload text not null,               -- JSON of the entry
  verified_on text,                    -- null or >180 days old = hidden
  fetched_at text not null
);

create table drafts (
  id text primary key,
  task_id text references tasks(id) on delete cascade,
  template_id text,
  body text not null,
  status text default 'draft',         -- draft | edited | copied
  created_at text not null
);

create table deadlines (
  id text primary key,
  task_id text references tasks(id) on delete cascade,
  label text not null,                 -- e.g. "Response to petition due"
  due_at text not null,
  source_document_id text references documents(id)
);
