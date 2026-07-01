# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2KNM/sequence/2KNM.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/2KNM/seeds/seed_1/2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 3.741 A
- tm_score_ca_ordered: 0.23125894468827185
- heavy_atom_rmsd: 4.881 A
- sidechain_heavy_atom_rmsd: 5.725 A
- **all-atom quality (honest):** heavy 4.881 A, sidechain 5.725 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 65
- bin_accuracy: 0.508

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=4.456907714924297 -> 3.7684271449445927 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.7413217354669714
- ga_delta_rmsd: -0.35063351601188897  ga_fitness_mode: energy
- pre_local_rmsd: 3.7412505154388938  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I17 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=1 (frac 0.036), conflicts/hub=3.0, max_incompat=3.31Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): I17 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I17** — severity 3.93, 3 conflict(s); suspect input ~`S20` (group: push_out)
  - push-out (wants farther): S23@18.0Å(now 13.0,conf 0.55)
  - S23↔S20: targets 18.0/9.1Å but partners are 5.6Å apart → too_close_together by 3.3Å
  - S23↔C21: targets 18.0/12.6Å but partners are 3.3Å apart → too_close_together by 2.1Å
  - S23↔R28: targets 18.0/8.0Å but partners are 8.2Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=6 · 3-10(G)=5 · coil(C)=3

```
CEHGHGHHHEHHHGHEHHHGHHEGCEEC
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=8 · sheet=9
  - E5 ↔ W9  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - P11 ↔ S15  (helix)
  - I13 ↔ I17  (helix)
  - S15 ↔ C19  (helix)
  - I17 ↔ C21  (helix)
  - G18 ↔ K22  (helix)
  - P2 ↔ I10  (sheet)
  - P2 ↔ A16  (sheet)
  - I10 ↔ A16  (sheet)
  - I10 ↔ S23  (sheet)
  - I10 ↔ C26  (sheet)
  - I10 ↔ Y27  (sheet)
  - A16 ↔ S23  (sheet)
  - A16 ↔ C26  (sheet)
  - A16 ↔ Y27  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=181 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4474 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
