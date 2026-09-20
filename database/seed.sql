insert into materials (name, category, sku, stock_quantity, minimum_stock, unit_cost)
values
  ('Robinet 1/2"', 'Sanitar', 'SAN-ROB-001', 38, 15, 24.90),
  ('Siguranță automată 16A', 'Electric', 'ELE-SIG-016', 8, 10, 32.50),
  ('Bandă PTFE', 'Consumabil', 'CON-PTFE-001', 64, 20, 4.90)
on conflict (sku) do nothing;
