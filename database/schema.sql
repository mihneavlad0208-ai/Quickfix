create extension if not exists pgcrypto;

create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text unique not null,
  password_hash text not null,
  role text not null default 'dispatcher' check (role in ('admin','dispatcher','technician')),
  active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists clients (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone text,
  email text,
  address text,
  notes text,
  created_at timestamptz not null default now()
);

create table if not exists technicians (
  id uuid primary key default gen_random_uuid(),
  user_id uuid unique references users(id) on delete set null,
  name text not null,
  phone text,
  specialty text,
  status text not null default 'available' check (status in ('available','busy','off')),
  created_at timestamptz not null default now()
);

create table if not exists interventions (
  id uuid primary key default gen_random_uuid(),
  ticket_no bigint generated always as identity unique,
  client_id uuid not null references clients(id),
  technician_id uuid references technicians(id) on delete set null,
  service text not null,
  description text,
  address text,
  priority text not null default 'normal' check (priority in ('low','normal','urgent')),
  status text not null default 'scheduled' check (status in ('new','scheduled','in_progress','completed','cancelled','waiting')),
  scheduled_at timestamptz,
  started_at timestamptz,
  completed_at timestamptz,
  estimated_cost numeric(12,2),
  final_cost numeric(12,2),
  created_by uuid references users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists materials (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text,
  sku text unique,
  unit text not null default 'buc',
  stock_quantity numeric(12,2) not null default 0,
  minimum_stock numeric(12,2) not null default 0,
  unit_cost numeric(12,2),
  created_at timestamptz not null default now()
);

create table if not exists intervention_materials (
  intervention_id uuid not null references interventions(id) on delete cascade,
  material_id uuid not null references materials(id),
  quantity numeric(12,2) not null check (quantity > 0),
  unit_cost numeric(12,2),
  primary key (intervention_id, material_id)
);

create table if not exists audit_log (
  id bigserial primary key,
  user_id uuid references users(id) on delete set null,
  action text not null,
  entity_type text not null,
  entity_id text,
  payload jsonb,
  created_at timestamptz not null default now()
);

create index if not exists idx_interventions_status on interventions(status);
create index if not exists idx_interventions_scheduled_at on interventions(scheduled_at);
create index if not exists idx_interventions_client_id on interventions(client_id);
create index if not exists idx_interventions_technician_id on interventions(technician_id);
create index if not exists idx_audit_log_created_at on audit_log(created_at desc);

create or replace function set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists interventions_updated_at on interventions;
create trigger interventions_updated_at
before update on interventions
for each row execute function set_updated_at();
