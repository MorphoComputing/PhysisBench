# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_4\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 4.925 A
- tm_score_ca_ordered: 0.2009439366411956
- heavy_atom_rmsd: 6.479 A
- sidechain_heavy_atom_rmsd: 7.522 A
- **all-atom quality (honest):** heavy 6.479 A, sidechain 7.522 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 218
- bin_accuracy: 0.619

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.924738167049614
- ga_delta_rmsd: -0.1806842481321933  ga_fitness_mode: energy
- pre_local_rmsd: 4.924734466850043  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E4 → 4 conflicts (80%)
- explained: 4/5 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.088), conflicts/hub=1.7, max_incompat=3.88Å, chain_span=0.912
- **fix-first:** [LOW_CONFLICT] Root cause(s): E4 — explain ~4/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K32** — severity 3.12, 2 conflict(s); suspect input ~`E4` (group: pull_in)
  - pull-in (wants closer): E4@14.0Å(now 17.9,conf 0.55)
  - N27↔E4: targets 7.1/14.0Å but partners are 25.0Å apart → too_far_apart by 3.9Å
  - Q26↔E4: targets 9.6/14.0Å but partners are 25.4Å apart → too_far_apart by 1.9Å
- **F10** — severity 2.46, 2 conflict(s); suspect input ~`N27` (group: push_out)
  - pull-in (wants closer): N27@11.1Å(now 14.0,conf 0.55)
  - push-out (wants farther): L1@9.9Å(now 6.8,conf 0.55)
  - E4↔N27: targets 11.4/11.1Å but partners are 25.0Å apart → too_far_apart by 2.4Å
  - D5↔N27: targets 9.4/11.1Å but partners are 22.6Å apart → too_far_apart by 2.1Å
- **L1** — severity 1.56, 1 conflict(s); suspect input ~`K30` (group: pull_in)
  - pull-in (wants closer): K30@13.1Å(now 17.5,conf 0.55)
  - push-out (wants farther): F10@9.9Å(now 6.8,conf 0.55), D5@7.9Å(now 3.8,conf 0.49)
  - E4↔K30: targets 8.4/13.1Å but partners are 24.3Å apart → too_far_apart by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=12 · 3-10(G)=4 · coil(C)=4

```
EEHHEHHGHEHHGGHEHEHEHEHEHCCGCHEEEC
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=5 · sheet=11
  - D3 ↔ K7  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - L1 ↔ F10  (sheet)
  - L1 ↔ A16  (sheet)
  - S2 ↔ F10  (sheet)
  - D5 ↔ F10  (sheet)
  - F10 ↔ A16  (sheet)
  - F10 ↔ A18  (sheet)
  - A16 ↔ G33  (sheet)
  - A18 ↔ K24  (sheet)
  - A18 ↔ G33  (sheet)
  - K24 ↔ E31  (sheet)
  - K24 ↔ K32  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=24 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4611 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
