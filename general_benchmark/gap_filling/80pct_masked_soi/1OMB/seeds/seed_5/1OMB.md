# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_5\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 5.901 A
- tm_score_ca_ordered: 0.20110297697168575
- heavy_atom_rmsd: 6.815 A
- sidechain_heavy_atom_rmsd: 7.642 A
- **all-atom quality (honest):** heavy 6.815 A, sidechain 7.642 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 205
- bin_accuracy: 0.649

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.9013649717858625
- ga_delta_rmsd: 2.3592085929292574  ga_fitness_mode: energy
- pre_local_rmsd: 5.901376251852363  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.03), conflicts/hub=2.0, max_incompat=1.87Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **M25** — severity 2.33, 2 conflict(s); suspect input ~`A2` (group: push_out)
  - push-out (wants farther): A2@22.5Å(now 19.7,conf 0.67)
  - C21↔A2: targets 11.1/22.5Å but partners are 9.5Å apart → too_close_together by 1.9Å
  - E31↔A2: targets 11.0/22.5Å but partners are 9.9Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=15 · 3-10(G)=1 · coil(C)=7

```
CHHHEEEGEHECEECCHEEHHEECEHHEECCHE
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=1 · sheet=34
  - R17 ↔ C21  (helix)
  - Y5 ↔ K14  (sheet)
  - Y5 ↔ G18  (sheet)
  - Y5 ↔ R19  (sheet)
  - Y5 ↔ R22  (sheet)
  - G6 ↔ T13  (sheet)
  - G6 ↔ K14  (sheet)
  - G6 ↔ G18  (sheet)
  - G6 ↔ R19  (sheet)
  - G6 ↔ R22  (sheet)
  - G6 ↔ C23  (sheet)
  - K7 ↔ T13  (sheet)
  - K7 ↔ K14  (sheet)
  - K7 ↔ G18  (sheet)
  - K7 ↔ R19  (sheet)
  - K7 ↔ R22  (sheet)
  - K7 ↔ C23  (sheet)
  - T9 ↔ K14  (sheet)
  - T9 ↔ T28  (sheet)
  - T9 ↔ N29  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=110 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=56 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.396 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
