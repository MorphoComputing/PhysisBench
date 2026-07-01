# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_0\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 7.126 A
- tm_score_ca_ordered: 0.28226032390667644
- heavy_atom_rmsd: 8.437 A
- sidechain_heavy_atom_rmsd: 9.560 A
- **all-atom quality (honest):** heavy 8.437 A, sidechain 9.560 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 489
- bin_accuracy: 0.716

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.126414363603689
- ga_delta_rmsd: -0.7131302008892435  ga_fitness_mode: energy
- pre_local_rmsd: 7.173821493729793  localized_anchor_rmsd: 7.126392481650397

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.018), conflicts/hub=1.0, max_incompat=1.91Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D9** — severity 1.04, 1 conflict(s); suspect input ~`L6` (group: push_out)
  - push-out (wants farther): I3@14.0Å(now 10.9,conf 0.72)
  - I3↔L6: targets 14.0/8.3Å but partners are 3.7Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=29 · 3-10(G)=7 · coil(C)=5

```
EEHHGGEHEHHEHEEECEEEEEEEHHEEEEEGCEHEEGEEEGCGEEHHHHHHGCCE
```

## Backbone H-bond Network

- total=75 · helix(i→i+4)=3 · sheet=72
  - C4 ↔ K8  (helix)
  - Q47 ↔ E51  (helix)
  - K48 ↔ K52  (helix)
  - D2 ↔ P7  (sheet)
  - D2 ↔ Y21  (sheet)
  - D2 ↔ Y22  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - P7 ↔ Y22  (sheet)
  - P7 ↔ D23  (sheet)
  - P7 ↔ P24  (sheet)
  - D9 ↔ R14  (sheet)
  - D9 ↔ D15  (sheet)
  - D9 ↔ F16  (sheet)
  - D9 ↔ L18  (sheet)
  - D9 ↔ K19  (sheet)
  - D9 ↔ W20  (sheet)
  - D9 ↔ Y21  (sheet)
  - R14 ↔ Y34  (sheet)
  - D15 ↔ Y34  (sheet)
  - … +55 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=214 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=121 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9296 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
