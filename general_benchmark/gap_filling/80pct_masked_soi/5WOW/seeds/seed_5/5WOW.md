# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_5\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 6.059 A
- tm_score_ca_ordered: 0.19713145391036355
- heavy_atom_rmsd: 7.654 A
- sidechain_heavy_atom_rmsd: 8.865 A
- **all-atom quality (honest):** heavy 7.654 A, sidechain 8.865 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 250
- bin_accuracy: 0.600

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.059308123463708
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 6.0593883001704185  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G1-I6 → 3 conflicts (75%)
- explained: 3/4 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.108), conflicts/hub=1.0, max_incompat=3.07Å, chain_span=0.514
- **fix-first:** [LOW_CONFLICT] Root cause(s): G1-I6 — explain ~3/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S14** — severity 1.67, 1 conflict(s); suspect input ~`P31` (group: pull_in)
  - pull-in (wants closer): C20@7.4Å(now 10.1,conf 0.79)
  - C20↔P31: targets 7.4/16.2Å but partners are 5.7Å apart → too_close_together by 3.1Å
- **C20** — severity 1.26, 1 conflict(s); suspect input ~`P4` (group: pull_in)
  - pull-in (wants closer): S14@7.4Å(now 10.1,conf 0.79)
  - push-out (wants farther): Y27@10.9Å(now 8.2,conf 0.91)
  - S14↔P4: targets 7.4/9.2Å but partners are 18.9Å apart → too_far_apart by 2.3Å
- **G1** — severity 1.24, 1 conflict(s); suspect input ~`V34` (group: push_out)
  - push-out (wants farther): V34@11.3Å(now 8.7,conf 0.55)
  - Y37↔V34: targets 6.9/11.3Å but partners are 2.1Å apart → too_close_together by 2.3Å
- **I6** — severity 0.99, 1 conflict(s); suspect input ~`C3` (group: push_out)
  - push-out (wants farther): A19@12.8Å(now 7.7,conf 0.55), G18@11.7Å(now 8.2,conf 0.55), D36@15.8Å(now 13.1,conf 0.55)
  - D36↔C3: targets 15.8/6.2Å but partners are 7.7Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=13 · 3-10(G)=5 · coil(C)=3

```
EECHEHGEEGHEHGEGHHHHEHHHHEHCECEEGHHHE
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=3 · sheet=25
  - D13 ↔ P17  (helix)
  - A19 ↔ R23  (helix)
  - R23 ↔ Y27  (helix)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ I21  (sheet)
  - V2 ↔ Q8  (sheet)
  - V2 ↔ I21  (sheet)
  - K5 ↔ I21  (sheet)
  - Q8 ↔ D15  (sheet)
  - Q8 ↔ I21  (sheet)
  - Q8 ↔ G26  (sheet)
  - R9 ↔ D15  (sheet)
  - R9 ↔ I21  (sheet)
  - R9 ↔ G26  (sheet)
  - R9 ↔ G29  (sheet)
  - R12 ↔ I21  (sheet)
  - R12 ↔ G26  (sheet)
  - R12 ↔ G29  (sheet)
  - D15 ↔ I21  (sheet)
  - D15 ↔ G26  (sheet)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=160 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=94 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.9412 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
