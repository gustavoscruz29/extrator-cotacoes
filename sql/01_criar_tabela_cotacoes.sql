create table public.cotacoes (
  id bigint generated always as identity primary key,
  fornecedor text,
  item text,
  quantidade numeric,
  preco_unitario numeric(12,2),
  prazo_entrega_dias integer,
  condicao_pagamento text,
  criado_em timestamptz not null default now()
);

alter table public.cotacoes enable row level security;

create policy "Usuarios autenticados podem ler cotacoes"
on public.cotacoes
for select
to authenticated
using (true);
