# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_3\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 0.906 A
- tm_score_ca_ordered: 0.9623999816510735
- heavy_atom_rmsd: 2.385 A
- sidechain_heavy_atom_rmsd: 2.994 A
- **all-atom quality (honest):** heavy 2.385 A, sidechain 2.994 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 797
- bin_accuracy: 0.891

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9057587546206258
- ga_delta_rmsd: 4.32911504435461  ga_fitness_mode: energy
- pre_local_rmsd: 0.9085732353034777  localized_anchor_rmsd: 0.905783151939729

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G74 → 10 conflicts (100%)
- explained: 10/10 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.027), conflicts/hub=5.0, max_incompat=3.45Å, chain_span=0.108
- **fix-first:** [LOW_CONFLICT] Root cause(s): G74 — explain ~10/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 12.23, 6 conflict(s); suspect input ~`L66` (group: push_out)
  - pull-in (wants closer): Q1@27.5Å(now 30.4,conf 1.00), K62@27.5Å(now 31.0,conf 1.00), P18@27.5Å(now 30.2,conf 1.00)
  - push-out (wants farther): L66@24.3Å(now 20.7,conf 0.72), R41@15.8Å(now 11.8,conf 0.55)
  - H67↔L66: targets 17.1/24.3Å but partners are 3.9Å apart → too_close_together by 3.3Å
  - V69↔L66: targets 11.0/24.3Å but partners are 10.2Å apart → too_close_together by 3.1Å
  - R71↔L66: targets 5.4/24.3Å but partners are 15.8Å apart → too_close_together by 3.0Å
- **L66** — severity 6.01, 4 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@24.3Å(now 20.7,conf 0.72)
  - V69↔G74: targets 10.6/24.3Å but partners are 11.0Å apart → too_close_together by 2.8Å
  - L70↔G74: targets 13.0/24.3Å but partners are 9.2Å apart → too_close_together by 2.1Å
  - G74↔R41: targets 24.3/9.9Å but partners are 11.8Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=25 · 3-10(G)=24 · coil(C)=3

```
EEEGGEGHGEEGCGGEGHHEEHHHHHHHGHHEGGEGHHGEEGCEHHEGGEGGEEHHHEGCEEHEEGGEGGGHHE
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=7 · sheet=28
  - P18 ↔ I22  (helix)
  - S19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - Q1 ↔ T11  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ D20  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ D20  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ T11  (sheet)
  - F3 ↔ V16  (sheet)
  - T6 ↔ T11  (sheet)
  - V16 ↔ T21  (sheet)
  - I35 ↔ Q40  (sheet)
  - I35 ↔ R41  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=241 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=110 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6583 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)
