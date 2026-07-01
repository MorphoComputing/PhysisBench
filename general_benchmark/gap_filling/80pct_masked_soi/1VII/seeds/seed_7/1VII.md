# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_7\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 4.242 A
- tm_score_ca_ordered: 0.27260376445710105
- heavy_atom_rmsd: 5.557 A
- sidechain_heavy_atom_rmsd: 6.605 A
- **all-atom quality (honest):** heavy 5.557 A, sidechain 6.605 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 221
- bin_accuracy: 0.606

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=3.616718728598751 -> 2.901952549468381 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.242167622112122
- ga_delta_rmsd: -1.33614241080492  ga_fitness_mode: energy
- pre_local_rmsd: 4.242089281187601  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/3 conflicts by 0 root cause(s)
- metrics: hubs=3 (frac 0.088), conflicts/hub=1.0, max_incompat=2.11Å, chain_span=0.588
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T13** — severity 1.15, 1 conflict(s); suspect input ~`L34` (group: push_out)
  - push-out (wants farther): L34@14.2Å(now 11.4,conf 0.55)
  - V9↔L34: targets 8.9/14.2Å but partners are 3.2Å apart → too_close_together by 2.1Å
- **K29** — severity 0.98, 1 conflict(s); suspect input ~`L1` (group: pull_in)
  - pull-in (wants closer): L1@11.0Å(now 13.7,conf 0.55)
  - K24↔L1: targets 7.4/11.0Å but partners are 20.3Å apart → too_far_apart by 1.8Å
- **G33** — severity 0.98, 1 conflict(s); suspect input ~`K30` (group: push_out)
  - pull-in (wants closer): L1@6.7Å(now 10.0,conf 0.55)
  - push-out (wants farther): G11@10.0Å(now 6.2,conf 0.55)
  - L1↔K30: targets 6.7/7.2Å but partners are 15.8Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=6 · 3-10(G)=4 · coil(C)=2

```
CHHHEHGGHHGHHHHHHHHEHHHHHCHEGHEEHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=7 · sheet=2
  - S2 ↔ F6  (helix)
  - F6 ↔ F10  (helix)
  - F10 ↔ R14  (helix)
  - T13 ↔ F17  (helix)
  - S15 ↔ N19  (helix)
  - F17 ↔ P21  (helix)
  - P21 ↔ Q25  (helix)
  - L20 ↔ L28  (sheet)
  - L28 ↔ L34  (sheet)

## Solvent Accessibility (burial)

- buried=11 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=118 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=33 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8649 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
