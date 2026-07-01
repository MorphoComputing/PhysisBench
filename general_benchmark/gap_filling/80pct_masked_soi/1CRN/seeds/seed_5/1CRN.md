# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CRN\seeds\seed_5\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 1.466 A
- tm_score_ca_ordered: 0.811012513525058
- heavy_atom_rmsd: 3.137 A
- sidechain_heavy_atom_rmsd: 4.138 A
- **all-atom quality (honest):** heavy 3.137 A, sidechain 4.138 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 331
- bin_accuracy: 0.825

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=42
- rigid_domain_reconvergence: applied=True accepted=12 rmsd=2.9203943138496564 -> 2.1466759504479698 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.4656652111639175
- ga_delta_rmsd: 0.2594734583418252  ga_fitness_mode: energy
- pre_local_rmsd: 1.4656396982211046  localized_anchor_rmsd: 1.4656396982211046

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.023), conflicts/hub=1.0, max_incompat=1.74Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R16** — severity 0.95, 1 conflict(s); suspect input ~`T1` (group: pull_in)
  - pull-in (wants closer): T1@11.9Å(now 14.9,conf 0.55)
  - G19↔T1: targets 5.1/11.9Å but partners are 18.7Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=12 · 3-10(G)=7 · coil(C)=8

```
EHECEGCHHHHGHHHEHHCECCHHGHHGHHEEGCHECEGEGEEC
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=6 · sheet=10
  - R9 ↔ N13  (helix)
  - S10 ↔ V14  (helix)
  - N11 ↔ C15  (helix)
  - V14 ↔ P18  (helix)
  - A23 ↔ T27  (helix)
  - A26 ↔ G30  (helix)
  - R16 ↔ C31  (sheet)
  - R16 ↔ I32  (sheet)
  - C31 ↔ P40  (sheet)
  - C31 ↔ D42  (sheet)
  - C31 ↔ Y43  (sheet)
  - I32 ↔ T38  (sheet)
  - I32 ↔ P40  (sheet)
  - I32 ↔ D42  (sheet)
  - I32 ↔ Y43  (sheet)
  - T38 ↔ Y43  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=148 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=51 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6166 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
